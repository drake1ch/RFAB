@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "REPO_URL=https://github.com/drake1ch/RFAB.git"
set "BRANCH=main"
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%.") do set "BASE_DIR=%%~fI"
set "GIT_EXE=%BASE_DIR%\PortableGit\cmd\git.exe"

if not exist "%GIT_EXE%" (
  echo [ERROR] Portable Git was not found:
  echo   "%GIT_EXE%"
  pause
  exit /b 1
)

pushd "%BASE_DIR%" >nul || (
  echo [ERROR] Failed to switch to folder:
  echo   "%BASE_DIR%"
  pause
  exit /b 1
)

echo [1/7] Checking git metadata...
if not exist ".git\HEAD" (
  echo Initializing repository...
  "%GIT_EXE%" init -b %BRANCH% || goto :fail
) else (
  echo Repository metadata found.
)

echo [2/7] Configuring origin...
"%GIT_EXE%" config core.longpaths true >nul
"%GIT_EXE%" config credential.helper "" >nul 2>nul
"%GIT_EXE%" remote get-url origin >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" remote add origin "%REPO_URL%" || goto :fail
) else (
  "%GIT_EXE%" remote set-url origin "%REPO_URL%" || goto :fail
)

echo [3/7] Fetching latest branch metadata...
"%GIT_EXE%" -c credential.helper= fetch --prune origin "%BRANCH%" || goto :fail

echo [4/7] Preparing local branch...
"%GIT_EXE%" update-ref "refs/heads/%BRANCH%" "refs/remotes/origin/%BRANCH%" || goto :fail
"%GIT_EXE%" symbolic-ref HEAD "refs/heads/%BRANCH%" || goto :fail
"%GIT_EXE%" branch --set-upstream-to="origin/%BRANCH%" "%BRANCH%" >nul 2>nul

echo [5/7] Applying repository files...
rem Do not touch PortableGit while this updater is running from it.
"%GIT_EXE%" restore --source="refs/heads/%BRANCH%" --staged --worktree -- ^
  . ^
  ":(exclude)PortableGit/**" ^
  ":(exclude)Update-RFAB.bat" ^
  ":(exclude)MO2/overwrite/**" ^
  ":(exclude)MO2/profiles/**" || goto :fail

echo [6/7] Seeding MO2 profile template...
if not exist "MO2\profiles" (
  if exist "MO2\profile-template\*" (
    xcopy "MO2\profile-template\*" "MO2\profiles\" /E /I /Q /Y >nul || goto :fail
    echo Default MO2 profile created.
  ) else (
    echo No profile template found. Skipping.
  )
) else (
  echo Existing MO2 profiles found. Leaving them untouched.
)

echo [7/7] Pulling LFS content...
"%GIT_EXE%" lfs install --local >nul 2>nul
"%GIT_EXE%" -c credential.helper= lfs pull origin %BRANCH% || goto :fail

set "EXIT_CODE=0"

popd >nul

if not "%EXIT_CODE%"=="0" (
  echo.
  echo [ERROR] Update failed with exit code %EXIT_CODE%.
  pause
  exit /b %EXIT_CODE%
)

echo.
echo Done.
pause
exit /b 0

:fail
set "EXIT_CODE=%ERRORLEVEL%"
popd >nul 2>nul
echo.
echo [ERROR] Update failed with exit code %EXIT_CODE%.
pause
exit /b %EXIT_CODE%

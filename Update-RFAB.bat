@echo off
setlocal EnableExtensions DisableDelayedExpansion

if /I "%~1"=="--run" goto :run
start "" cmd /c ""%~f0" --run"
exit /b 0

:run
set "REPO_URL=https://github.com/drake1ch/RFAB.git"
set "BRANCH=main"
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%.") do set "BASE_DIR=%%~fI"
set "GIT_EXE=%BASE_DIR%\PortableGit\cmd\git.exe"
set "INSTRUCTIONS_FILE=%BASE_DIR%\Update-RFAB.instructions.txt"
set "TEMP_SCRIPT=%TEMP%\rfab-update-instructions-%RANDOM%-%RANDOM%.cmd"
set "REMOTE_INSTRUCTIONS=%TEMP%\rfab-update-instructions-remote-%RANDOM%-%RANDOM%.txt"
set "GIT_DIR="
set "GIT_WORK_TREE="
set "REPO_KEY=%BASE_DIR%"
set "REPO_KEY=%REPO_KEY::=%"
set "REPO_KEY=%REPO_KEY:\=_%"
set "REPO_KEY=%REPO_KEY:/=_%"
set "REPO_KEY=%REPO_KEY: =_%"
set "REPO_KEY=%REPO_KEY:(=_%"
set "REPO_KEY=%REPO_KEY:)=_%"
set "REPO_KEY=%REPO_KEY:&=_%"
set "REPO_KEY=%REPO_KEY:;=_%"
set "FALLBACK_GIT_DIR=%LOCALAPPDATA%\RFAB\git\%REPO_KEY%"

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

echo [1/3] Checking and updating instructions...
call :ensure_git_metadata || goto :fail
"%GIT_EXE%" config core.longpaths true >nul
"%GIT_EXE%" config credential.helper "" >nul 2>nul
"%GIT_EXE%" remote get-url origin >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" remote add origin "%REPO_URL%" || goto :fail
) else (
  "%GIT_EXE%" remote set-url origin "%REPO_URL%" || goto :fail
)
"%GIT_EXE%" -c credential.helper= fetch --prune origin "%BRANCH%" || goto :fail
call :refresh_instructions || goto :fail

echo [2/3] Preparing temporary instructions script...
copy /Y "%INSTRUCTIONS_FILE%" "%TEMP_SCRIPT%" >nul || goto :fail

echo [3/3] Running update instructions...
call "%TEMP_SCRIPT%"
set "EXIT_CODE=%ERRORLEVEL%"

popd >nul
if exist "%TEMP_SCRIPT%" del /q "%TEMP_SCRIPT%" >nul 2>nul
if exist "%REMOTE_INSTRUCTIONS%" del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul

if not "%EXIT_CODE%"=="0" (
  echo.
  echo [ERROR] Update failed with exit code %EXIT_CODE%.
  pause
)
exit /b %EXIT_CODE%

:refresh_instructions
"%GIT_EXE%" show "refs/remotes/origin/%BRANCH%:Update-RFAB.instructions.txt" > "%REMOTE_INSTRUCTIONS%" 2>nul
if errorlevel 1 (
  if exist "%INSTRUCTIONS_FILE%" (
    echo Remote instructions were not found. Using local file.
    if exist "%REMOTE_INSTRUCTIONS%" del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul
    exit /b 0
  )
  echo [ERROR] Instructions file not found in repository:
  echo   "Update-RFAB.instructions.txt"
  if exist "%REMOTE_INSTRUCTIONS%" del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul
  exit /b 1
)

if not exist "%INSTRUCTIONS_FILE%" (
  copy /Y "%REMOTE_INSTRUCTIONS%" "%INSTRUCTIONS_FILE%" >nul || exit /b 1
  del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul
  echo Instructions file created from repository.
  exit /b 0
)

fc /b "%REMOTE_INSTRUCTIONS%" "%INSTRUCTIONS_FILE%" >nul 2>nul
if errorlevel 2 (
  copy /Y "%REMOTE_INSTRUCTIONS%" "%INSTRUCTIONS_FILE%" >nul || exit /b 1
  del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul
  echo Instructions file updated from repository.
  exit /b 0
)

if errorlevel 1 (
  copy /Y "%REMOTE_INSTRUCTIONS%" "%INSTRUCTIONS_FILE%" >nul || exit /b 1
  echo Instructions file updated from repository.
) else (
  echo Instructions file already up to date.
)

del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul
exit /b 0

:ensure_git_metadata
if exist ".git\HEAD" (
  set "GIT_DIR="
  set "GIT_WORK_TREE="
  goto :eof
)

if exist "%FALLBACK_GIT_DIR%\HEAD" (
  set "GIT_DIR=%FALLBACK_GIT_DIR%"
  set "GIT_WORK_TREE=%BASE_DIR%"
  goto :eof
)

"%GIT_EXE%" init -b %BRANCH% >nul 2>nul
if not errorlevel 1 (
  set "GIT_DIR="
  set "GIT_WORK_TREE="
  goto :eof
)

if not exist "%FALLBACK_GIT_DIR%" mkdir "%FALLBACK_GIT_DIR%" || exit /b 1
set "GIT_DIR=%FALLBACK_GIT_DIR%"
set "GIT_WORK_TREE=%BASE_DIR%"
if not exist "%GIT_DIR%\HEAD" "%GIT_EXE%" init -b %BRANCH% || exit /b 1
goto :eof

:fail
set "EXIT_CODE=%ERRORLEVEL%"
popd >nul 2>nul
if exist "%TEMP_SCRIPT%" del /q "%TEMP_SCRIPT%" >nul 2>nul
if exist "%REMOTE_INSTRUCTIONS%" del /q "%REMOTE_INSTRUCTIONS%" >nul 2>nul
echo.
echo [ERROR] Failed to start update. Exit code %EXIT_CODE%.
pause
exit /b %EXIT_CODE%

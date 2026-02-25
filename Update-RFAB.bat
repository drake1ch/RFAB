@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "REPO_URL=https://github.com/drake1ch/RFAB.git"
set "BRANCH=main"
set "CACHE_FOLDER=.rfab-updater"

if /I "%~1"=="--help" goto :help

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%.") do set "BASE_DIR=%%~fI"
set "CACHE_DIR=%BASE_DIR%\%CACHE_FOLDER%"
set "CACHE_REPO=%CACHE_DIR%\repo"

call :locate_portable_git || goto :fail

if not exist "%CACHE_DIR%" mkdir "%CACHE_DIR%" || goto :fail
attrib +h "%CACHE_DIR%" >nul 2>nul

if not exist "%CACHE_REPO%\.git" (
  echo [1/5] Creating local update cache...
  "%GIT_EXE%" -c credential.helper=manager clone --branch "%BRANCH%" "%REPO_URL%" "%CACHE_REPO%" || goto :fail
) else (
  echo [1/5] Update cache found.
)

echo [2/5] Fetching latest changes...
"%GIT_EXE%" -C "%CACHE_REPO%" remote set-url origin "%REPO_URL%" >nul 2>nul
"%GIT_EXE%" -C "%CACHE_REPO%" config core.longpaths true >nul
"%GIT_EXE%" -C "%CACHE_REPO%" config credential.helper manager >nul
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" fetch --prune origin "%BRANCH%" || goto :fail
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" checkout -q "%BRANCH%" >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" checkout -q -B "%BRANCH%" "origin/%BRANCH%" || goto :fail
)
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" reset --hard "origin/%BRANCH%" || goto :fail

echo [3/5] Updating Git LFS objects...
"%GIT_EXE%" -C "%CACHE_REPO%" lfs install --local >nul 2>nul
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" lfs pull origin "%BRANCH%" || goto :fail

echo [4/5] Checking files and copying only changed ones...
robocopy "%CACHE_REPO%" "%BASE_DIR%" /E /R:2 /W:1 /COPY:DAT /DCOPY:DAT /XJ /NFL /NDL /NP /XD ".git" ".rfab-updater" /XF "Update-RFAB.bat" >nul
set "ROBOCODE=%ERRORLEVEL%"
if %ROBOCODE% GEQ 8 goto :robofail

echo [5/5] Done.
echo Only changed files were updated.
echo Non-repository files are left untouched.
if %ROBOCODE% EQU 0 echo Already up to date.
if not %ROBOCODE% EQU 0 if not %ROBOCODE% EQU 1 echo Updated files detected.
echo NOTE: Update-RFAB.bat updates are applied on next run.
pause
exit /b 0

:locate_portable_git
set "GIT_EXE="
if exist "%BASE_DIR%\PortableGit\cmd\git.exe" set "GIT_EXE=%BASE_DIR%\PortableGit\cmd\git.exe"
if not defined GIT_EXE if exist "%BASE_DIR%\PortableGit\bin\git.exe" set "GIT_EXE=%BASE_DIR%\PortableGit\bin\git.exe"
if not defined GIT_EXE if exist "%BASE_DIR%\git\cmd\git.exe" set "GIT_EXE=%BASE_DIR%\git\cmd\git.exe"
if not defined GIT_EXE if exist "%BASE_DIR%\git\bin\git.exe" set "GIT_EXE=%BASE_DIR%\git\bin\git.exe"
if defined GIT_EXE exit /b 0

echo [ERROR] Portable Git was not found next to this bat file.
echo Expected one of these paths:
echo   "%BASE_DIR%\PortableGit\cmd\git.exe"
echo   "%BASE_DIR%\PortableGit\bin\git.exe"
echo   "%BASE_DIR%\git\cmd\git.exe"
echo   "%BASE_DIR%\git\bin\git.exe"
exit /b 1

:help
echo Usage:
echo   Update-RFAB.bat
echo.
echo Requirements:
echo   1) This bat file is in the build root folder.
echo   2) Portable Git is next to it (folder "PortableGit" or "git").
echo   3) Internet access and access to "%REPO_URL%".
exit /b 0

:fail
echo.
echo [ERROR] Update failed.
pause
exit /b 1

:robofail
echo.
echo [ERROR] File sync failed (robocopy code %ROBOCODE%).
pause
exit /b 1

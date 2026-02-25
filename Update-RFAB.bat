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
  echo [1/4] Creating local update cache...
  "%GIT_EXE%" -c credential.helper=manager clone --branch "%BRANCH%" "%REPO_URL%" "%CACHE_REPO%" || goto :fail
) else (
  echo [1/4] Update cache found.
)

echo [2/4] Fetching latest changes...
"%GIT_EXE%" -C "%CACHE_REPO%" remote set-url origin "%REPO_URL%" >nul 2>nul
"%GIT_EXE%" -C "%CACHE_REPO%" config core.longpaths true >nul
"%GIT_EXE%" -C "%CACHE_REPO%" config credential.helper manager >nul
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" fetch --prune origin "%BRANCH%" || goto :fail
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" checkout -q "%BRANCH%" >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" checkout -q -B "%BRANCH%" "origin/%BRANCH%" || goto :fail
)
"%GIT_EXE%" -c credential.helper=manager -C "%CACHE_REPO%" reset --hard "origin/%BRANCH%" || goto :fail

echo [3/4] Applying update in "%BASE_DIR%"...
"%GIT_EXE%" --git-dir="%CACHE_REPO%\.git" --work-tree="%BASE_DIR%" -c core.longpaths=true reset --hard "origin/%BRANCH%" || goto :fail

echo [4/4] Done.
echo Non-repository files are left untouched.
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

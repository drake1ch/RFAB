@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "REPO_URL=https://github.com/drake1ch/RFAB.git"
set "BRANCH=main"
set "CACHE_FOLDER=.rfab-updater"

if /I "%~1"=="--help" goto :help

set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%.") do set "BASE_DIR=%%~fI"
set "CACHE_DIR=%BASE_DIR%\%CACHE_FOLDER%"
set "CACHE_GIT=%CACHE_DIR%\repo.git"

call :locate_portable_git || goto :fail

if not exist "%CACHE_DIR%" mkdir "%CACHE_DIR%" || goto :fail
attrib +h "%CACHE_DIR%" >nul 2>nul

if not exist "%CACHE_GIT%\HEAD" (
  echo [1/5] Creating local git metadata...
  "%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" init || goto :fail
) else (
  echo [1/5] Local git metadata found.
)

echo [2/5] Fetching latest changes...
"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" config core.longpaths true >nul
"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" config credential.helper manager >nul
"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" config core.autocrlf false >nul

"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" remote get-url origin >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" remote add origin "%REPO_URL%" || goto :fail
) else (
  "%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" remote set-url origin "%REPO_URL%" || goto :fail
)

"%GIT_EXE%" -c credential.helper=manager --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" fetch --prune origin "%BRANCH%" || goto :fail

echo [3/5] Applying fetched revision...
"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" checkout -q -B "%BRANCH%" "origin/%BRANCH%" || goto :fail
"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" reset --hard "origin/%BRANCH%" || goto :fail

echo [4/5] Updating Git LFS objects...
"%GIT_EXE%" --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" lfs install --local >nul 2>nul
"%GIT_EXE%" -c credential.helper=manager --git-dir="%CACHE_GIT%" --work-tree="%BASE_DIR%" lfs pull origin "%BRANCH%" || goto :fail

echo [5/5] Done.
echo Updated using git fetch/reset (changed files only).
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

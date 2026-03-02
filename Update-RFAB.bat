@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "REPO_URL=https://github.com/drake1ch/RFAB.git"
set "BRANCH=main"
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%.") do set "BASE_DIR=%%~fI"
set "GIT_EXE=%BASE_DIR%\PortableGit\cmd\git.exe"
set "STATE_BACKUP_DIR=%TEMP%\rfab-updater-state-%RANDOM%-%RANDOM%"

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

echo [1/9] Preserving local user settings...
call :backup_state || goto :fail

echo [2/9] Checking git metadata...
if not exist ".git\HEAD" (
  echo Initializing repository...
  "%GIT_EXE%" init -b %BRANCH% || goto :fail
) else (
  echo Repository metadata found.
)

echo [3/9] Configuring origin...
"%GIT_EXE%" config core.longpaths true >nul
"%GIT_EXE%" config credential.helper "" >nul 2>nul
"%GIT_EXE%" remote get-url origin >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" remote add origin "%REPO_URL%" || goto :fail
) else (
  "%GIT_EXE%" remote set-url origin "%REPO_URL%" || goto :fail
)

echo [4/9] Fetching latest branch metadata...
"%GIT_EXE%" -c credential.helper= fetch --prune origin "%BRANCH%" || goto :fail

echo [5/9] Preparing local branch...
"%GIT_EXE%" update-ref "refs/heads/%BRANCH%" "refs/remotes/origin/%BRANCH%" || goto :fail
"%GIT_EXE%" symbolic-ref HEAD "refs/heads/%BRANCH%" || goto :fail
"%GIT_EXE%" branch --set-upstream-to="origin/%BRANCH%" "%BRANCH%" >nul 2>nul

echo [6/9] Applying repository files...
rem Do not touch PortableGit while this updater is running from it.
"%GIT_EXE%" restore --source="refs/heads/%BRANCH%" --staged --worktree -- ^
  . ^
  ":(exclude)PortableGit/**" ^
  ":(exclude)Update-RFAB.bat" ^
  ":(exclude,literal)MO2/ModOrganizer.exe" ^
  ":(exclude,literal)MO2/ModOrganizer.ini" ^
  ":(exclude)MO2/overwrite/**" ^
  ":(exclude)MO2/profiles/**" ^
  ":(exclude,literal)MO2/logs/mo_interface.log" ^
  ":(exclude,literal)RFAB Launcher/RFAB Launcher Updater.exe" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/dtryKeyUtil/config/settings.ini" ^
  ":(exclude,literal)MO2/mods/[RFAB] Interface/MCM/Config/SkyUI_SE/settings.ini" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/StorageUtilData/RFAB_MCM_Settings.json" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/StorageUtilData/RFAB_XP_Settings.json" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/[RFAB] Dodge.ini" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/[RFAB] Extended Hotkeys.ini" ^
  ":(exclude,literal)MO2/mods/[RFAB] Interface/MCM/Settings/SkyUI_SE.ini" || goto :fail

echo [7/9] Seeding MO2 profile template...
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

echo [8/9] Seeding mod settings templates...
call :seed_file "MO2\program-template\ModOrganizer.exe" "MO2\ModOrganizer.exe" "Mod Organizer" || goto :fail
call :seed_file "MO2\config-template\ModOrganizer.ini" "MO2\ModOrganizer.ini" "Mod Organizer config" || goto :fail
call :seed_file "MO2\settings-template\RFAB\settings.ini" "MO2\mods\RFAB\SKSE\Plugins\dtryKeyUtil\config\settings.ini" "RFAB settings" || goto :fail
call :seed_file "MO2\settings-template\SkyUI_SE\settings.ini" "MO2\mods\[RFAB] Interface\MCM\Config\SkyUI_SE\settings.ini" "SkyUI settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\RFAB_MCM_Settings.json" "MO2\mods\RFAB\SKSE\Plugins\StorageUtilData\RFAB_MCM_Settings.json" "RFAB MCM settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\RFAB_XP_Settings.json" "MO2\mods\RFAB\SKSE\Plugins\StorageUtilData\RFAB_XP_Settings.json" "RFAB XP settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\[RFAB] Dodge.ini" "MO2\mods\RFAB\SKSE\Plugins\[RFAB] Dodge.ini" "RFAB Dodge settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\[RFAB] Extended Hotkeys.ini" "MO2\mods\RFAB\SKSE\Plugins\[RFAB] Extended Hotkeys.ini" "RFAB hotkeys settings" || goto :fail
call :seed_file "MO2\settings-template\SkyUI_SE\SkyUI_SE.ini" "MO2\mods\[RFAB] Interface\MCM\Settings\SkyUI_SE.ini" "SkyUI MCM settings" || goto :fail

echo [9/9] Pulling LFS content...
"%GIT_EXE%" lfs install --local >nul 2>nul
"%GIT_EXE%" -c credential.helper= lfs pull origin %BRANCH% || goto :fail

echo Restoring local user settings...
call :restore_state || goto :fail

set "EXIT_CODE=0"

popd >nul
if exist "%STATE_BACKUP_DIR%" rmdir /s /q "%STATE_BACKUP_DIR%" >nul 2>nul

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

:backup_state
setlocal
call :backup_tree "MO2\profiles" "%STATE_BACKUP_DIR%\MO2\profiles" || exit /b 1
call :backup_file "MO2\ModOrganizer.ini" "%STATE_BACKUP_DIR%\MO2\ModOrganizer.ini" || exit /b 1
call :backup_file "%USERPROFILE%\Documents\My Games\Skyrim Special Edition\Skyrim.ini" "%STATE_BACKUP_DIR%\UserDocs\Skyrim.ini" || exit /b 1
call :backup_file "%USERPROFILE%\Documents\My Games\Skyrim Special Edition\SkyrimPrefs.ini" "%STATE_BACKUP_DIR%\UserDocs\SkyrimPrefs.ini" || exit /b 1
call :backup_file "%USERPROFILE%\Documents\My Games\Skyrim Special Edition\SkyrimCustom.ini" "%STATE_BACKUP_DIR%\UserDocs\SkyrimCustom.ini" || exit /b 1
exit /b 0

:restore_state
setlocal
call :restore_tree "%STATE_BACKUP_DIR%\MO2\profiles" "MO2\profiles" || exit /b 1
call :restore_file "%STATE_BACKUP_DIR%\MO2\ModOrganizer.ini" "MO2\ModOrganizer.ini" || exit /b 1
call :restore_file "%STATE_BACKUP_DIR%\UserDocs\Skyrim.ini" "%USERPROFILE%\Documents\My Games\Skyrim Special Edition\Skyrim.ini" || exit /b 1
call :restore_file "%STATE_BACKUP_DIR%\UserDocs\SkyrimPrefs.ini" "%USERPROFILE%\Documents\My Games\Skyrim Special Edition\SkyrimPrefs.ini" || exit /b 1
call :restore_file "%STATE_BACKUP_DIR%\UserDocs\SkyrimCustom.ini" "%USERPROFILE%\Documents\My Games\Skyrim Special Edition\SkyrimCustom.ini" || exit /b 1
exit /b 0

:backup_tree
setlocal
set "SOURCE_DIR=%~1"
set "BACKUP_DIR=%~2"

if not exist "%SOURCE_DIR%\*" exit /b 0
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" || exit /b 1
xcopy "%SOURCE_DIR%\*" "%BACKUP_DIR%\" /E /I /Q /Y >nul || exit /b 1
exit /b 0

:restore_tree
setlocal
set "BACKUP_DIR=%~1"
set "TARGET_DIR=%~2"

if not exist "%BACKUP_DIR%\*" exit /b 0
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%" || exit /b 1
xcopy "%BACKUP_DIR%\*" "%TARGET_DIR%\" /E /I /Q /Y >nul || exit /b 1
exit /b 0

:backup_file
setlocal
set "SOURCE_FILE=%~1"
set "BACKUP_FILE=%~2"

if not exist "%SOURCE_FILE%" exit /b 0
for %%I in ("%BACKUP_FILE%") do set "BACKUP_DIR=%%~dpI"
if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%" || exit /b 1
copy /Y "%SOURCE_FILE%" "%BACKUP_FILE%" >nul || exit /b 1
exit /b 0

:restore_file
setlocal
set "BACKUP_FILE=%~1"
set "TARGET_FILE=%~2"

if not exist "%BACKUP_FILE%" exit /b 0
for %%I in ("%TARGET_FILE%") do set "TARGET_DIR=%%~dpI"
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%" || exit /b 1
copy /Y "%BACKUP_FILE%" "%TARGET_FILE%" >nul || exit /b 1
exit /b 0

:seed_file
setlocal
set "SOURCE_FILE=%~1"
set "TARGET_FILE=%~2"
set "LABEL=%~3"

if exist "%TARGET_FILE%" (
  echo %LABEL% found. Leaving untouched.
  exit /b 0
)

if not exist "%SOURCE_FILE%" (
  echo %LABEL% template not found. Skipping.
  exit /b 0
)

for %%I in ("%TARGET_FILE%") do set "TARGET_DIR=%%~dpI"
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%" || exit /b 1

copy /Y "%SOURCE_FILE%" "%TARGET_FILE%" >nul || exit /b 1
echo %LABEL% created.
exit /b 0

:fail
set "EXIT_CODE=%ERRORLEVEL%"
call :restore_state >nul 2>nul
if exist "%STATE_BACKUP_DIR%" rmdir /s /q "%STATE_BACKUP_DIR%" >nul 2>nul
popd >nul 2>nul
echo.
echo [ERROR] Update failed with exit code %EXIT_CODE%.
pause
exit /b %EXIT_CODE%

@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "REPO_URL=https://github.com/drake1ch/RFAB.git"
set "BRANCH=main"
set "SCRIPT_DIR=%~dp0"
for %%I in ("%SCRIPT_DIR%.") do set "BASE_DIR=%%~fI"
set "GIT_EXE=%BASE_DIR%\PortableGit\cmd\git.exe"
set "PROFILE_SNAPSHOT_DIR=%TEMP%\rfab-updater-profiles-%RANDOM%-%RANDOM%"
set "SELF_UPDATED="
if /I "%~1"=="--self-updated" set "SELF_UPDATED=1"
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

echo [1/10] Capturing local MO2 profile lists...
call :snapshot_profile_lists || goto :fail

echo [2/10] Checking git metadata...
call :ensure_git_metadata || goto :fail

echo [3/10] Configuring origin...
"%GIT_EXE%" config core.longpaths true >nul
"%GIT_EXE%" config credential.helper "" >nul 2>nul
"%GIT_EXE%" remote get-url origin >nul 2>nul
if errorlevel 1 (
  "%GIT_EXE%" remote add origin "%REPO_URL%" || goto :fail
) else (
  "%GIT_EXE%" remote set-url origin "%REPO_URL%" || goto :fail
)

echo [4/10] Fetching latest branch metadata...
"%GIT_EXE%" -c credential.helper= fetch --prune origin "%BRANCH%" || goto :fail

echo [5/10] Checking updater script...
call :self_update_if_needed
if "%ERRORLEVEL%"=="10" goto :handoff
if errorlevel 1 goto :fail

echo [6/10] Preparing local branch...
"%GIT_EXE%" update-ref "refs/heads/%BRANCH%" "refs/remotes/origin/%BRANCH%" || goto :fail
"%GIT_EXE%" symbolic-ref HEAD "refs/heads/%BRANCH%" || goto :fail
"%GIT_EXE%" branch --set-upstream-to="origin/%BRANCH%" "%BRANCH%" >nul 2>nul

echo [7/10] Applying repository files...
rem Do not touch PortableGit while this updater is running from it.
"%GIT_EXE%" restore --source="refs/heads/%BRANCH%" --staged --worktree -- ^
  . ^
  ":(exclude)PortableGit/**" ^
  ":(exclude)Update-RFAB.bat" ^
  ":(exclude,literal)MO2/ModOrganizer.exe" ^
  ":(exclude,literal)MO2/ModOrganizer.ini" ^
  ":(exclude)MO2/overwrite/**" ^
  ":(exclude,literal)MO2/logs/mo_interface.log" ^
  ":(exclude,literal)RFAB Launcher/RFAB Launcher Updater.exe" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/dtryKeyUtil/config/settings.ini" ^
  ":(exclude,literal)MO2/mods/[RFAB] Interface/MCM/Config/SkyUI_SE/settings.ini" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/StorageUtilData/RFAB_MCM_Settings.json" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/StorageUtilData/RFAB_XP_Settings.json" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/[RFAB] Dodge.ini" ^
  ":(exclude,literal)MO2/mods/RFAB/SKSE/Plugins/[RFAB] Extended Hotkeys.ini" ^
  ":(exclude,literal)MO2/mods/[RFAB] Interface/MCM/Settings/SkyUI_SE.ini" || goto :fail

echo [8/10] Merging MO2 profile lists...
call :merge_profile_lists || goto :fail

echo [9/10] Seeding mod settings templates...
call :seed_file "MO2\program-template\ModOrganizer.exe" "MO2\ModOrganizer.exe" "Mod Organizer" || goto :fail
call :seed_file "MO2\config-template\ModOrganizer.ini" "MO2\ModOrganizer.ini" "Mod Organizer config" || goto :fail
call :seed_file "MO2\settings-template\RFAB\settings.ini" "MO2\mods\RFAB\SKSE\Plugins\dtryKeyUtil\config\settings.ini" "RFAB settings" || goto :fail
call :seed_file "MO2\settings-template\SkyUI_SE\settings.ini" "MO2\mods\[RFAB] Interface\MCM\Config\SkyUI_SE\settings.ini" "SkyUI settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\RFAB_MCM_Settings.json" "MO2\mods\RFAB\SKSE\Plugins\StorageUtilData\RFAB_MCM_Settings.json" "RFAB MCM settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\RFAB_XP_Settings.json" "MO2\mods\RFAB\SKSE\Plugins\StorageUtilData\RFAB_XP_Settings.json" "RFAB XP settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\[RFAB] Dodge.ini" "MO2\mods\RFAB\SKSE\Plugins\[RFAB] Dodge.ini" "RFAB Dodge settings" || goto :fail
call :seed_file "MO2\settings-template\RFAB\[RFAB] Extended Hotkeys.ini" "MO2\mods\RFAB\SKSE\Plugins\[RFAB] Extended Hotkeys.ini" "RFAB hotkeys settings" || goto :fail
call :seed_file "MO2\settings-template\SkyUI_SE\SkyUI_SE.ini" "MO2\mods\[RFAB] Interface\MCM\Settings\SkyUI_SE.ini" "SkyUI MCM settings" || goto :fail

echo [10/10] Pulling LFS content...
"%GIT_EXE%" lfs install --local >nul 2>nul
"%GIT_EXE%" -c credential.helper= lfs pull origin %BRANCH% || goto :fail

set "EXIT_CODE=0"

popd >nul
if exist "%PROFILE_SNAPSHOT_DIR%" rmdir /s /q "%PROFILE_SNAPSHOT_DIR%" >nul 2>nul

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

:handoff
popd >nul 2>nul
if exist "%PROFILE_SNAPSHOT_DIR%" rmdir /s /q "%PROFILE_SNAPSHOT_DIR%" >nul 2>nul
echo A newer updater version was found. Restarting...
exit /b 0

:self_update_if_needed
setlocal
if defined SELF_UPDATED (
  echo Running the restarted updater instance.
  exit /b 0
)

set "REMOTE_UPDATER=%TEMP%\rfab-updater-new-%RANDOM%-%RANDOM%.bat"
"%GIT_EXE%" show "refs/remotes/origin/%BRANCH%:Update-RFAB.bat" > "%REMOTE_UPDATER%" 2>nul
if errorlevel 1 (
  if exist "%REMOTE_UPDATER%" del /q "%REMOTE_UPDATER%" >nul 2>nul
  echo Remote updater file not found. Skipping self-update.
  exit /b 0
)

fc /b "%REMOTE_UPDATER%" "%~f0" >nul 2>nul
if errorlevel 2 (
  del /q "%REMOTE_UPDATER%" >nul 2>nul
  echo Could not compare updater files. Skipping self-update.
  exit /b 0
)

if errorlevel 1 (
  start "" cmd /c "ping 127.0.0.1 -n 2 >nul & copy /Y ""%REMOTE_UPDATER%"" ""%~f0"" >nul && del /q ""%REMOTE_UPDATER%"" >nul 2>nul && call ""%~f0"" --self-updated"
  if errorlevel 1 (
    del /q "%REMOTE_UPDATER%" >nul 2>nul
    echo Failed to restart updater after self-update.
    exit /b 1
  )
  exit /b 10
)

del /q "%REMOTE_UPDATER%" >nul 2>nul
echo Updater is already up to date.
exit /b 0

:ensure_git_metadata
if exist ".git\HEAD" (
  set "GIT_DIR="
  set "GIT_WORK_TREE="
  echo Repository metadata found.
  goto :eof
)

if exist "%FALLBACK_GIT_DIR%\HEAD" (
  set "GIT_DIR=%FALLBACK_GIT_DIR%"
  set "GIT_WORK_TREE=%BASE_DIR%"
  echo Per-user git metadata found.
  goto :eof
)

echo Initializing repository...
"%GIT_EXE%" init -b %BRANCH% >nul 2>nul
if not errorlevel 1 (
  set "GIT_DIR="
  set "GIT_WORK_TREE="
  echo Local git metadata initialized.
  goto :eof
)

echo Local .git metadata is not writable. Falling back to per-user metadata.
if not exist "%FALLBACK_GIT_DIR%" mkdir "%FALLBACK_GIT_DIR%" || exit /b 1

set "GIT_DIR=%FALLBACK_GIT_DIR%"
set "GIT_WORK_TREE=%BASE_DIR%"

if not exist "%GIT_DIR%\HEAD" (
  "%GIT_EXE%" init -b %BRANCH% || exit /b 1
  echo Per-user git metadata initialized.
) else (
  echo Per-user git metadata found.
)
goto :eof

:snapshot_profile_lists
setlocal
if not exist "MO2\profiles\*" (
  echo No existing MO2 profiles found.
  exit /b 0
)

set "COPIED_ANY="
for /d %%P in ("MO2\profiles\*") do (
  if exist "%%~fP\modlist.txt" (
    if not exist "%PROFILE_SNAPSHOT_DIR%\%%~nxP" mkdir "%PROFILE_SNAPSHOT_DIR%\%%~nxP" || exit /b 1
    copy /Y "%%~fP\modlist.txt" "%PROFILE_SNAPSHOT_DIR%\%%~nxP\modlist.txt" >nul || exit /b 1
    set "COPIED_ANY=1"
  )
  if exist "%%~fP\loadorder.txt" (
    if not exist "%PROFILE_SNAPSHOT_DIR%\%%~nxP" mkdir "%PROFILE_SNAPSHOT_DIR%\%%~nxP" || exit /b 1
    copy /Y "%%~fP\loadorder.txt" "%PROFILE_SNAPSHOT_DIR%\%%~nxP\loadorder.txt" >nul || exit /b 1
    set "COPIED_ANY=1"
  )
)

if defined COPIED_ANY (
  echo Existing MO2 profile lists captured.
) else (
  echo No local modlist/loadorder files found.
)
exit /b 0

:merge_profile_lists
setlocal
if not exist "%PROFILE_SNAPSHOT_DIR%\*" (
  echo No previous MO2 profile lists to merge.
  exit /b 0
)

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference = 'Stop';" ^
  "$profiles = Join-Path $env:BASE_DIR 'MO2\profiles';" ^
  "$snapshot = $env:PROFILE_SNAPSHOT_DIR;" ^
  "$enc = New-Object System.Text.UTF8Encoding($false);" ^
  "function RL([string]$p){ if (Test-Path -LiteralPath $p) { [System.IO.File]::ReadAllLines($p) } else { @() } };" ^
  "function WL([string]$p, [string[]]$l){ $d = Split-Path -Path $p -Parent; if ($d -and -not (Test-Path -LiteralPath $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }; [System.IO.File]::WriteAllLines($p, $l, $enc) };" ^
  "function MM([string]$c, [string]$u){ $cl = RL $c; $ul = RL $u; $mods = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::OrdinalIgnoreCase); $out = New-Object 'System.Collections.Generic.List[string]'; foreach ($line in $cl) { $out.Add($line) | Out-Null; if ($line -match '^[\+\-]\s*(.+)$') { $n = $matches[1].Trim(); if ($n) { $mods.Add($n) | Out-Null } } }; foreach ($line in $ul) { if ($line -match '^[\+\-]\s*(.+)$') { $n = $matches[1].Trim(); if ($n -and -not $mods.Contains($n)) { $out.Add($line) | Out-Null; $mods.Add($n) | Out-Null } } }; WL $c $out.ToArray() };" ^
  "function ML([string]$c, [string]$u){ $cl = RL $c; $ul = RL $u; $seen = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::OrdinalIgnoreCase); $out = New-Object 'System.Collections.Generic.List[string]'; foreach ($line in $cl) { $e = $line.Trim(); if ($e -and $seen.Add($e)) { $out.Add($e) | Out-Null } }; foreach ($line in $ul) { $e = $line.Trim(); if ($e -and $seen.Add($e)) { $out.Add($e) | Out-Null } }; WL $c $out.ToArray() };" ^
  "Get-ChildItem -Path $snapshot -Recurse -File | Where-Object { $_.Name -ieq 'modlist.txt' -or $_.Name -ieq 'loadorder.txt' } | ForEach-Object { $rel = $_.FullName.Substring($snapshot.Length).TrimStart('\'); $target = Join-Path $profiles $rel; $name = [System.IO.Path]::GetFileName($target); if (-not (Test-Path -LiteralPath $target)) { $dir = Split-Path -Path $target -Parent; if ($dir -and -not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Path $dir -Force | Out-Null }; Copy-Item -LiteralPath $_.FullName -Destination $target -Force; return }; if ($name -ieq 'modlist.txt') { MM $target $_.FullName; return }; if ($name -ieq 'loadorder.txt') { ML $target $_.FullName } }" || exit /b 1

echo MO2 profile lists merged.
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
if exist "%PROFILE_SNAPSHOT_DIR%" rmdir /s /q "%PROFILE_SNAPSHOT_DIR%" >nul 2>nul
popd >nul 2>nul
echo.
echo [ERROR] Update failed with exit code %EXIT_CODE%.
pause
exit /b %EXIT_CODE%

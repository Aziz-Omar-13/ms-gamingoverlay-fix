@echo off
title Fix ms-gamingoverlay
color 0A

echo ==========================================
echo   Fixing ms-gamingoverlay popup issue...
echo ==========================================
echo.

set "VBS_PATH=%Public%\ignore-gamingoverlay.vbs"

echo [1/5] Creating silent handler file...
> "%VBS_PATH%" echo WScript.Quit

if not exist "%VBS_PATH%" (
    echo Failed to create: %VBS_PATH%
    pause
    exit /b 1
)

echo [2/5] Registering ms-gamingoverlay protocol...
reg add "HKCU\Software\Classes\ms-gamingoverlay" /ve /d "URL:ms-gamingoverlay" /f >nul
reg add "HKCU\Software\Classes\ms-gamingoverlay" /v "URL Protocol" /d "" /f >nul
reg add "HKCU\Software\Classes\ms-gamingoverlay\shell" /f >nul
reg add "HKCU\Software\Classes\ms-gamingoverlay\shell\open" /f >nul
reg add "HKCU\Software\Classes\ms-gamingoverlay\shell\open\command" /ve /d "wscript.exe \"%VBS_PATH%\" \"%%1\"" /f >nul

echo [3/5] Disabling Game DVR settings...
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f >nul

echo [4/5] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo [5/5] Done.
echo.
echo The ms-gamingoverlay popup should now be suppressed.
echo Handler file location:
echo %VBS_PATH%
echo.
pause
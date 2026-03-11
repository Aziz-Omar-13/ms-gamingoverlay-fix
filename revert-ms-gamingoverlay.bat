@echo off
title Revert ms-gamingoverlay fix
color 0C

echo ==========================================
echo   Reverting ms-gamingoverlay fix...
echo ==========================================
echo.

set "VBS_PATH=%Public%\ignore-gamingoverlay.vbs"

echo [1/3] Removing protocol registration...
reg delete "HKCU\Software\Classes\ms-gamingoverlay" /f >nul 2>&1

echo [2/3] Removing helper file...
if exist "%VBS_PATH%" del /f /q "%VBS_PATH%"

echo [3/3] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo.
echo Revert completed.
pause
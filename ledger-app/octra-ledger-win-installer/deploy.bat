@echo off
REM ========================================================================
REM  Octra Wallet Ledger — Windows 11 Deploy
REM  Deploys the Octra app to a connected Ledger device.
REM
REM  Prerequisites:
REM    1. Run setup-windows.bat first (one-time)
REM    2. Connect your Ledger via USB
REM    3. Unlock with PIN
REM    4. Do NOT open any app on the Ledger (stay on home screen)
REM ========================================================================
title Octra Ledger Deploy

setlocal EnableDelayedExpansion

set "SCRIPT_DIR=%~dp0"
set "APP_NAME=Octra"
set "APP_VERSION=1.0.0"

echo.
echo ================================================================
echo   Octra Wallet Ledger — Deploy to Device
echo ================================================================
echo.

REM --- Select target ---------------------------------------------------
echo Select your Ledger device:
echo.
echo   [1] Ledger Nano X
echo   [2] Ledger Nano S Plus
echo.
set /p CHOICE="Enter choice (1 or 2): "

if "%CHOICE%"=="1" (
    set "TARGET=nanox"
    set "TARGET_ID=0x33000004"
    set "DEVICE_NAME=Ledger Nano X"
) else if "%CHOICE%"=="2" (
    set "TARGET=nanos2"
    set "TARGET_ID=0x33100004"
    set "DEVICE_NAME=Ledger Nano S Plus"
) else (
    echo Invalid choice.
    pause
    exit /b 1
)

set "HEX_FILE=%SCRIPT_DIR%targets\%TARGET%\app.hex"

if not exist "!HEX_FILE!" (
    echo ERROR: Build artifact not found: !HEX_FILE!
    pause
    exit /b 1
)

echo.
echo Device:  !DEVICE_NAME!
echo Target:  !TARGET_ID!
echo File:    !HEX_FILE!
echo.

REM --- Confirm ---------------------------------------------------------
set /p CONFIRM="Deploy %APP_NAME% v%APP_VERSION% to !DEVICE_NAME!? (y/n): "
if /i not "!CONFIRM!"=="y" (
    echo Cancelled.
    pause
    exit /b 0
)

REM --- Delete existing app (if any) ------------------------------------
echo.
echo [*] Removing existing Octra app (if installed)...
python -m ledgerblue.deleteApp ^
    --targetId !TARGET_ID! ^
    --appName "!APP_NAME!" ^
    --rootPrivateKey 0000000000000000000000000000000000000000000000000000000000000000 ^
    2>nul

REM --- Install app -----------------------------------------------------
echo.
echo [*] Installing %APP_NAME% v%APP_VERSION% to !DEVICE_NAME!...
echo     Approve the operation on your Ledger when prompted.
echo.

python -m ledgerblue.loadApp ^
    --targetId !TARGET_ID! ^
    --fileName "!HEX_FILE!" ^
    --appName "!APP_NAME!" ^
    --appVersion "!APP_VERSION!" ^
    --appFlags 0x00 ^
    --tlv ^
    --rootPrivateKey 0000000000000000000000000000000000000000000000000000000000000000

if %errorlevel% equ 0 (
    echo.
    echo ================================================================
    echo   SUCCESS!  %APP_NAME% installed on !DEVICE_NAME!
    echo.
    echo   On your Ledger:
    echo     1. Press right button to navigate apps
    echo     2. Find "Octra" in the list
    echo     3. Press both buttons to open
    echo ================================================================
) else (
    echo.
    echo   DEPLOYMENT FAILED.
    echo   Make sure:
    echo     - Ledger is connected via USB
    echo     - Ledger is unlocked with PIN
    echo     - No app is open on the Ledger
    echo     - You approved the operation on the device
)

echo.
pause

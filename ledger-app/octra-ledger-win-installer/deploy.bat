@echo off
REM ========================================================================
REM  Octra Wallet Ledger — Windows 11 Deploy
REM  Deploys the Octra app to a connected Ledger device.
REM
REM  NOTE: Ledger Nano X blocks sideloading without a developer certificate.
REM        Ledger Nano S Plus supports sideloading without a certificate.
REM ========================================================================
title Octra Ledger Deploy

setlocal EnableDelayedExpansion

set "SCRIPT_DIR=%~dp0"
set "APP_NAME=Octra"
set "APP_VERSION=1.0.0"
set "API_LEVEL=25"

echo.
echo ================================================================
echo   Octra Wallet Ledger — Deploy to Device
echo ================================================================
echo.

REM --- Select target ---------------------------------------------------
echo Select your Ledger device:
echo.
echo   [1] Ledger Nano S Plus  (sideload supported)
echo   [2] Ledger Nano X       (requires developer certificate)
echo.
set /p CHOICE="Enter choice (1 or 2): "

if "%CHOICE%"=="1" (
    set "TARGET=nanos2"
    set "TARGET_ID=0x33100004"
    set "DEVICE_NAME=Ledger Nano S Plus"
) else if "%CHOICE%"=="2" (
    set "TARGET=nanox"
    set "TARGET_ID=0x33000004"
    set "DEVICE_NAME=Ledger Nano X"
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

REM --- Nano X warning ---------------------------------------------------
if "%CHOICE%"=="2" (
    echo.
    echo ================================================================
    echo   WARNING: Ledger Nano X does NOT support sideloading.
    echo ================================================================
    echo.
    echo   Status code 0x1400 means: "Sideload is not supported on Nano X"
    echo.
    echo   You have two options:
    echo.
    echo   A) Use a Ledger Nano S Plus instead (supports sideloading)
    echo.
    echo   B) Obtain a Ledger developer certificate:
    echo      1. Apply at: https://developers.ledger.com/
    echo      2. Once approved, you receive a certificate key
    echo      3. Add --rootPrivateKey YOUR_KEY to the command
    echo.
    echo   C) Use the web-based integration instead (no app needed):
    echo      1. Start the Octra webcli
    echo      2. Open http://127.0.0.1:8420
    echo      3. Click "Connect Ledger"
    echo.
    echo ================================================================
    echo.
    set /p PROCEED="Attempt deployment anyway? (y/n): "
    if /i not "!PROCEED!"=="y" (
        echo Cancelled.
        pause
        exit /b 0
    )
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

REM --- Deploy (single command: delete old + install new) ---------------
echo.
echo [*] Deploying %APP_NAME% v%APP_VERSION% to !DEVICE_NAME!...
echo.
echo IMPORTANT:
echo   1. Make sure your Ledger is UNLOCKED with PIN
echo   2. Stay on the HOME SCREEN (no app open)
echo   3. When prompted on the Ledger, press the RIGHT button to approve
echo.
echo Press any key when ready...
pause >nul
echo.

python -m ledgerblue.loadApp ^
    --targetId !TARGET_ID! ^
    --fileName "!HEX_FILE!" ^
    --appName "!APP_NAME!" ^
    --appVersion "!APP_VERSION!" ^
    --apiLevel !API_LEVEL! ^
    --appFlags 0x00 ^
    --delete ^
    --tlv

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
    echo.
    echo   Common causes:
    echo     - Nano X: sideload blocked (error 0x1400)
    echo       → Use Nano S Plus or get developer certificate
    echo     - Ledger not unlocked
    echo     - An app is open on the Ledger (go to home screen)
    echo     - Ledger Live is running (close it)
    echo     - USB connection issue (replug cable)
)

echo.
pause

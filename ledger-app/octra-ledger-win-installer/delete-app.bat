@echo off
REM ========================================================================
REM  Octra Wallet Ledger — Remove App from Device
REM ========================================================================
title Octra Ledger — Remove App

echo.
echo Select device to remove Octra from:
echo.
echo   [1] Ledger Nano X
echo   [2] Ledger Nano S Plus
echo.
set /p CHOICE="Enter choice (1 or 2): "

if "%CHOICE%"=="1" (
    set "TARGET_ID=0x33000004"
    set "DEVICE_NAME=Ledger Nano X"
) else if "%CHOICE%"=="2" (
    set "TARGET_ID=0x33100004"
    set "DEVICE_NAME=Ledger Nano S Plus"
) else (
    echo Invalid choice.
    pause
    exit /b 1
)

echo.
echo Removing Octra from !DEVICE_NAME!...
python -m ledgerblue.deleteApp ^
    --targetId !TARGET_ID! ^
    --appName "Octra"

echo.
pause

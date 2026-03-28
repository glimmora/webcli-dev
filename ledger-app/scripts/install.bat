@echo off
REM =============================================================================
REM Octra Wallet Ledger App - Windows Installation Script
REM Installs the built app to Ledger Nano S, Nano X, or Stax
REM Copyright 2025-2026 Octra Labs
REM =============================================================================

setlocal enabledelayedexpansion

REM Script directory
set "SCRIPT_DIR=%~dp0"
set "APP_DIR=%SCRIPT_DIR%.."

REM Default target
if "%~1"=="" (
    set "TARGET=nanos"
) else (
    set "TARGET=%~1"
)

REM =============================================================================
REM Helper Functions
REM =============================================================================

:print_header
echo.
echo ╔════════════════════════════════════════╗
echo ║  Octra Wallet - Ledger Installer       ║
echo ╚════════════════════════════════════════╝
echo.
goto :eof

:print_status
echo [OK] %~1
goto :eof

:print_warning
echo [WARN] %~1
goto :eof

:print_error
echo [ERROR] %~1
goto :eof

:print_info
echo [INFO] %~1
goto :eof

:check_prerequisites
REM Check Python
where python >nul 2>&1
if %errorlevel% neq 0 (
    call :print_error "Python is not installed. Please install Python 3 first."
    call :print_info "Run: scripts\setup-udev.bat to install all dependencies"
    exit /b 1
)
call :print_status "Python found"

REM Check ledgerblue
python -c "import ledgerblue" >nul 2>&1
if %errorlevel% neq 0 (
    call :print_warning "ledgerblue not installed. Installing..."
    pip install ledgerblue
    if %errorlevel% neq 0 (
        call :print_error "Failed to install ledgerblue"
        exit /b 1
    )
)
call :print_status "ledgerblue installed"

REM Check hex file exists
set "HEX_FILE=%APP_DIR%\build\%TARGET%\bin\app.hex"
if not exist "%HEX_FILE%" (
    set "HEX_FILE=%APP_DIR%\build\%TARGET%\app.hex"
)
if not exist "%HEX_FILE%" (
    call :print_error "Build file not found: %APP_DIR%\build\%TARGET%\app.hex"
    call :print_info "Run scripts\build.bat %TARGET% first"
    exit /b 1
)
call :print_status "App binary found"
goto :eof

:get_target_id
if "%TARGET%"=="nanos" set "TARGET_ID=0x31100004" & goto :eof
if "%TARGET%"=="nano-s" set "TARGET_ID=0x31100004" & goto :eof
if "%TARGET%"=="nanos2" set "TARGET_ID=0x33100004" & goto :eof
if "%TARGET%"=="nanox" set "TARGET_ID=0x33000004" & goto :eof
if "%TARGET%"=="nano-x" set "TARGET_ID=0x33000004" & goto :eof
if "%TARGET%"=="stax" set "TARGET_ID=0x33100004" & goto :eof
goto :eof

:get_device_name
if "%TARGET%"=="nanos" set "DEVICE_NAME=Nano S" & goto :eof
if "%TARGET%"=="nano-s" set "DEVICE_NAME=Nano S" & goto :eof
if "%TARGET%"=="nanos2" set "DEVICE_NAME=Nano S Plus" & goto :eof
if "%TARGET%"=="nanox" set "DEVICE_NAME=Nano X" & goto :eof
if "%TARGET%"=="nano-x" set "DEVICE_NAME=Nano X" & goto :eof
if "%TARGET%"=="stax" set "DEVICE_NAME=Stax" & goto :eof
goto :eof

:check_device_connection
echo.
call :print_info "Please ensure your Ledger %DEVICE_NAME% is:"
echo   1. Connected via USB
echo   2. Unlocked with PIN
echo   3. On the main screen (not in an app)
echo.

REM Try to detect device
wmic path Win32_PnPEntity where "DeviceID like '%%USB%%'" | findstr /i "Ledger" >nul 2>&1
if %errorlevel% equ 0 (
    call :print_status "Ledger device detected"
) else (
    call :print_warning "Could not detect Ledger device"
    call :print_info "Please connect your Ledger device and try again"
    call :print_info "If device is connected, run: scripts\setup-udev.bat"
)
goto :eof

:delete_existing_app
echo.
call :print_info "Checking for existing Octra app..."

REM Try to delete existing app (ignore errors if not installed)
python -m ledgerblue.deleteApp --appName "Octra" >nul 2>&1
if %errorlevel% equ 0 (
    call :print_status "Removed existing Octra app"
)
goto :eof

:install_app
call :get_target_id
set "HEX_FILE=%APP_DIR%\build\%TARGET%\bin\app.hex"
if not exist "%HEX_FILE%" (
    set "HEX_FILE=%APP_DIR%\build\%TARGET%\app.hex"
)

echo.
call :print_status "Installing Octra app to Ledger %DEVICE_NAME%..."
echo.

python -m ledgerblue.loadApp --targetId "%TARGET_ID%" --fileName "%HEX_FILE%" --appFlags 0x00 --appName "Octra" --appVersion "1.0.0" --appPath "/" --tlv --offline

if %errorlevel% equ 0 (
    echo.
    call :print_status "Installation successful!"
) else (
    echo.
    call :print_error "Installation failed!"
    echo.
    echo Troubleshooting:
    echo   1. Ensure Ledger is unlocked
    echo   2. Disconnect and reconnect USB
    echo   3. Try running as Administrator: scripts\install.bat %TARGET%
    echo   4. On Windows, ensure Ledger Live is closed
    echo   5. Check USB drivers: run scripts\setup-udev.bat
    echo.
    exit /b 1
)
goto :eof

:verify_installation
echo.
call :print_info "Verifying installation..."

REM Give device a moment to refresh
timeout /t 2 /nobreak >nul

call :print_status "Installation complete!"
echo.
echo ╔════════════════════════════════════════╗
echo ║  Octra App Installed Successfully!     ║
echo ╚════════════════════════════════════════╝
echo.
echo Device: Ledger %DEVICE_NAME%
echo App:    Octra v1.0.0
echo.
call :print_info "On your Ledger:"
echo   1. Press the right button to navigate apps
echo   2. Find 'Octra' in the app list
echo   3. Press both buttons to open
echo.
call :print_info "Next steps:"
echo   1. Open the Octra app on your Ledger
echo   2. Go to: http://127.0.0.1:8420
echo   3. Click 'Connect Ledger'
echo.
goto :eof

REM =============================================================================
REM Main Installation Flow
REM =============================================================================

:main
call :print_header

call :get_device_name
call :get_target_id

echo Target Device: %DEVICE_NAME%
echo Target ID:     %TARGET_ID%
echo.

call :check_prerequisites
if %errorlevel% neq 0 exit /b 1

call :check_device_connection
call :delete_existing_app
call :install_app
if %errorlevel% neq 0 exit /b 1

call :verify_installation
goto :eof

REM =============================================================================
REM Entry Point
REM =============================================================================

call :main

endlocal

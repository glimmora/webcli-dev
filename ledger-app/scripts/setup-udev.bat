@echo off
REM =============================================================================
REM Octra Wallet - Windows Setup & Dependency Installer
REM Auto-installs Docker, Python, ledgerblue, and all build dependencies
REM Copyright 2025-2026 Octra Labs
REM =============================================================================

setlocal enabledelayedexpansion

REM =============================================================================
REM Helper Functions
REM =============================================================================

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

echo.
echo ╔════════════════════════════════════════╗
echo ║  Octra Wallet - Setup (Windows)        ║
echo ║  Auto-Install Dependencies             ║
echo ╚════════════════════════════════════════╝
echo.

REM Check if running as Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    call :print_error "This script must be run as Administrator"
    echo.
    echo Usage: Right-click on setup-udev.bat and select "Run as administrator"
    echo.
    exit /b 1
)

REM =============================================================================
REM STEP 1: Install Build Dependencies
REM =============================================================================

:install_build_dependencies
call :print_info "Installing build dependencies..."

REM Check for Python
where python >nul 2>&1
if %errorlevel% neq 0 (
    call :print_info "Python not found. Installing Python 3..."

    REM Download Python installer
    call :print_info "Downloading Python 3..."
    powershell -Command "Invoke-WebRequest -Uri 'https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe' -OutFile '%TEMP%\python-installer.exe'"

    if exist "%TEMP%\python-installer.exe" (
        call :print_info "Installing Python 3 (this may take a few minutes)..."
        "%TEMP%\python-installer.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
        if !errorlevel! equ 0 (
            call :print_status "Python 3 installed"
            REM Refresh PATH
            set "PATH=%PATH%;C:\Program Files\Python312;C:\Program Files\Python312\Scripts"
        ) else (
            call :print_error "Failed to install Python 3"
            call :print_info "Please install Python 3 manually from https://www.python.org/downloads/"
        )
        del "%TEMP%\python-installer.exe"
    ) else (
        call :print_error "Failed to download Python installer"
        call :print_info "Please install Python 3 manually from https://www.python.org/downloads/"
    )
) else (
    call :print_status "Python is already installed"
)

REM Check for pip
where pip >nul 2>&1
if %errorlevel% neq 0 (
    call :print_warning "pip not found. Installing pip..."
    python -m ensurepip --upgrade
) else (
    call :print_status "pip is available"
)

REM Install ledgerblue Python package
python -c "import ledgerblue" >nul 2>&1
if %errorlevel% neq 0 (
    call :print_info "Installing ledgerblue..."
    pip install ledgerblue
    if !errorlevel! equ 0 (
        call :print_status "ledgerblue installed"
    ) else (
        call :print_error "Failed to install ledgerblue"
        call :print_info "Try running: pip install ledgerblue"
    )
) else (
    call :print_status "ledgerblue is already installed"
)

REM Check for Docker Desktop
where docker >nul 2>&1
if %errorlevel% neq 0 (
    call :print_warning "Docker Desktop is not installed"
    call :print_info "Docker is required to build the Ledger app"
    call :print_info "Download from: https://www.docker.com/products/docker-desktop"
    echo.
    call :print_info "After installing Docker Desktop:"
    echo   1. Start Docker Desktop
    echo   2. Wait for it to fully initialize
    echo   3. Run: scripts\build.bat nanox
    echo.
) else (
    call :print_status "Docker is installed"

    REM Check if Docker is running
    docker ps >nul 2>&1
    if !errorlevel! equ 0 (
        call :print_status "Docker is running"
    ) else (
        call :print_warning "Docker is not running"
        call :print_info "Please start Docker Desktop and wait for it to initialize"
    )
)

REM Check for Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    call :print_warning "Git is not installed"
    call :print_info "Download from: https://git-scm.com/download/win"
) else (
    call :print_status "Git is installed"
)

call :print_status "Build dependencies check complete"
goto :eof

REM =============================================================================
REM STEP 2: Check USB Drivers
REM =============================================================================

:check_usb_drivers
call :print_info "Checking for Ledger USB drivers..."

REM Check if Ledger device is connected
wmic path Win32_PnPEntity where "DeviceID like '%%USB%%'" | findstr /i "Ledger" >nul 2>&1
if !errorlevel! equ 0 (
    call :print_status "Ledger device detected"
) else (
    call :print_warning "No Ledger device detected"
    call :print_info "Please connect your Ledger device and try again"
    echo.
)

REM Check for WinUSB driver
call :print_info "Checking WinUSB driver..."

REM Check for Ledger devices in Device Manager
for /f "tokens=*" %%i in ('wmic path Win32_PnPEntity where "DeviceID like '%%USB%%'" get DeviceID /value ^| findstr "DeviceID"') do (
    set "DEVICE_ID=%%i"
    echo !DEVICE_ID! | findstr /i "Ledger" >nul 2>&1
    if !errorlevel! equ 0 (
        call :print_status "Found Ledger device: !DEVICE_ID!"
    )
)

REM Check if WinUSB is available
sc query WinUSB >nul 2>&1
if !errorlevel! equ 0 (
    call :print_status "WinUSB driver is available"
) else (
    call :print_warning "WinUSB driver not found"
    call :print_info "Windows should automatically install the driver when Ledger is connected"
)

REM Check for Ledger Live (can interfere with USB access)
call :print_info "Checking for Ledger Live..."

tasklist /FI "IMAGENAME eq Ledger Live.exe" 2>nul | findstr /I "Ledger Live.exe" >nul 2>&1
if !errorlevel! equ 0 (
    call :print_warning "Ledger Live is running"
    call :print_info "Ledger Live may interfere with USB access"
    call :print_info "Consider closing Ledger Live while using Octra wallet"
    echo.
) else (
    call :print_status "Ledger Live is not running"
)
goto :eof

REM =============================================================================
REM STEP 3: Check System Requirements
REM =============================================================================

:check_system
call :print_info "Checking system requirements..."

REM Check Windows version for WebHID support
call :print_info "Checking Windows version for WebHID support..."

for /f "tokens=4-5 delims=. " %%i in ('ver') do set "VERSION=%%i.%%j"
call :print_status "Windows version: %VERSION%"

REM WebHID is supported in Chrome 89+, Edge 89+, Opera 75+
call :print_info "WebHID support:"
echo   - Chrome 89+
echo   - Edge 89+
echo   - Opera 75+
echo   - Brave 1.21+
echo.

REM Check for common USB issues
call :print_info "Checking for common USB issues..."

REM Check if USB power saving is enabled
reg query "HKLM\SYSTEM\CurrentControlSet\Services\USB" /v "DisableSelectiveSuspend" >nul 2>&1
if !errorlevel! equ 0 (
    call :print_status "USB power saving is configured"
) else (
    call :print_info "USB power saving is at default settings"
)
goto :eof

REM =============================================================================
REM STEP 4: Verify Installation
REM =============================================================================

:verify_installation
echo.
call :print_info "Verifying installation..."
echo.

REM Check Python
where python >nul 2>&1
if !errorlevel! equ 0 (
    call :print_error "Python not found"
) else (
    call :print_status "Python is installed"
)

REM Check ledgerblue
python -c "import ledgerblue" >nul 2>&1
if !errorlevel! equ 0 (
    call :print_warning "ledgerblue not found (will be installed on first build)"
) else (
    call :print_status "ledgerblue is installed"
)

REM Check Docker
where docker >nul 2>&1
if !errorlevel! equ 0 (
    call :print_error "Docker not found"
) else (
    call :print_status "Docker is installed"
    docker ps >nul 2>&1
    if !errorlevel! equ 0 (
        call :print_status "Docker is running"
    ) else (
        call :print_warning "Docker is not running"
    )
)
goto :eof

REM =============================================================================
REM Main Execution
REM =============================================================================

:main
call :install_build_dependencies
call :check_usb_drivers
call :check_system
call :verify_installation

echo.
call :print_status "Setup complete!"
echo.
call :print_info "IMPORTANT: You may need to:"
echo   1. Restart your computer if Docker was installed
echo   2. Disconnect and reconnect your Ledger device
echo   3. Close Ledger Live if it's running
echo.
call :print_info "After setup, verify with:"
echo   1. Connect your Ledger device
echo   2. Unlock with PIN
echo   3. Open Octra wallet: scripts\start-wallet.bat
echo   4. Go to: http://127.0.0.1:8420
echo   5. Click 'Connect Ledger'
echo.
call :print_info "To build the Ledger app for Nano X:"
echo   scripts\build.bat nanox
echo.
call :print_info "To install the app to your Ledger:"
echo   scripts\install.bat nanox
echo.
call :print_info "Or build and install in one step:"
echo   scripts\build-and-install.bat nanox
echo.

endlocal
goto :eof

REM =============================================================================
REM Entry Point
REM =============================================================================

call :main

@echo off
REM =============================================================================
REM Octra Wallet Ledger App - Windows Build Script
REM Automatically builds the Ledger app for Nano S, Nano X, or Stax
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
echo ║  Octra Wallet Ledger App Builder       ║
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

:check_docker
where docker >nul 2>&1
if %errorlevel% neq 0 (
    call :print_error "Docker is not installed. Please install Docker Desktop first."
    call :print_info "Download from: https://www.docker.com/products/docker-desktop"
    call :print_info "Or run: scripts\setup-udev.bat to auto-install dependencies"
    exit /b 1
)

docker ps >nul 2>&1
if %errorlevel% neq 0 (
    call :print_error "Docker daemon is not running. Please start Docker Desktop."
    call :print_info "Wait for Docker Desktop to fully start, then try again."
    exit /b 1
)

call :print_status "Docker is available"
goto :eof

:check_target
if "%TARGET%"=="nanos" goto :target_valid
if "%TARGET%"=="nano-s" goto :target_valid
if "%TARGET%"=="nanos2" goto :target_valid
if "%TARGET%"=="nanox" goto :target_valid
if "%TARGET%"=="nano-x" goto :target_valid
if "%TARGET%"=="stax" goto :target_valid

call :print_error "Invalid target: %TARGET%"
echo Valid targets: nanos, nanos2, nanox, stax
exit /b 1

:target_valid
call :print_status "Target device: %TARGET%"
goto :eof

:get_sdk_path
if "%TARGET%"=="nanos" set "SDK_PATH=/opt/nanos-secure-sdk" & goto :eof
if "%TARGET%"=="nano-s" set "SDK_PATH=/opt/nanos-secure-sdk" & goto :eof
if "%TARGET%"=="nanos2" set "SDK_PATH=/opt/nanosplus-secure-sdk" & goto :eof
if "%TARGET%"=="nanox" set "SDK_PATH=/opt/nanox-secure-sdk" & goto :eof
if "%TARGET%"=="nano-x" set "SDK_PATH=/opt/nanox-secure-sdk" & goto :eof
if "%TARGET%"=="stax" set "SDK_PATH=/opt/stax-secure-sdk" & goto :eof
goto :eof

:get_size_limit
if "%TARGET%"=="nanos" set "SIZE_LIMIT=184320" & goto :eof
if "%TARGET%"=="nano-s" set "SIZE_LIMIT=184320" & goto :eof
if "%TARGET%"=="nanos2" set "SIZE_LIMIT=184320" & goto :eof
if "%TARGET%"=="nanox" set "SIZE_LIMIT=409600" & goto :eof
if "%TARGET%"=="nano-x" set "SIZE_LIMIT=409600" & goto :eof
if "%TARGET%"=="stax" set "SIZE_LIMIT=1572864" & goto :eof
goto :eof

:get_device_name
if "%TARGET%"=="nanos" set "DEVICE_NAME=Nano S" & goto :eof
if "%TARGET%"=="nano-s" set "DEVICE_NAME=Nano S" & goto :eof
if "%TARGET%"=="nanos2" set "DEVICE_NAME=Nano S Plus" & goto :eof
if "%TARGET%"=="nanox" set "DEVICE_NAME=Nano X" & goto :eof
if "%TARGET%"=="nano-x" set "DEVICE_NAME=Nano X" & goto :eof
if "%TARGET%"=="stax" set "DEVICE_NAME=Stax" & goto :eof
goto :eof

REM =============================================================================
REM Main Build Function
REM =============================================================================

:build_app
call :get_sdk_path
call :get_device_name
call :get_size_limit

call :print_header
echo Building for: %DEVICE_NAME%
echo SDK Path:   %SDK_PATH%
echo Size Limit: %SIZE_LIMIT% bytes
echo.

REM Clean previous build
call :print_status "Cleaning previous build..."
cd /d "%APP_DIR%"
if exist build rmdir /s /q build

REM Pull Docker image if not present
call :print_status "Checking Docker image..."
docker images | findstr "ledger-app-builder-lite" >nul 2>&1
if %errorlevel% neq 0 (
    echo Pulling Ledger app builder image...
    docker pull ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest
)
call :print_status "Docker image ready"

REM Build with Docker
echo.
call :print_status "Building application..."
echo.

docker run --rm -e BOLOS_SDK="%SDK_PATH%" -v "%APP_DIR%":/app -w /app ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest make 2>&1

REM Check if build produced hex file
set "HEX_FILE=build\%TARGET%\bin\app.hex"
if not exist "%HEX_FILE%" (
    set "HEX_FILE=build\%TARGET%\app.hex"
)

if exist "%HEX_FILE%" (
    echo.
    call :print_status "Build successful!"

    REM Check file size
    for %%A in ("%HEX_FILE%") do set "SIZE=%%~zA"
    echo.
    echo ╔════════════════════════════════════════╗
    echo ║  BUILD COMPLETE                        ║
    echo ╚════════════════════════════════════════╝
    echo.
    echo   Output:  %HEX_FILE%
    echo   Size:    %SIZE% bytes
    echo   Limit:   %SIZE_LIMIT% bytes

    if %SIZE% gtr %SIZE_LIMIT% (
        echo.
        call :print_error "Size exceeds limit!"
        exit /b 1
    ) else (
        echo.
        call :print_status "Size within limit"
    )
    echo.
) else (
    echo.
    call :print_error "Build failed!"
    echo.
    echo ============================================================
    echo.
    echo The Ledger BOLOS SDK has API compatibility issues.
    echo.
    echo ============================================================
    echo.
    echo RECOMMENDED SOLUTION: Use web-based integration
    echo.
    echo   The web-based Ledger integration works WITHOUT
    echo   needing to compile and install a native app.
    echo.
    echo ============================================================
    echo.
    echo QUICK START (Web-Based):
    echo.
    echo   1. Run: %APP_DIR%\scripts\start-wallet.bat
    echo.
    echo   2. Open: http://127.0.0.1:8420
    echo.
    echo   3. Click: 'Connect Ledger'
    echo.
    echo ============================================================
    echo.
    echo Benefits of Web-Based Integration:
    echo   - No compilation required
    echo   - No SDK dependencies
    echo   - Same security guarantees
    echo   - Works with any Ed25519 Ledger app
    echo   - Automatic updates
    echo.
    echo ============================================================
    echo.
    exit /b 1
)
goto :eof

REM =============================================================================
REM Entry Point
REM =============================================================================

call :check_docker
if %errorlevel% neq 0 exit /b 1

call :check_target
if %errorlevel% neq 0 exit /b 1

call :build_app
if %errorlevel% neq 0 exit /b 1

echo.
echo Build completed successfully!
echo.
echo Next steps:
echo   1. Connect your Ledger %DEVICE_NAME%
echo   2. Run: scripts\install.bat %TARGET%
echo.

endlocal

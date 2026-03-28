@echo off
REM =============================================================================
REM Octra Wallet - Quick Start Script (Windows)
REM Starts the web wallet with Ledger support
REM Copyright 2025-2026 Octra Labs
REM =============================================================================

setlocal enabledelayedexpansion

REM Colors for output (Windows 10+)
set "RED=[91m"
set "GREEN=[92m"
set "YELLOW=[93m"
set "BLUE=[94m"
set "NC=[0m"

REM Script directory
set "SCRIPT_DIR=%~dp0"
set "APP_DIR=%SCRIPT_DIR%.."
set "WEBCLI_DIR=%APP_DIR%\.."

echo.
echo %BLUE%╔════════════════════════════════════════╗%NC%
echo %BLUE%║     Octra Wallet - Quick Start        ║%NC%
echo %BLUE%╚════════════════════════════════════════╝%NC%
echo.

REM Check if octra_wallet.exe exists
if not exist "%WEBCLI_DIR%\octra_wallet.exe" (
    echo %YELLOW%Building web wallet...%NC%
    cd /d "%WEBCLI_DIR%"
    call make
    if !errorlevel! neq 0 (
        echo.
        echo %RED%Failed to build web wallet%NC%
        echo %YELLOW%Please ensure you have Go installed and run: make%NC%
        pause
        exit /b 1
    )
)

echo %GREEN%✓ Web wallet ready%NC%
echo.
echo %BLUE%Starting server on http://127.0.0.1:8420%NC%
echo.
echo %YELLOW%To use with Ledger:%NC%
echo   1. Connect your Ledger Nano S/X via USB
echo   2. Unlock with PIN
echo   3. Open http://127.0.0.1:8420 in Chrome/Edge
echo   4. Click 'Connect Ledger'
echo.
echo %YELLOW%Press Ctrl+C to stop%NC%
echo.

cd /d "%WEBCLI_DIR%"
octra_wallet.exe 8420

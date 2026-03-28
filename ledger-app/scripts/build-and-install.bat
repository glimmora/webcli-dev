@echo off
REM =============================================================================
REM Octra Wallet Ledger App - Complete Build & Install Script (Windows)
REM Builds and installs the app in one step
REM Copyright 2025-2026 Octra Labs
REM =============================================================================

setlocal enabledelayedexpansion

REM Script directory
set "SCRIPT_DIR=%~dp0"

REM Default target
if "%~1"=="" (
    set "TARGET=nanos"
) else (
    set "TARGET=%~1"
)

echo.
echo ╔════════════════════════════════════════╗
echo ║  Octra Wallet - Build ^& Install       ║
echo ╚════════════════════════════════════════╝
echo.

echo Target: %TARGET%
echo.

REM Step 1: Build
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 1/2: Building Application
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

call "%SCRIPT_DIR%build.bat" "%TARGET%"

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Build failed. Aborting installation.
    exit /b 1
)

REM Short pause
echo.
timeout /t 2 /nobreak >nul

REM Step 2: Install
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Step 2/2: Installing to Device
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

call "%SCRIPT_DIR%install.bat" "%TARGET%"

echo.
echo ╔════════════════════════════════════════╗
echo ║  Complete!                             ║
echo ╚════════════════════════════════════════╝
echo.

endlocal

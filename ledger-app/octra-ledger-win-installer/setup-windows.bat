@echo off
REM ========================================================================
REM  Octra Wallet Ledger — Windows 11 Setup
REM  Installs the ledgerblue Python package for device deployment.
REM ========================================================================
title Octra Ledger Setup

echo.
echo ================================================================
echo   Octra Wallet Ledger — Windows 11 Setup
echo ================================================================
echo.

REM --- Step 1: Check Python is installed ------------------------------
echo [1/2] Checking for Python...
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo   Python is not installed or not in PATH.
    echo.
    echo   Please install Python 3 from:
    echo     https://www.python.org/downloads/
    echo.
    echo   IMPORTANT: During installation, check the box that says
    echo   "Add Python to PATH" or "Add python.exe to PATH".
    echo.
    echo   After installing Python, restart this script.
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version 2^>^&1') do set PYVER=%%i
echo   Found: %PYVER%

REM --- Step 2: Install ledgerblue -------------------------------------
echo.
echo [2/2] Installing ledgerblue Python package...
echo       (This only needs to run once on this PC)
echo.

python -c "import ledgerblue" >nul 2>&1
if %errorlevel% equ 0 (
    echo   ledgerblue is already installed. Skipping.
) else (
    pip install ledgerblue
    if %errorlevel% neq 0 (
        echo.
        echo   Installation failed. Try running this script as Administrator.
        echo   Or manually run:  pip install ledgerblue
        echo.
        pause
        exit /b 1
    )
)

REM --- Verify ----------------------------------------------------------
echo.
echo [Verify] Testing ledgerblue...
python -c "import ledgerblue; print('  ledgerblue OK')"
if %errorlevel% neq 0 (
    echo   ERROR: ledgerblue import failed.
    pause
    exit /b 1
)

echo.
echo ================================================================
echo   Setup complete!
echo.
echo   You can now run deploy.bat to install the Octra app
echo   on your Ledger device.
echo ================================================================
echo.
pause

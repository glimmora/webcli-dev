@echo off
REM ========================================================================
REM  Octra Wallet Ledger — Windows 11 Setup
REM  Installs Python + ledgerblue required for device deployment.
REM ========================================================================
title Octra Ledger Setup

echo.
echo ================================================================
echo   Octra Wallet Ledger — Windows 11 Setup
echo ================================================================
echo.

REM --- Check Python ----------------------------------------------------
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo [1/3] Python not found. Installing via winget...
    winget install Python.Python.3.12 --accept-package-agreements --accept-source-agreements
    if %errorlevel% neq 0 (
        echo ERROR: Could not install Python automatically.
        echo Please install manually from https://www.python.org/downloads/
        echo Make sure to check "Add Python to PATH" during installation.
        pause
        exit /b 1
    )
    echo       Python installed.  Restart this script.
    pause
    exit /b 0
) else (
    echo [1/3] Python found:
    python --version
)

REM --- Install ledgerblue ----------------------------------------------
echo.
echo [2/3] Installing ledgerblue...
pip install --quiet ledgerblue 2>nul
if %errorlevel% neq 0 (
    pip install ledgerblue
)
echo       Done.

REM --- Verify ----------------------------------------------------------
echo.
echo [3/3] Verifying installation...
python -c "import ledgerblue; print('ledgerblue OK')"
if %errorlevel% neq 0 (
    echo ERROR: ledgerblue import failed.
    pause
    exit /b 1
)

echo.
echo ================================================================
echo   Setup complete!  You can now run deploy.bat
echo ================================================================
echo.
pause

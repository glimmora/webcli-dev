#!/bin/bash
# =============================================================================
# Octra Wallet Ledger App — Linux VPS Build & Package Script
#
# Purpose:
#   1. Install all build prerequisites on a fresh Linux VPS
#   2. Compile the ledger-app for Nano X and Nano S Plus
#   3. Package compiled artifacts into a zip for Windows 11 deployment
#
# Usage:
#   chmod +x linux-build-and-package.sh
#   ./linux-build-and-package.sh
#
# Output:
#   octra-ledger-windows-installer.zip  (transfer to Windows 11 PC)
#
# Requirements:
#   - Ubuntu/Debian-based VPS
#   - sudo access
#   - git, curl, make, clang already installed or installable
#   - ~2 GB free disk space
#
# Copyright 2025-2026 Octra Labs
# =============================================================================
set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
ARM_GCC_VERSION="13.3.rel1"
ARM_GCC_TARBALL="arm-gnu-toolchain-${ARM_GCC_VERSION}-x86_64-arm-none-eabi.tar.xz"
ARM_GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu/${ARM_GCC_VERSION}/binrel/${ARM_GCC_TARBALL}"

SDK_REPO="https://github.com/LedgerHQ/ledger-secure-sdk.git"
SDK_BRANCH="master"

APP_NAME="Octra"
APP_VERSION="1.0.0"
API_LEVEL=25
TARGETS=("nanox" "nanos2")

TOOLS_DIR="$HOME/tools"
SDK_DIR="$HOME/ledger-secure-sdk"
WORK_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$WORK_DIR"                      # ledger-app directory
DIST_DIR="$WORK_DIR/dist"
PACKAGE_DIR="$WORK_DIR/octra-ledger-win-installer"
OUT_ZIP="$WORK_DIR/octra-ledger-windows-installer.zip"

# ---------------------------------------------------------------------------
# Colours
# ---------------------------------------------------------------------------
R='\033[0;31m'; G='\033[0;32m'; Y='\033[1;33m'; B='\033[0;34m'; C='\033[0;36m'; N='\033[0m'
step()  { echo -e "\n${B}━━━ $1 ━━━${N}"; }
ok()    { echo -e "  ${G}✓${N} $1"; }
warn()  { echo -e "  ${Y}⚠${N} $1"; }
fail()  { echo -e "  ${R}✗${N} $1"; exit 1; }
info()  { echo -e "  ${C}›${N}  $1"; }

# ---------------------------------------------------------------------------
# 0. Pre-flight checks
# ---------------------------------------------------------------------------
step "Pre-flight checks"

[[ "$(uname)" == "Linux" ]] || fail "This script is for Linux only."
command -v git   >/dev/null || fail "git is required (apt install git)."
command -v curl  >/dev/null || fail "curl is required (apt install curl)."
command -v make  >/dev/null || fail "make is required (apt install make)."
command -v clang >/dev/null || fail "clang is required (apt install clang)."
command -v zip   >/dev/null || { info "zip not found — installing"; sudo apt-get install -y zip; }

ok "All base tools present"

# ---------------------------------------------------------------------------
# 1. Install Python dependencies
# ---------------------------------------------------------------------------
step "1 · Python dependencies"

PIP_FLAGS="--break-system-packages --quiet"
python3 -c "import ledgerblue" 2>/dev/null || pip3 install $PIP_FLAGS ledgerblue
python3 -c "import speculos"    2>/dev/null || pip3 install $PIP_FLAGS speculos
ok "ledgerblue + speculos installed"

# ---------------------------------------------------------------------------
# 2. Install ARM GCC cross-compiler
# ---------------------------------------------------------------------------
step "2 · ARM GCC toolchain"

if [[ -x "$TOOLS_DIR/arm-gnu-toolchain-${ARM_GCC_VERSION}-x86_64-arm-none-eabi/bin/arm-none-eabi-gcc" ]]; then
    ok "ARM GCC already installed"
else
    info "Downloading ARM GCC ${ARM_GCC_VERSION} (~150 MB)…"
    mkdir -p "$TOOLS_DIR"
    curl -sL "$ARM_GCC_URL" -o "$TOOLS_DIR/arm-gnu-toolchain.tar.xz"
    info "Extracting…"
    tar xf "$TOOLS_DIR/arm-gnu-toolchain.tar.xz" -C "$TOOLS_DIR"
    rm -f "$TOOLS_DIR/arm-gnu-toolchain.tar.xz"
    ok "ARM GCC installed"
fi

ARM_GCC_DIR="$TOOLS_DIR/arm-gnu-toolchain-${ARM_GCC_VERSION}-x86_64-arm-none-eabi"
export PATH="$ARM_GCC_DIR/bin:$PATH"
"$ARM_GCC_DIR/bin/arm-none-eabi-gcc" --version | head -1

# ---------------------------------------------------------------------------
# 3. Clone / update Ledger Secure SDK
# ---------------------------------------------------------------------------
step "3 · Ledger Secure SDK"

if [[ -f "$SDK_DIR/Makefile.standard_app" ]]; then
    info "SDK already present — pulling latest…"
    git -C "$SDK_DIR" pull --quiet 2>/dev/null || true
else
    info "Cloning SDK (shallow)…"
    git clone --depth 1 --branch "$SDK_BRANCH" "$SDK_REPO" "$SDK_DIR"
fi
ok "SDK ready at $SDK_DIR"

# ---------------------------------------------------------------------------
# 4. Build the ledger-app for each target
# ---------------------------------------------------------------------------
step "4 · Compile ledger-app"

export BOLOS_SDK="$SDK_DIR"

for TARGET in "${TARGETS[@]}"; do
    echo ""
    info "Building for target: ${Y}$TARGET${N}"

    cd "$APP_DIR"
    make clean >/dev/null 2>&1 || true

    export TARGET
    if make API_LEVEL=$API_LEVEL 2>&1 | tail -3; then
        # Collect outputs
        mkdir -p "$DIST_DIR/$TARGET"
        cp -f bin/app.elf   "$DIST_DIR/$TARGET/app.elf"
        cp -f bin/app.hex   "$DIST_DIR/$TARGET/app.hex"
        cp -f bin/app.apdu  "$DIST_DIR/$TARGET/app.apdu"
        cp -f bin/app.sha256 "$DIST_DIR/$TARGET/app.sha256"
        cp -f debug/app.map "$DIST_DIR/$TARGET/app.map" 2>/dev/null || true

        HEX_SIZE=$(stat -c%s "$DIST_DIR/$TARGET/app.hex" 2>/dev/null || stat -f%z "$DIST_DIR/$TARGET/app.hex")
        ok "$TARGET build complete — ${HEX_SIZE} bytes"
    else
        fail "$TARGET build failed"
    fi
done

# ---------------------------------------------------------------------------
# 5. Assemble Windows installer package
# ---------------------------------------------------------------------------
step "5 · Assemble Windows installer package"

rm -rf "$PACKAGE_DIR"
mkdir -p "$PACKAGE_DIR/targets"

# Copy build artifacts per target
for TARGET in "${TARGETS[@]}"; do
    mkdir -p "$PACKAGE_DIR/targets/$TARGET"
    cp "$DIST_DIR/$TARGET/app.hex"   "$PACKAGE_DIR/targets/$TARGET/"
    cp "$DIST_DIR/$TARGET/app.apdu"  "$PACKAGE_DIR/targets/$TARGET/"
    cp "$DIST_DIR/$TARGET/app.sha256" "$PACKAGE_DIR/targets/$TARGET/"
done

# Copy the source file for reference
cp "$APP_DIR/src/main.c" "$PACKAGE_DIR/"

# Create Windows setup script
cat > "$PACKAGE_DIR/setup-windows.bat" << 'BATWIN'
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
BATWIN

# Create Windows deploy script
cat > "$PACKAGE_DIR/deploy.bat" << 'DEPLOYWIN'
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
DEPLOYWIN

# Create Windows delete script
cat > "$PACKAGE_DIR/delete-app.bat" << 'DELWIN'
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
DELWIN

# Create README for the installer package
cat > "$PACKAGE_DIR/README.txt" << 'README'
============================================================
  Octra Wallet Ledger App — Windows 11 Deployment Package
============================================================

This package contains the compiled Octra Ledger app ready
for deployment to Ledger Nano X or Nano S Plus.

CONTENTS
--------
  setup-windows.bat     — One-time setup (installs Python + ledgerblue)
  deploy.bat            — Deploy the Octra app to your Ledger
  delete-app.bat        — Remove the Octra app from your Ledger
  targets/
    nanox/app.hex       — Compiled app for Ledger Nano X
    nanos2/app.hex      — Compiled app for Ledger Nano S Plus
  main.c                — App source code (for reference)

REQUIREMENTS
------------
  - Windows 10 or 11
  - Ledger Nano X or Ledger Nano S Plus
  - USB cable to connect the Ledger
  - Internet connection (for initial setup)

INSTALLATION STEPS
------------------

  STEP 1:  One-time setup
  -----------
  Double-click: setup-windows.bat
  This installs Python and the ledgerblue package.
  Only needed once per PC.

  STEP 2:  Deploy to Ledger
  -----------
  a) Connect your Ledger via USB
  b) Unlock with your PIN
  c) Stay on the home screen (do NOT open any app)
  d) Double-click: deploy.bat
  e) Select your device (Nano X or Nano S Plus)
  f) Approve the installation on your Ledger device

  STEP 3:  Use the app
  -----------
  On your Ledger:
    1. Press right button to navigate to apps
    2. Find "Octra" in the list
    3. Press both buttons to open

  Then open the Octra webcli in your browser and
  click "Connect Ledger".

TROUBLESHOOTING
---------------

  "Python not found"
    → Re-run setup-windows.bat
    → Or install Python manually from python.org
      (check "Add Python to PATH")

  "ledgerblue not found"
    → Run: pip install ledgerblue

  "Device not found"
    → Ensure Ledger is connected and unlocked
    → Use a direct USB connection (no hub)
    → Close Ledger Live if running

  "Deployment failed"
    → Stay on the Ledger home screen (no app open)
    → Approve the prompt on the Ledger when it appears
    → Try disconnecting and reconnecting the USB cable

APDU PROTOCOL
-------------
  CLA:   0xE0
  INS:   GET_VERSION=0x00  GET_PUBLIC_KEY=0x01
         SIGN_TX=0x02      DERIVE_ADDRESS=0x03
         SIGN_MESSAGE=0x04
  Path:  m/44'/3156'/0'/0/0

BUILD INFORMATION
-----------------
  App Name:    Octra
  Version:     1.0.0
  API Level:   25
  SDK:         ledger-secure-sdk
  Targets:     Nano X (0x33000004), Nano S Plus (0x33100004)
  Compiled on: Linux VPS (ARM GCC 13.3.1 + Clang)

============================================================
  Copyright 2025-2026 Octra Labs  |  GPL v2.0
============================================================
README

# Build timestamp
echo "Built: $(date -u '+%Y-%m-%d %H:%M:%S UTC')" >> "$PACKAGE_DIR/BUILD_INFO.txt"
echo "Host:  $(hostname)" >> "$PACKAGE_DIR/BUILD_INFO.txt"
echo "SDK:   $(git -C "$SDK_DIR" describe --always --dirty 2>/dev/null || echo 'unknown')" >> "$PACKAGE_DIR/BUILD_INFO.txt"

ok "Windows installer package ready at: $PACKAGE_DIR/"

# Fix Windows line endings on .bat files
for bat in "$PACKAGE_DIR"/*.bat; do
    sed -i 's/$/\r/' "$bat"
done
ok "Windows line endings (CRLF) applied to .bat files"

# ---------------------------------------------------------------------------
# 6. Create the zip archive
# ---------------------------------------------------------------------------
step "6 · Create zip archive"

cd "$WORK_DIR"
rm -f "$OUT_ZIP"
zip -r "$OUT_ZIP" "$(basename "$PACKAGE_DIR")" -x '*.git*' >/dev/null 2>&1

ZIP_SIZE=$(stat -c%s "$OUT_ZIP" 2>/dev/null || stat -f%z "$OUT_ZIP")
ok "Archive created: $OUT_ZIP  (${ZIP_SIZE} bytes)"

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------
echo ""
echo -e "${G}╔══════════════════════════════════════════════════════════╗${N}"
echo -e "${G}║  BUILD & PACKAGE COMPLETE                                ║${N}"
echo -e "${G}╚══════════════════════════════════════════════════════════╝${N}"
echo ""
echo "  Transfer this file to your Windows 11 PC:"
echo ""
echo -e "    ${C}$OUT_ZIP${N}"
echo ""
echo "  On Windows:"
echo "    1. Extract the zip"
echo "    2. Run setup-windows.bat  (one-time)"
echo "    3. Run deploy.bat         (deploy to Ledger)"
echo ""

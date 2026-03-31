# Octra Wallet Ledger App — Complete Build & Deployment Guide

This guide covers the full workflow: compile the Octra Ledger app on a Linux VPS,
package it for Windows 11, and deploy it to a Ledger hardware device.

---

## Table of Contents

1. [Overview](#1-overview)
2. [Part A — Linux VPS: Build the App](#2-part-a--linux-vps-build-the-app)
3. [Part B — Transfer to Windows 11](#3-part-b--transfer-to-windows-11)
4. [Part C — Windows 11: Deploy to Ledger](#4-part-c--windows-11-deploy-to-ledger)
5. [Part D — Verify the App Works](#5-part-d--verify-the-app-works)
6. [Troubleshooting](#6-troubleshooting)
7. [Manual Build Commands (without script)](#7-manual-build-commands-without-script)

---

## 1. Overview

### What this does

```
Linux VPS                      Windows 11 PC                    Ledger Device
┌────────────────┐  zip file  ┌────────────────┐  USB + USBHID ┌────────────────┐
│  Compile app   │ ─────────> │  Extract zip   │ ────────────> │  Install app   │
│  for Nano X    │            │  Run deploy.bat│               │  "Octra"       │
│  for Nano S+   │            │                │               │  appears on    │
└────────────────┘            └────────────────┘               │  device screen │
                                                               └────────────────┘
```

### Supported devices

| Device | Target ID | File |
|--------|-----------|------|
| Ledger Nano X | 0x33000004 | `targets/nanox/app.hex` |
| Ledger Nano S Plus | 0x33100004 | `targets/nanos2/app.hex` |

### Requirements

**Linux VPS (build machine):**
- Ubuntu/Debian-based
- sudo access
- ~2 GB free disk
- git, curl, make, clang

**Windows 11 (deployment machine):**
- Python 3 (auto-installed by setup script)
- Internet connection (for first-time setup)
- USB port for Ledger

---

## 2. Part A — Linux VPS: Build the App

### Step A1: Copy the source to the VPS

```bash
# From your local machine, scp the ledger-app directory to the VPS:
scp -r ledger-app/ user@your-vps-ip:~/ledger-app/

# Or if you have the git repo on the VPS:
ssh user@your-vps-ip
git clone <your-repo-url> ~/webcli-dev
cd ~/webcli-dev/ledger-app
```

### Step A2: Ensure prerequisites are available

```bash
# On the VPS (Ubuntu/Debian):
sudo apt-get update
sudo apt-get install -y git curl make clang zip python3 python3-pip
```

### Step A3: Run the build script

```bash
cd ~/ledger-app   # or ~/webcli-dev/ledger-app

chmod +x linux-build-and-package.sh
./linux-build-and-package.sh
```

The script will:
1. Install ARM GCC cross-compiler (~150 MB download)
2. Clone the Ledger Secure SDK from GitHub
3. Compile the app for Nano X and Nano S Plus
4. Package everything into a zip file

### Step A4: Locate the output

When the script finishes, it prints the path to the zip file:

```
  Transfer this file to your Windows 11 PC:

    /home/user/ledger-app/octra-ledger-windows-installer.zip
```

### What the script installs

| Component | Location | Size |
|-----------|----------|------|
| ARM GCC 13.3.1 | `~/tools/arm-gnu-toolchain-13.3.1.../` | ~500 MB |
| Ledger Secure SDK | `~/ledger-secure-sdk/` | ~50 MB |
| Python packages | System pip | ~20 MB |
| Build outputs | `ledger-app/dist/` | ~1 MB |

---

## 3. Part B — Transfer to Windows 11

### Option 1: SCP / SFTP

```bash
# From the VPS, push to your Windows machine:
scp octra-ledger-windows-installer.zip user@windows-ip:C:/Users/user/Desktop/
```

### Option 2: Download via browser

If the VPS has a web server:
```bash
cp octra-ledger-windows-installer.zip /var/www/html/
# Then browse to http://your-vps-ip/octra-ledger-windows-installer.zip
```

### Option 3: USB drive or cloud storage

Copy the zip to any shared location (Google Drive, Dropbox, USB stick, etc.)

The zip file is approximately **60 KB** — very small since it only contains the
compiled hex files, not the toolchain.

---

## 4. Part C — Windows 11: Deploy to Ledger

### Step C1: Extract the zip

Right-click `octra-ledger-windows-installer.zip` → **Extract All** → Extract.

You will see:

```
octra-ledger-win-installer/
├── setup-windows.bat     ← One-time setup
├── deploy.bat            ← Deploy app to Ledger
├── delete-app.bat        ← Remove app from Ledger
├── README.txt            ← Documentation
├── BUILD_INFO.txt        ← Build metadata
├── main.c                ← Source code (reference)
└── targets/
    ├── nanox/
    │   ├── app.hex       ← Nano X binary
    │   ├── app.apdu
    │   └── app.sha256
    └── nanos2/
        ├── app.hex       ← Nano S Plus binary
        ├── app.apdu
        └── app.sha256
```

### Step C2: One-time setup (run setup-windows.bat)

Double-click **`setup-windows.bat`**.

This will:
1. Check if Python 3 is installed (installs via `winget` if missing)
2. Install the `ledgerblue` Python package
3. Verify everything works

You only need to do this once per Windows PC.

**If Python is not installed**, the script will attempt to install it via `winget`.
If that fails, install Python manually from https://www.python.org/downloads/
(make sure to check **"Add Python to PATH"**).

### Step C3: Connect your Ledger

1. Connect your Ledger Nano X or Nano S Plus via USB
2. Enter your PIN to unlock the device
3. **Stay on the home screen** — do NOT open any app

### Step C4: Deploy the app (run deploy.bat)

Double-click **`deploy.bat`**.

The script will:
1. Ask you to select your device (Nano X or Nano S Plus)
2. Confirm the deployment
3. Remove any existing Octra app
4. Install the new Octra app
5. Prompt you to approve the installation **on the Ledger device**

**Important:** When the Ledger shows the installation prompt, press the
right button to approve. The app installation takes about 10 seconds.

### Step C5: Open the Octra app on your Ledger

After successful installation:
1. On your Ledger, press the right button to navigate apps
2. Find **"Octra"** in the list
3. Press both buttons to open

---

## 5. Part D — Verify the App Works

### On the Ledger device screen

When you open the Octra app on the Ledger, it should show:
- App name: "Octra"
- Version: "1.0.0"
- A waiting/ready screen

### With the Octra webcli

1. Start the Octra wallet webcli:
   ```bash
   ./octra_wallet 8420
   ```

2. Open `http://127.0.0.1:8420` in Chrome or Edge

3. Click **"Connect Ledger"**

4. The webcli will connect via WebUSB/WebHID, send a `GET_PUBLIC_KEY`
   command, and display your Octra address

### Verify device type (optional)

The app responds to `GET_VERSION` with the device type in byte 4:
- `0x02` = Nano X
- `0x03` = Nano S Plus

---

## 6. Troubleshooting

### Linux VPS build issues

| Problem | Solution |
|---------|----------|
| `clang: command not found` | `sudo apt-get install clang` |
| `make: *** No rule to make target` | Ensure `BOLOS_SDK` points to a valid SDK directory |
| `arm-none-eabi-gcc: not found` | Re-run the script; it downloads ARM GCC automatically |
| Build fails with `ledgerblue` error | `pip3 install --break-system-packages ledgerblue` |
| Build output too large | Check that `DEBUG=0` in the Makefile |

### Windows deployment issues

| Problem | Solution |
|---------|----------|
| `Python not found` | Install Python from python.org (check "Add to PATH") |
| `ledgerblue not found` | Open cmd as admin: `pip install ledgerblue` |
| `Device not found` | Use direct USB cable, close Ledger Live, unlock device |
| `Deployment failed` | Stay on Ledger home screen, approve prompt on device |
| `Permission denied` | Run deploy.bat as Administrator |
| Ledger shows "Pending review" | This is normal for sideloaded apps |

### After deployment

| Problem | Solution |
|---------|----------|
| App doesn't appear on Ledger | Disconnect and reconnect USB, re-unlock |
| Webcli can't connect | Open the Octra app on Ledger first, then connect |
| Transaction fails | Verify address/amount on Ledger screen, press both buttons |

---

## 7. Manual Build Commands (without script)

If you prefer to run commands manually instead of using `linux-build-and-package.sh`:

### Install prerequisites

```bash
# System packages
sudo apt-get install -y git curl make clang python3 python3-pip zip

# Python packages
pip3 install --break-system-packages ledgerblue speculos

# ARM GCC
cd ~
curl -sL "https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz" -o arm-gcc.tar.xz
tar xf arm-gcc.tar.xz
rm arm-gcc.tar.xz

# Ledger SDK
git clone --depth 1 https://github.com/LedgerHQ/ledger-secure-sdk.git ~/ledger-secure-sdk
```

### Build for Nano X

```bash
export PATH="$HOME/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin:$PATH"
export BOLOS_SDK="$HOME/ledger-secure-sdk"
export TARGET=nanox

cd /path/to/ledger-app
make clean
make API_LEVEL=25

# Output: bin/app.elf, bin/app.hex
```

### Build for Nano S Plus

```bash
export TARGET=nanos2
make clean
make API_LEVEL=25

# Output: bin/app.elf, bin/app.hex
```

### Deploy to Windows manually

```bash
# On Windows (PowerShell or cmd), with Python + ledgerblue installed:

# Nano X
python -m ledgerblue.deleteApp --targetId 0x33000004 --appName "Octra"
python -m ledgerblue.loadApp --targetId 0x33000004 --fileName app.hex --appName "Octra" --appVersion "1.0.0" --appFlags 0x00 --tlv

# Nano S Plus
python -m ledgerblue.deleteApp --targetId 0x33100004 --appName "Octra"
python -m ledgerblue.loadApp --targetId 0x33100004 --fileName app.hex --appName "Octra" --appVersion "1.0.0" --appFlags 0x00 --tlv
```

---

## File Reference

| File | Purpose |
|------|---------|
| `linux-build-and-package.sh` | Linux: builds app + creates Windows installer zip |
| `src/main.c` | Ledger app source code (single file, 503 lines) |
| `Makefile` | Build configuration (uses Ledger Secure SDK) |
| `setup-windows.bat` | Windows: one-time Python + ledgerblue setup |
| `deploy.bat` | Windows: deploy Octra app to Ledger device |
| `delete-app.bat` | Windows: remove Octra app from Ledger device |
| `targets/nanox/app.hex` | Compiled binary for Ledger Nano X |
| `targets/nanos2/app.hex` | Compiled binary for Ledger Nano S Plus |

---

## APDU Protocol Reference

| Command | CLA | INS | Description |
|---------|-----|-----|-------------|
| GET_VERSION | 0xE0 | 0x00 | Returns version + device type |
| GET_PUBLIC_KEY | 0xE0 | 0x01 | Derives Ed25519 key + address |
| SIGN_TRANSACTION | 0xE0 | 0x02 | Signs transaction data |
| DERIVE_ADDRESS | 0xE0 | 0x03 | Derives address only |
| SIGN_MESSAGE | 0xE0 | 0x04 | Signs arbitrary message |

Derivation path: `m/44'/3156'/0'/0/0`

---

Copyright 2025-2026 Octra Labs — GNU General Public License v2.0

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

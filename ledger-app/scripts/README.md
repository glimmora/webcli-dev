# Octra Wallet Ledger App - Build Scripts

Automated build and installation scripts for the Octra Wallet Ledger application.

## Quick Start

### Build for Nano S (Default)
```bash
cd /root/webcli/ledger-app
./scripts/build.sh
```

### Build for Nano X
```bash
./scripts/build.sh nanox
```

### Build and Install in One Step
```bash
./scripts/build-and-install.sh nanox
```

## Available Scripts

| Script | Description |
|--------|-------------|
| `build.sh` | Build the app for specified target |
| `install.sh` | Install built app to Ledger device |
| `build-and-install.sh` | Build and install in one step |
| `cleanup.sh` | Remove build artifacts and app |
| `setup-udev.sh` | Setup Linux USB permissions |

## Build Targets

| Target | Device | Size Limit |
|--------|--------|------------|
| `nanos` | Nano S | 180 KB |
| `nanos2` | Nano S Plus | 180 KB |
| `nanox` | Nano X | 400 KB |
| `stax` | Stax | 1.5 MB |

## Usage Examples

### 1. Build for Nano S
```bash
./scripts/build.sh nanos
```

### 2. Install to Nano X
```bash
./scripts/install.sh nanox
```

### 3. Complete Build & Install
```bash
./scripts/build-and-install.sh nanox
```

### 4. Cleanup
```bash
./scripts/cleanup.sh
```

### 5. Setup USB Permissions (Linux)
```bash
sudo ./scripts/setup-udev.sh
```

## Prerequisites

### Required
- **Docker** - For containerized build
- **Python 3** - For installation
- **ledgerblue** - Python package (auto-installed)

### Optional (Linux only)
- **udev rules** - For USB access without root

## Step-by-Step Installation

### Step 1: Setup (Linux only)
```bash
# Setup USB permissions
sudo ./scripts/setup-udev.sh

# Log out and back in for changes to take effect
```

### Step 2: Build
```bash
# Build for your device
./scripts/build.sh nanox
```

### Step 3: Install
```bash
# Connect Ledger, unlock with PIN
./scripts/install.sh nanox
```

### Step 4: Verify
On your Ledger:
1. Press right button to navigate apps
2. Find "Octra" in the list
3. Press both buttons to open

## Troubleshooting

### "Docker not found"
```bash
# Install Docker
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
# Log out and back in
```

### "ledgerblue not found"
```bash
# Install manually
pip3 install --break-system-packages ledgerblue
```

### "Device not detected"
1. Ensure Ledger is unlocked
2. Try different USB port
3. Use direct connection (no hub)
4. On Linux, run setup-udev.sh

### "Build failed"
The Ledger SDK has frequent API changes. Alternative:
```bash
# Use web-based integration (no native app needed)
cd /root/webcli
./octra_wallet 8420
```

## Build Output

After successful build:
```
build/
└── nanox/
    ├── app.hex      # Application binary
    ├── app.elf      # ELF format binary
    └── app.map      # Memory map
```

## Installation Output

After successful install:
```
✓ Octra App Installed Successfully!

Device: Ledger Nano X
App:    Octra v1.0.0

On your Ledger:
  1. Press the right button to navigate apps
  2. Find 'Octra' in the app list
  3. Press both buttons to open
```

## Web-Based Alternative (Recommended)

The web-based integration works without installing a native app:

```bash
cd /root/webcli
./octra_wallet 8420

# Open browser: http://127.0.0.1:8420
# Click "Connect Ledger"
```

**Benefits:**
- No compilation required
- No SDK dependencies
- Same security guarantees
- Works with any Ed25519 Ledger app

## Script Details

### build.sh
- Checks Docker availability
- Pulls Ledger builder image
- Builds with correct SDK
- Validates app size

### install.sh
- Checks prerequisites
- Detects connected device
- Removes existing app
- Installs new app
- Verifies installation

### build-and-install.sh
- Combines build.sh and install.sh
- Single command deployment
- Error handling between steps

### cleanup.sh
- Removes build directory
- Optionally deletes app from device
- Frees disk space

### setup-udev.sh
- Creates udev rules file
- Reloads udev daemon
- Adds user to plugdev group
- Enables USB access without root

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `BOLOS_SDK` | SDK path | Auto-detected |
| `TARGET` | Build target | nanos |

## Advanced Usage

### Custom SDK Path
```bash
export BOLOS_SDK=/custom/path/to/sdk
./scripts/build.sh nanox
```

### Verbose Build
```bash
VERBOSE=1 ./scripts/build.sh nanox
```

### Force Rebuild
```bash
rm -rf build/
./scripts/build.sh nanox
```

## Support

For issues:
1. Check `FINAL_REPORT.md` for build status
2. Review `INSTALL_NANOX.md` for installation guide
3. Use web-based integration as alternative

## License

GNU General Public License v2.0

## Copyright

Copyright 2025-2026 Octra Labs

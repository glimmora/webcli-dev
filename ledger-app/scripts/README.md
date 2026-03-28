# Octra Wallet Ledger App - Build Scripts

Automated build and installation scripts for the Octra Wallet Ledger application.

## Quick Start

### Linux/macOS

#### Build for Nano X
```bash
./scripts/build.sh nanox
```

#### Build and Install in One Step
```bash
./scripts/build-and-install.sh nanox
```

### Windows

#### Build for Nano X
```cmd
scripts\build.bat nanox
```

#### Build and Install in One Step
```cmd
scripts\build-and-install.bat nanox
```

## Available Scripts

### Linux/macOS

| Script | Description |
|--------|-------------|
| `build.sh` | Build the app for specified target |
| `install.sh` | Install built app to Ledger device |
| `build-and-install.sh` | Build and install in one step |
| `setup-udev.sh` | Setup Linux USB permissions & auto-install dependencies |
| `start-wallet.sh` | Start the web wallet |
| `cleanup.sh` | Remove build artifacts |

### Windows

| Script | Description |
|--------|-------------|
| `build.bat` | Build the app for specified target |
| `install.bat` | Install built app to Ledger device |
| `build-and-install.bat` | Build and install in one step |
| `setup-udev.bat` | Auto-install all dependencies (Docker, Python, ledgerblue) |
| `start-wallet.bat` | Start the web wallet |

## Build Targets

| Target | Device | Size Limit |
|--------|--------|------------|
| `nanos` | Nano S | 180 KB |
| `nanos2` | Nano S Plus | 180 KB |
| `nanox` | Nano X | 400 KB |
| `stax` | Stax | 1.5 MB |

## Prerequisites

### Required for All Platforms
- **Docker** - For containerized build
  - Linux: Docker Engine
  - Windows: Docker Desktop
  - macOS: Docker Desktop

### Auto-Installed by Setup Scripts
- **Python 3** - For installation
- **ledgerblue** - Python package for Ledger communication
- **Build tools** - Git, curl, wget

### Linux Only
- **udev rules** - For USB access without root (configured by setup-udev.sh)

### Windows Only
- **Administrator privileges** - For driver installation
- **WinUSB drivers** - Auto-configured by setup-udev.bat

## Installation

### Linux/macOS

#### Step 1: Setup Dependencies
```bash
cd /path/to/ledger-app
sudo ./scripts/setup-udev.sh
```

**Important:** Log out and log back in for group changes to take effect.

#### Step 2: Build
```bash
# Build for Nano X
./scripts/build.sh nanox

# Build for Nano S (default)
./scripts/build.sh
```

#### Step 3: Install
```bash
# Connect Ledger, unlock with PIN
./scripts/install.sh nanox
```

### Windows

#### Step 1: Setup Dependencies
Run as Administrator:
```cmd
scripts\setup-udev.bat
```

#### Step 2: Build
```cmd
REM Build for Nano X
scripts\build.bat nanox

REM Build for Nano S (default)
scripts\build.bat
```

#### Step 3: Install
```cmd
REM Connect Ledger, unlock with PIN
scripts\install.bat nanox
```

## Usage Examples

### Linux/macOS

#### Complete Build & Install
```bash
./scripts/build-and-install.sh nanox
```

#### Start Web Wallet
```bash
./scripts/start-wallet.sh
```

#### Cleanup Build Artifacts
```bash
./scripts/cleanup.sh
```

### Windows

#### Complete Build & Install
```cmd
scripts\build-and-install.bat nanox
```

#### Start Web Wallet
```cmd
scripts\start-wallet.bat
```

## Troubleshooting

### Docker Issues

#### "Docker daemon is not running"
**Linux:**
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

**Windows:**
- Start Docker Desktop
- Wait for it to fully initialize (whale icon stops animating)

#### "permission denied while trying to connect to the docker API"
**Linux:**
```bash
# Add user to docker group
sudo usermod -aG docker $USER

# Then log out and log back in
# Or temporarily use:
sudo docker ps
```

### Device Not Detected

#### Linux
```bash
# Re-run setup with sudo
sudo ./scripts/setup-udev.sh

# Log out and log back in
# Or reload udev rules:
sudo udevadm control --reload-rules
sudo udevadm trigger
```

#### Windows
- Run `scripts\setup-udev.bat` as Administrator
- Disconnect and reconnect Ledger
- Close Ledger Live if running

### "ledgerblue not found"
**Linux:**
```bash
pip3 install --break-system-packages ledgerblue
```

**Windows:**
```cmd
pip install ledgerblue
```

### Build Failed
The Ledger SDK has frequent API changes. Alternative:

#### Use Web-Based Integration (Recommended)
```bash
# Linux/macOS
./scripts/start-wallet.sh

# Windows
scripts\start-wallet.bat

# Open browser: http://127.0.0.1:8420
# Click "Connect Ledger"
```

**Benefits:**
- No compilation required
- No SDK dependencies
- Same security guarantees
- Works with any Ed25519 Ledger app

## Build Output

After successful build:
```
build/
└── nanox/
    ├── app.hex      # Application binary
    ├── app.elf      # ELF format binary
    └── app.map      # Memory map
```

## Installation Verification

After successful install:
```
✓ Octra App Installed Successfully!

Device: Ledger Nano X
App:    Octra v1.0.0

On your Ledger:
  1. Press the right button to navigate apps
  2. Find "Octra" in the list
  3. Press both buttons to open
```

## Script Details

### build.sh / build.bat
- Checks Docker availability
- Pulls Ledger builder image
- Builds with correct SDK path
- Validates app size against limits

### install.sh / install.bat
- Checks prerequisites (Python, ledgerblue)
- Detects connected device
- Removes existing app
- Installs new app
- Verifies installation

### build-and-install.sh / build-and-install.bat
- Combines build and install scripts
- Single command deployment
- Error handling between steps

### setup-udev.sh (Linux)
- Installs Docker if not present
- Installs Python 3 and pip
- Installs ledgerblue Python package
- Creates udev rules for USB access
- Adds user to docker and plugdev groups

### setup-udev.bat (Windows)
- Installs Python 3 if not present
- Installs ledgerblue Python package
- Checks Docker Desktop installation
- Configures USB drivers
- Checks for Ledger Live conflicts

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

## Web-Based Alternative (Recommended)

The web-based integration works without installing a native app:

```bash
# Linux/macOS
cd /path/to/webcli
./octra_wallet 8420

# Windows
cd \path\to\webcli
octra_wallet.exe 8420

# Open browser: http://127.0.0.1:8420
# Click "Connect Ledger"
```

**Benefits:**
- No compilation required
- No SDK dependencies
- Same security guarantees
- Works with any Ed25519 Ledger app
- Automatic updates

## Support

For issues:
1. Check device connection
2. Verify Docker is running
3. Run setup script for your platform
4. Use web-based integration as alternative

## License

GNU General Public License v2.0

## Copyright

Copyright 2025-2026 Octra Labs

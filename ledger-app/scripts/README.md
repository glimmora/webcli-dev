# Octra Wallet Ledger App - Build Scripts

Automated build, test, and deployment scripts for the Octra Wallet Ledger application.

## Quick Start

### Full Setup (installs everything + builds + tests)

```bash
./scripts/setup-build-test.sh all
```

### Individual Steps

```bash
./scripts/setup-build-test.sh setup   # Install prerequisites only
./scripts/setup-build-test.sh build   # Build for all targets only
./scripts/setup-build-test.sh test    # Run Speculos tests only
```

### Build for Single Target

```bash
./scripts/build.sh nanox     # Nano X
./scripts/build.sh nanos2    # Nano S Plus
```

## Available Scripts

| Script | Description |
|--------|-------------|
| `setup-build-test.sh` | Full autonomous setup: prerequisites, build, test |
| `build.sh` | Build app for a single target |
| `install.sh` | Install built app to physical Ledger device |
| `build-and-install.sh` | Build and install in one step |
| `test-integration.sh` | Integration test suite (directories, files, Speculos) |
| `start-wallet.sh` | Start the web wallet with Ledger support |
| `setup-udev.sh` | Setup Linux USB permissions for Ledger access |
| `cleanup.sh` | Remove build artifacts |

### Windows Scripts

| Script | Description |
|--------|-------------|
| `build.bat` | Build the app for specified target |
| `install.bat` | Install built app to Ledger device |
| `build-and-install.bat` | Build and install in one step |
| `setup-udev.bat` | Auto-install dependencies |
| `start-wallet.bat` | Start the web wallet |

## Build Targets

| Target | Device | Speculos | Size Limit |
|--------|--------|----------|------------|
| `nanox` | Ledger Nano X | Yes | 400 KB |
| `nanos2` | Ledger Nano S Plus | Yes | 180 KB |

**Note:** The original Nano S (`nanos`) is not supported by recent Speculos versions.

## Prerequisites (auto-installed)

| Component | Purpose |
|-----------|---------|
| ARM GCC 13.3.1 | Cross-compiler for ARM Cortex-M |
| Ledger Secure SDK | Build system and headers |
| Clang | Required by SDK build system |
| Speculos | Ledger device emulator |
| ledgerblue | For loading apps to physical devices |
| qemu-arm-static | ARM emulation for Speculos |

## Build Output

After successful build:
```
dist/
├── nanox/
│   ├── app.elf      # ELF binary (for Speculos)
│   ├── app.hex      # Hex binary (for device loading)
│   ├── app.apdu     # APDU format
│   ├── app.sha256   # Checksum
│   └── app.map      # Memory map
└── nanos2/
    ├── app.elf
    ├── app.hex
    ├── app.apdu
    ├── app.sha256
    └── app.map
```

## Troubleshooting

### Build fails
```bash
# Reinstall all dependencies
./scripts/setup-build-test.sh setup
```

### Speculos won't start
```bash
# Verify installation
python3 -c "import speculos; print('OK')"
qemu-arm-static --version
```

### Device not detected
```bash
# Linux: set up udev rules
sudo ./scripts/setup-udev.sh
# Log out and back in
```

## License

GNU General Public License v2.0

Copyright 2025-2026 Octra Labs

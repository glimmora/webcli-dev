#!/bin/bash
# =============================================================================
# Octra Wallet Ledger App - Build Script
# Builds the Ledger app for Nano S Plus or Nano X using local SDK
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(dirname "$APP_DIR")"
TOOLS_DIR="$HOME/tools"
SDK_DIR="$PROJECT_DIR/ledger-secure-sdk"
ARM_GCC_DIR="$TOOLS_DIR/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi"

# Default target
TARGET="${1:-nanox}"
API_LEVEL="${API_LEVEL:-25}"

# ARM GCC URL
ARM_GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz"
SDK_REPO="https://github.com/LedgerHQ/ledger-secure-sdk.git"

# =============================================================================
# Helper Functions
# =============================================================================

print_header() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Octra Wallet Ledger App Builder       ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
    echo ""
}

print_status()  { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error()   { echo -e "${RED}✗${NC} $1"; }
print_info()    { echo -e "${BLUE}ℹ${NC} $1"; }

get_device_name() {
    case "$TARGET" in
        nanox|nano-x)  echo "Nano X" ;;
        nanos2|nanosp) echo "Nano S Plus" ;;
        *)             echo "Unknown ($TARGET)" ;;
    esac
}

get_size_limit() {
    case "$TARGET" in
        nanox|nano-x)  echo "409600" ;;
        nanos2|nanosp) echo "184320" ;;
        *)             echo "409600" ;;
    esac
}

# =============================================================================
# Setup
# =============================================================================

setup_environment() {
    # Install Python dependencies
    if ! python3 -c "import speculos" 2>/dev/null; then
        print_info "Installing speculos..."
        pip3 install --break-system-packages --quiet speculos 2>/dev/null || \
        pip3 install --quiet speculos 2>/dev/null || true
    fi
    if ! python3 -c "import ledgerblue" 2>/dev/null; then
        print_info "Installing ledgerblue..."
        pip3 install --break-system-packages --quiet ledgerblue 2>/dev/null || \
        pip3 install --quiet ledgerblue 2>/dev/null || true
    fi

    # Install ARM GCC if missing
    if [ ! -f "$ARM_GCC_DIR/bin/arm-none-eabi-gcc" ]; then
        print_info "Installing ARM GCC toolchain..."
        mkdir -p "$TOOLS_DIR"
        curl -sL "$ARM_GCC_URL" -o "$TOOLS_DIR/arm-gnu-toolchain.tar.xz"
        tar xf "$TOOLS_DIR/arm-gnu-toolchain.tar.xz" -C "$TOOLS_DIR"
        rm -f "$TOOLS_DIR/arm-gnu-toolchain.tar.xz"
        print_status "ARM GCC toolchain installed"
    fi

    # Clone SDK if missing
    if [ ! -f "$SDK_DIR/Makefile.standard_app" ]; then
        print_info "Cloning Ledger Secure SDK..."
        git clone --depth 1 "$SDK_REPO" "$SDK_DIR"
        print_status "Ledger SDK cloned"
    fi
}

# =============================================================================
# Build
# =============================================================================

build_app() {
    local device_name=$(get_device_name)
    local size_limit=$(get_size_limit)

    print_header
    echo -e "Building for: ${GREEN}$device_name${NC}"
    echo -e "SDK Path:   ${YELLOW}$SDK_DIR${NC}"
    echo -e "API Level:  ${YELLOW}$API_LEVEL${NC}"
    echo ""

    # Setup environment
    setup_environment

    # Set environment
    export PATH="$ARM_GCC_DIR/bin:$PATH"
    export BOLOS_SDK="$SDK_DIR"
    export TARGET="$TARGET"

    # Clean and build
    cd "$APP_DIR"
    make clean >/dev/null 2>&1

    print_status "Building application..."
    echo ""

    if make API_LEVEL=$API_LEVEL 2>&1; then
        local hex_file="bin/app.hex"
        local elf_file="bin/app.elf"

        if [ -f "$hex_file" ]; then
            local size=$(stat -c%s "$hex_file" 2>/dev/null || stat -f%z "$hex_file")
            echo ""
            echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
            echo -e "${GREEN}  BUILD COMPLETE${NC}"
            echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
            echo ""
            echo "  Target:  $device_name"
            echo "  Output:  $hex_file"
            echo "  ELF:     $elf_file"
            echo "  Size:    $size bytes"
            echo "  Limit:   $size_limit bytes"

            if [ "$size" -gt "$size_limit" ]; then
                echo ""
                print_error "Size exceeds limit!"
                exit 1
            else
                echo ""
                print_status "Size within limit ✓"
            fi

            # Save to dist
            mkdir -p "dist/$TARGET"
            cp bin/app.elf "dist/$TARGET/app.elf"
            cp bin/app.hex "dist/$TARGET/app.hex"
            cp bin/app.apdu "dist/$TARGET/app.apdu"
            cp bin/app.sha256 "dist/$TARGET/app.sha256"
            cp debug/app.map "dist/$TARGET/app.map" 2>/dev/null || true
            echo ""
            print_status "Artifacts saved to dist/$TARGET/"
            echo ""
        else
            print_error "Build failed - hex file not found"
            exit 1
        fi
    else
        echo ""
        print_error "Build failed!"
        exit 1
    fi
}

# =============================================================================
# Entry Point
# =============================================================================

# Validate target
case "$TARGET" in
    nanox|nano-x|nanos2|nanosp)
        ;;
    *)
        print_error "Invalid target: $TARGET"
        echo "Valid targets: nanox, nanos2 (nanosp)"
        exit 1
        ;;
esac

build_app

echo -e "${GREEN}Build completed successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Test with Speculos: ./scripts/setup-build-test.sh test"
echo "  2. Or load to device:  make load TARGET=$TARGET"
echo ""

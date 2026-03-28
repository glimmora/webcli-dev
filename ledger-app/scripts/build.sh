#!/bin/bash
# =============================================================================
# Octra Wallet Ledger App - Autonomous Build Script
# Automatically builds the Ledger app for Nano S, Nano X, or Stax
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"

# Default target
TARGET="${1:-nanos}"

# =============================================================================
# Helper Functions
# =============================================================================

print_header() {
    echo ""
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}  Octra Wallet Ledger App Builder${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo ""
}

print_status() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

check_docker() {
    if ! command -v docker &> /dev/null; then
        print_error "Docker is not installed. Please install Docker first."
        exit 1
    fi
    
    if ! docker ps &> /dev/null; then
        print_error "Docker daemon is not running. Please start Docker."
        exit 1
    fi
    
    print_status "Docker is available"
}

check_target() {
    case "$TARGET" in
        nanos|nano-s|nanos2|nanox|nano-x|stax)
            print_status "Target device: $TARGET"
            ;;
        *)
            print_error "Invalid target: $TARGET"
            echo "Valid targets: nanos, nanox, stax"
            exit 1
            ;;
    esac
}

get_sdk_path() {
    case "$TARGET" in
        nanos|nano-s) echo "/opt/nanos-secure-sdk" ;;
        nanos2) echo "/opt/nanos2-secure-sdk" ;;
        nanox|nano-x) echo "/opt/nanox-secure-sdk" ;;
        stax) echo "/opt/stax-secure-sdk" ;;
    esac
}

get_size_limit() {
    case "$TARGET" in
        nanos|nano-s|nanos2) echo "184320" ;;
        nanox|nano-x) echo "409600" ;;
        stax) echo "1572864" ;;
    esac
}

get_device_name() {
    case "$TARGET" in
        nanos|nano-s) echo "Nano S" ;;
        nanos2) echo "Nano S Plus" ;;
        nanox|nano-x) echo "Nano X" ;;
        stax) echo "Stax" ;;
    esac
}

# =============================================================================
# Main Build Function
# =============================================================================

build_app() {
    local sdk_path=$(get_sdk_path)
    local device_name=$(get_device_name)
    local size_limit=$(get_size_limit)
    
    print_header
    echo -e "Building for: ${GREEN}$device_name${NC}"
    echo -e "SDK Path:   ${YELLOW}$sdk_path${NC}"
    echo -e "Size Limit: ${YELLOW}$size_limit bytes${NC}"
    echo ""
    
    # Clean previous build
    print_status "Cleaning previous build..."
    cd "$APP_DIR"
    rm -rf build/
    
    # Pull Docker image if not present
    print_status "Checking Docker image..."
    if ! docker images | grep -q ledger-app-builder-lite; then
        echo "Pulling Ledger app builder image..."
        docker pull ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest
    fi
    print_status "Docker image ready"
    
    # Build with Docker
    echo ""
    print_status "Building application..."
    echo ""
    
    docker run --rm \
        -e BOLOS_SDK="$sdk_path" \
        -v "$APP_DIR":/app \
        -w /app \
        ghcr.io/ledgerhq/ledger-app-builder/ledger-app-builder-lite:latest \
        make 2>&1 | tee /tmp/build.log
    
    # Check if build produced hex file (Makefile.standard_app outputs to bin/ subdirectory)
    local hex_file="build/${TARGET}/bin/app.hex"
    if [ ! -f "$hex_file" ]; then
        hex_file="build/${TARGET}/app.hex"
    fi
    if [ -f "$hex_file" ]; then
        echo ""
        print_status "Build successful!"
        
        # Check file size
        local size=$(stat -c%s "$hex_file" 2>/dev/null || stat -f%z "$hex_file")
        echo ""
        echo -e "${BLUE}========================================${NC}"
        echo -e "${GREEN}  BUILD COMPLETE${NC}"
        echo -e "${BLUE}========================================${NC}"
        echo ""
        echo "  Output:  $hex_file"
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
        echo ""
    else
        echo ""
        print_error "Build failed!"
        echo ""
        echo "═══════════════════════════════════════════════════════"
        echo ""
        echo "The Ledger BOLOS SDK has API compatibility issues."
        echo ""
        echo "═══════════════════════════════════════════════════════"
        echo ""
        echo "RECOMMENDED SOLUTION: Use web-based integration"
        echo ""
        echo "  The web-based Ledger integration works WITHOUT"
        echo "  needing to compile and install a native app."
        echo ""
        echo "═══════════════════════════════════════════════════════"
        echo ""
        echo "QUICK START (Web-Based):"
        echo ""
        echo "  1. Run: $APP_DIR/scripts/start-wallet.sh"
        echo ""
        echo "  2. Open: http://127.0.0.1:8420"
        echo ""
        echo "  3. Click: 'Connect Ledger'"
        echo ""
        echo "═══════════════════════════════════════════════════════"
        echo ""
        echo "Benefits of Web-Based Integration:"
        echo "  ✓ No compilation required"
        echo "  ✓ No SDK dependencies"
        echo "  ✓ Same security guarantees"
        echo "  ✓ Works with any Ed25519 Ledger app"
        echo "  ✓ Automatic updates"
        echo ""
        echo "═══════════════════════════════════════════════════════"
        echo ""
        exit 1
    fi
}

# =============================================================================
# Entry Point
# =============================================================================

check_docker
check_target
build_app

echo -e "${GREEN}Build completed successfully!${NC}"
echo ""
echo "Next steps:"
echo "  1. Connect your Ledger $device_name"
echo "  2. Run: ./scripts/install.sh $TARGET"
echo ""

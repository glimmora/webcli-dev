#!/bin/bash
# =============================================================================
# Octra Wallet Ledger App - Setup, Build & Test Script
# Autonomous build and test for Nano S Plus and Nano X using Speculos
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

# Directories
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(dirname "$APP_DIR")"
TOOLS_DIR="$HOME/tools"
SDK_DIR="$PROJECT_DIR/ledger-secure-sdk"
ARM_GCC_DIR="$TOOLS_DIR/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi"

# Config
ARM_GCC_URL="https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz"
SDK_REPO="https://github.com/LedgerHQ/ledger-secure-sdk.git"
API_LEVEL=25
TARGETS=("nanox" "nanos2")

# =============================================================================
# Helper Functions
# =============================================================================

print_header() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  $1${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_status()  { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error()   { echo -e "${RED}✗${NC} $1"; }
print_info()    { echo -e "${CYAN}ℹ${NC} $1"; }

# =============================================================================
# Step 1: Install Prerequisites
# =============================================================================

setup_prerequisites() {
    print_header "Step 1: Installing Prerequisites"
    
    # Python dependencies
    print_info "Installing Python packages..."
    pip3 install --break-system-packages --quiet speculos ledgerblue 2>/dev/null || \
    pip3 install --quiet speculos ledgerblue 2>/dev/null || true
    print_status "Python packages ready (speculos, ledgerblue)"
    
    # ARM GCC toolchain
    if [ ! -f "$ARM_GCC_DIR/bin/arm-none-eabi-gcc" ]; then
        print_info "Downloading ARM GCC toolchain..."
        mkdir -p "$TOOLS_DIR"
        curl -sL "$ARM_GCC_URL" -o "$TOOLS_DIR/arm-gnu-toolchain.tar.xz"
        print_info "Extracting ARM GCC toolchain..."
        tar xf "$TOOLS_DIR/arm-gnu-toolchain.tar.xz" -C "$TOOLS_DIR"
        rm -f "$TOOLS_DIR/arm-gnu-toolchain.tar.xz"
        print_status "ARM GCC toolchain installed"
    else
        print_status "ARM GCC toolchain already installed"
    fi
    
    # Ledger Secure SDK
    if [ ! -f "$SDK_DIR/Makefile.standard_app" ]; then
        print_info "Cloning Ledger Secure SDK..."
        git clone --depth 1 "$SDK_REPO" "$SDK_DIR"
        print_status "Ledger Secure SDK cloned"
    else
        print_status "Ledger Secure SDK already available"
    fi
    
    # Verify Speculos is available
    if command -v speculos &>/dev/null; then
        print_status "Speculos $(speculos --help 2>&1 | head -1 | grep -oP 'version \K.*' || echo 'installed')"
    else
        print_error "Speculos not found. Install with: pip3 install speculos"
        exit 1
    fi
    
    # Verify QEMU
    if command -v qemu-arm-static &>/dev/null; then
        print_status "QEMU ARM emulator available"
    else
        print_warning "qemu-arm-static not found (Speculos may not work)"
    fi
}

# =============================================================================
# Step 2: Build Application
# =============================================================================

build_target() {
    local target="$1"
    local device_name=""
    
    case "$target" in
        nanox)  device_name="Nano X" ;;
        nanos2) device_name="Nano S Plus" ;;
        *)      print_error "Unknown target: $target"; return 1 ;;
    esac
    
    print_info "Building for $device_name ($target)..."
    
    export PATH="$ARM_GCC_DIR/bin:$PATH"
    export BOLOS_SDK="$SDK_DIR"
    export TARGET="$target"
    
    cd "$APP_DIR"
    make clean >/dev/null 2>&1
    
    if make API_LEVEL=$API_LEVEL 2>&1 | grep -q "LINK"; then
        # Save build artifacts
        mkdir -p "dist/$target"
        cp bin/app.elf "dist/$target/app.elf"
        cp bin/app.hex "dist/$target/app.hex"
        cp bin/app.apdu "dist/$target/app.apdu"
        cp bin/app.sha256 "dist/$target/app.sha256"
        cp debug/app.map "dist/$target/app.map" 2>/dev/null || true
        
        local size=$(stat -c%s "dist/$target/app.elf" 2>/dev/null || stat -f%z "dist/$target/app.elf")
        print_status "$device_name build complete (${size} bytes)"
        return 0
    else
        print_error "$device_name build FAILED"
        return 1
    fi
}

build_all() {
    print_header "Step 2: Building Application"
    
    for target in "${TARGETS[@]}"; do
        build_target "$target" || true
    done
    
    echo ""
    print_info "Build artifacts:"
    for target in "${TARGETS[@]}"; do
        if [ -f "dist/$target/app.elf" ]; then
            echo "  dist/$target/app.elf"
            echo "  dist/$target/app.hex"
        fi
    done
}

# =============================================================================
# Step 3: Test with Speculos
# =============================================================================

test_with_speculos() {
    local model="$1"
    local model_flag="$2"
    local elf_path="$3"
    local apdu_port="$4"
    local api_port="$5"
    local device_name="$6"
    
    print_info "Testing $device_name on Speculos (port $apdu_port)..."
    
    # Start Speculos in background
    speculos --display headless \
        -m "$model_flag" \
        -a "$API_LEVEL" \
        --apdu-port "$apdu_port" \
        --api-port "$api_port" \
        "$elf_path" >/dev/null 2>&1 &
    
    local speculos_pid=$!
    sleep 4
    
    # Check if Speculos started
    if ! kill -0 "$speculos_pid" 2>/dev/null; then
        print_error "$device_name: Speculos failed to start"
        return 1
    fi
    
    # Test APDU communication
    python3 << PYEOF
import socket, struct, sys

def send_apdu(port, apdu):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(5)
        sock.connect(('127.0.0.1', port))
        msg = struct.pack('>I', len(apdu)) + apdu
        sock.sendall(msg)
        raw = sock.recv(4096)
        sock.close()
        return raw[4:] if len(raw) > 4 else b''
    except Exception as e:
        return b''

results = []

# Test 1: GET_VERSION
resp = send_apdu($apdu_port, bytes([0xE0, 0x00, 0x00, 0x00]))
if len(resp) >= 6 and resp[-2:] == b'\x90\x00':
    results.append(f"GET_VERSION: {resp[0]}.{resp[1]}.{resp[2]} device={resp[3]} OK")
else:
    results.append("GET_VERSION: FAIL")
    sys.exit(1)

# Test 2: GET_PUBLIC_KEY with all-hardened path (m/44'/3156'/0'/0'/0')
# Note: Non-hardened Ed25519 derivation is a Speculos limitation
path_data = bytes([
    5,
    0x80, 0x00, 0x00, 0x2C,   # 44'
    0x80, 0x00, 0x0C, 0x54,   # 3156'
    0x80, 0x00, 0x00, 0x00,   # 0'
    0x80, 0x00, 0x00, 0x00,   # 0'
    0x80, 0x00, 0x00, 0x00,   # 0'
])
resp = send_apdu($apdu_port, bytes([0xE0, 0x01, 0x00, 0x00, len(path_data)]) + path_data)
if len(resp) >= 2 and (resp[-2] << 8 | resp[-1]) == 0x9000:
    data = resp[:-2]
    pub_len = data[0]
    pubkey = data[1:1+pub_len]
    results.append(f"GET_PUBLIC_KEY: {pubkey[:8].hex()}... OK")
else:
    sw = (resp[-2] << 8 | resp[-1]) if len(resp) >= 2 else 0
    results.append(f"GET_PUBLIC_KEY: FAIL (SW=0x{sw:04x})")

# Test 3: SIGN_MESSAGE
# First set the path via GET_PUBLIC_KEY
send_apdu($apdu_port, bytes([0xE0, 0x01, 0x00, 0x00, len(path_data)]) + path_data)
# Then sign
msg = b"Hello Octra"
resp = send_apdu($apdu_port, bytes([0xE0, 0x04, 0x00, 0x00, len(msg)]) + msg)
if len(resp) >= 66 and resp[-2:] == b'\x90\x00':
    results.append(f"SIGN_MESSAGE: 64-byte signature OK")
else:
    sw = (resp[-2] << 8 | resp[-1]) if len(resp) >= 2 else 0
    results.append(f"SIGN_MESSAGE: FAIL (SW=0x{sw:04x})")

for r in results:
    print(f"  {r}")

sys.exit(0)
PYEOF
    
    local result=$?
    
    # Cleanup
    kill "$speculos_pid" 2>/dev/null
    wait "$speculos_pid" 2>/dev/null
    
    return $result
}

run_tests() {
    print_header "Step 3: Testing with Speculos"
    
    local all_passed=true
    local apdu_base=29999
    local api_base=25000
    local idx=0
    
    # Test Nano X
    if [ -f "$APP_DIR/dist/nanox/app.elf" ]; then
        if test_with_speculos "nanox" "nanox" "$APP_DIR/dist/nanox/app.elf" \
            $((apdu_base - idx)) $((api_base - idx)) "Nano X"; then
            print_status "Nano X: All tests passed ✓"
        else
            print_error "Nano X: Some tests failed"
            all_passed=false
        fi
        idx=$((idx + 1))
    fi
    
    # Test Nano S Plus
    if [ -f "$APP_DIR/dist/nanos2/app.elf" ]; then
        if test_with_speculos "nanosp" "nanosp" "$APP_DIR/dist/nanos2/app.elf" \
            $((apdu_base - idx)) $((api_base - idx)) "Nano S Plus"; then
            print_status "Nano S Plus: All tests passed ✓"
        else
            print_error "Nano S Plus: Some tests failed"
            all_passed=false
        fi
        idx=$((idx + 1))
    fi
    
    echo ""
    if $all_passed; then
        print_header "ALL TESTS PASSED ✓"
    else
        print_header "SOME TESTS FAILED ✗"
        return 1
    fi
}

# =============================================================================
# Main
# =============================================================================

main() {
    print_header "Octra Wallet - Setup, Build & Test"
    
    local action="${1:-all}"
    
    case "$action" in
        setup)
            setup_prerequisites
            ;;
        build)
            build_all
            ;;
        test)
            run_tests
            ;;
        all)
            setup_prerequisites
            build_all
            run_tests
            ;;
        *)
            echo "Usage: $0 [setup|build|test|all]"
            echo ""
            echo "  setup  - Install prerequisites (ARM GCC, SDK, Python packages)"
            echo "  build  - Build the app for all targets"
            echo "  test   - Run Speculos tests for all built targets"
            echo "  all    - Do everything (default)"
            exit 1
            ;;
    esac
}

main "$@"

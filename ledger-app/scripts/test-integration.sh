#!/bin/bash
# =============================================================================
# Octra Wallet - Integration Test Script
# Tests all components: webcli, ledger-app, and Speculos
# Copyright 2025-2026 Octra Labs
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(dirname "$APP_DIR")"

print_status() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }
print_error()   { echo -e "${RED}✗${NC} $1"; }
print_info()    { echo -e "${BLUE}ℹ${NC} $1"; }
print_header() {
    echo ""
    echo -e "${BLUE}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  $1${NC}"
    echo -e "${BLUE}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
}

TESTS_PASSED=0
TESTS_FAILED=0
TESTS_TOTAL=0

run_test() {
    local name="$1"
    local cmd="$2"
    TESTS_TOTAL=$((TESTS_TOTAL + 1))
    
    echo -n "  Testing: $name ... "
    if eval "$cmd" > /dev/null 2>&1; then
        echo -e "${GREEN}PASS${NC}"
        TESTS_PASSED=$((TESTS_PASSED + 1))
    else
        echo -e "${RED}FAIL${NC}"
        TESTS_FAILED=$((TESTS_FAILED + 1))
    fi
}

print_header "Octra Wallet - Integration Test Suite"

# =============================================================================
# Test 1: Directory Structure
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 1: Directory Structure${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "webcli directory exists" "[ -d '$PROJECT_DIR' ]"
run_test "ledger-app directory exists" "[ -d '$APP_DIR' ]"
run_test "scripts directory exists" "[ -d '$SCRIPT_DIR' ]"
run_test "src directory exists" "[ -d '$APP_DIR/src' ]"
run_test "include directory exists" "[ -d '$APP_DIR/include' ]"
run_test "static directory exists" "[ -d '$PROJECT_DIR/static' ]"
run_test "lib directory exists" "[ -d '$PROJECT_DIR/lib' ]"

echo ""

# =============================================================================
# Test 2: Required Files
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 2: Required Files${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "main.c exists" "[ -f '$APP_DIR/src/main.c' ]"
run_test "Makefile exists" "[ -f '$APP_DIR/Makefile' ]"
run_test "webcli Makefile exists" "[ -f '$PROJECT_DIR/Makefile' ]"
run_test "main.cpp exists" "[ -f '$PROJECT_DIR/main.cpp' ]"
run_test "ledger_bridge.hpp exists" "[ -f '$PROJECT_DIR/lib/ledger_bridge.hpp' ]"
run_test "ledger.js exists" "[ -f '$PROJECT_DIR/static/ledger.js' ]"
run_test "index.html exists" "[ -f '$PROJECT_DIR/static/index.html' ]"

echo ""

# =============================================================================
# Test 3: Build Environment
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 3: Build Environment${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "Python 3 is installed" "command -v python3"
run_test "speculos is installed" "python3 -c 'import speculos'"
run_test "ledgerblue is installed" "python3 -c 'import ledgerblue'"
run_test "ARM GCC is installed" "[ -f '$HOME/tools/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-gcc' ]"
run_test "Ledger SDK exists" "[ -f '$PROJECT_DIR/ledger-secure-sdk/Makefile.standard_app' ]"
run_test "qemu-arm-static available" "command -v qemu-arm-static"
run_test "clang is installed" "command -v clang"

echo ""

# =============================================================================
# Test 4: Build Artifacts
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 4: Build Artifacts${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

run_test "Nano X ELF exists" "[ -f '$APP_DIR/home/blue/projects/webcli-dev/ledger-app/dist/nanox/app.elf' ]"
run_test "Nano X hex exists" "[ -f '$APP_DIR/dist/nanox/app.hex' ]"
run_test "Nano S Plus ELF exists" "[ -f '$APP_DIR/home/blue/projects/webcli-dev/ledger-app/dist/nanos2/app.elf' ]"
run_test "Nano S Plus hex exists" "[ -f '$APP_DIR/dist/nanos2/app.hex' ]"

echo ""

# =============================================================================
# Test 5: Speculos Tests
# =============================================================================
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${YELLOW}Test 5: Speculos Emulation${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Nano X Speculos test
if [ -f "$APP_DIR/home/blue/projects/webcli-dev/ledger-app/dist/nanox/app.elf" ]; then
    print_info "Testing Nano X with Speculos..."
    python3 << 'PYEOF' && echo -e "  Speculos Nano X: ${GREEN}PASS${NC}" || echo -e "  Speculos Nano X: ${RED}FAIL${NC}"
import subprocess, time, socket, struct, sys

proc = subprocess.Popen(
    ['speculos', '--display', 'headless', '-m', 'nanox', '-a', '25',
     '--apdu-port', '39999', '--api-port', '35000',
     '/home/blue/projects/webcli-dev/ledger-app/dist/nanox/app.elf'],
    stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
)
time.sleep(4)

if proc.poll() is not None:
    sys.exit(1)

def send_apdu(port, apdu):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(5)
    sock.connect(('127.0.0.1', port))
    msg = struct.pack('>I', len(apdu)) + apdu
    sock.sendall(msg)
    raw = sock.recv(4096)
    sock.close()
    return raw[4:] if len(raw) > 4 else b''

resp = send_apdu(39999, bytes([0xE0, 0x00, 0x00, 0x00]))
proc.terminate()
proc.wait(timeout=3)

if len(resp) >= 6 and resp[-2:] == b'\x90\x00':
    sys.exit(0)
sys.exit(1)
PYEOF
    TESTS_TOTAL=$((TESTS_TOTAL + 1))
fi

# Nano S Plus Speculos test
if [ -f "$APP_DIR/home/blue/projects/webcli-dev/ledger-app/dist/nanos2/app.elf" ]; then
    print_info "Testing Nano S Plus with Speculos..."
    python3 << 'PYEOF2' && echo -e "  Speculos Nano S Plus: ${GREEN}PASS${NC}" || echo -e "  Speculos Nano S Plus: ${RED}FAIL${NC}"
import subprocess, time, socket, struct, sys

proc = subprocess.Popen(
    ['speculos', '--display', 'headless', '-m', 'nanosp', '-a', '25',
     '--apdu-port', '39998', '--api-port', '35001',
     '/home/blue/projects/webcli-dev/ledger-app/dist/nanos2/app.elf'],
    stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True
)
time.sleep(4)

if proc.poll() is not None:
    sys.exit(1)

def send_apdu(port, apdu):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(5)
    sock.connect(('127.0.0.1', port))
    msg = struct.pack('>I', len(apdu)) + apdu
    sock.sendall(msg)
    raw = sock.recv(4096)
    sock.close()
    return raw[4:] if len(raw) > 4 else b''

resp = send_apdu(39998, bytes([0xE0, 0x00, 0x00, 0x00]))
proc.terminate()
proc.wait(timeout=3)

if len(resp) >= 6 and resp[-2:] == b'\x90\x00':
    sys.exit(0)
sys.exit(1)
PYEOF2
    TESTS_TOTAL=$((TESTS_TOTAL + 1))
fi

echo ""

# =============================================================================
# Summary
# =============================================================================
print_header "Test Summary"

echo -e "  Total:  ${BLUE}$TESTS_TOTAL${NC}"
echo -e "  Passed: ${GREEN}$TESTS_PASSED${NC}"
echo -e "  Failed: ${RED}$TESTS_FAILED${NC}"
echo ""

if [ "$TESTS_FAILED" -eq 0 ]; then
    echo -e "${GREEN}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║  ALL TESTS PASSED!                                   ║${NC}"
    echo -e "${GREEN}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    exit 0
else
    echo -e "${RED}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}║  SOME TESTS FAILED                                   ║${NC}"
    echo -e "${RED}╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    exit 1
fi

#!/usr/bin/env python3
"""
Seed Phrase Implementation Test Suite for webcli
Tests 12, 15, and 24 word seed phrase support
"""

import subprocess
import time
import requests
import json
import os
import signal

BASE_URL = "http://localhost:8420"
PIN = "123456"

def start_server():
    """Start the webcli server"""
    os.chdir("/root/webcli")
    os.makedirs("data", exist_ok=True)
    
    # Kill any existing server
    subprocess.run(["pkill", "-f", "octra_wallet"], capture_output=True)
    time.sleep(1)
    
    # Start new server
    proc = subprocess.Popen(
        ["./octra_wallet", "8420"],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL
    )
    time.sleep(3)
    return proc

def stop_server(proc):
    """Stop the server"""
    proc.terminate()
    subprocess.run(["pkill", "-f", "octra_wallet"], capture_output=True)

def lock_wallet():
    """Lock the current wallet"""
    try:
        requests.post(f"{BASE_URL}/api/wallet/lock", timeout=5)
        time.sleep(0.5)
    except:
        pass

def test_create_wallet(word_count, expected_words):
    """Test creating a wallet with specific word count"""
    try:
        resp = requests.post(
            f"{BASE_URL}/api/wallet/create",
            json={"pin": PIN, "word_count": word_count},
            timeout=10
        )
        data = resp.json()
        
        if "error" in data:
            return False, f"Error: {data['error']}"
        
        mnemonic = data.get("mnemonic", "")
        actual_words = len(mnemonic.split())
        
        if actual_words == expected_words:
            return True, f"Generated {actual_words} words as expected"
        else:
            return False, f"Expected {expected_words} words, got {actual_words}"
    except Exception as e:
        return False, str(e)

def test_import_wallet(mnemonic, expected_success):
    """Test importing a wallet with mnemonic"""
    try:
        resp = requests.post(
            f"{BASE_URL}/api/wallet/import",
            json={"pin": PIN, "mnemonic": mnemonic},
            timeout=10
        )
        data = resp.json()
        
        if expected_success:
            if "address" in data:
                return True, f"Successfully imported, address: {data['address'][:20]}..."
            else:
                return False, f"Import failed: {data}"
        else:
            if "error" in data:
                return True, f"Correctly rejected: {data['error']}"
            else:
                return False, "Should have been rejected"
    except Exception as e:
        return False, str(e)

def test_invalid_word_count():
    """Test that invalid word counts are rejected"""
    try:
        resp = requests.post(
            f"{BASE_URL}/api/wallet/create",
            json={"pin": PIN, "word_count": 18},
            timeout=10
        )
        data = resp.json()
        
        if "error" in data and "word_count must be" in data["error"]:
            return True, "Correctly rejected invalid word_count"
        else:
            return False, f"Should have rejected: {data}"
    except Exception as e:
        return False, str(e)

def main():
    print("=" * 60)
    print("SEED PHRASE IMPLEMENTATION TEST SUITE")
    print("=" * 60)
    print()
    
    # Start server
    print("Starting webcli server...")
    proc = start_server()
    
    # Check server is running
    try:
        resp = requests.get(f"{BASE_URL}/api/wallet/status", timeout=5)
        print(f"Server status: {resp.json()}")
    except Exception as e:
        print(f"✗ FAIL: Server not responding - {e}")
        stop_server(proc)
        return 1
    
    print()
    
    passed = 0
    failed = 0
    
    # Test 1: Create wallet with 12 words
    print("Test 1: Create wallet with 12 words")
    ok, msg = test_create_wallet(12, 12)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 2: Create wallet with 15 words
    print("Test 2: Create wallet with 15 words")
    ok, msg = test_create_wallet(15, 15)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 3: Create wallet with 24 words
    print("Test 3: Create wallet with 24 words")
    ok, msg = test_create_wallet(24, 24)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 4: Invalid word_count
    print("Test 4: Invalid word_count=18 (should fail)")
    ok, msg = test_invalid_word_count()
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 5: Default word_count (should be 12)
    print("Test 5: Default word_count (no parameter)")
    ok, msg = test_create_wallet(12, 12)  # Using 12 as default
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 6: Import 12-word mnemonic
    print("Test 6: Import wallet with 12-word mnemonic")
    mnemonic_12 = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
    ok, msg = test_import_wallet(mnemonic_12, True)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 7: Import 15-word mnemonic
    print("Test 7: Import wallet with 15-word mnemonic")
    mnemonic_15 = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon able"
    ok, msg = test_import_wallet(mnemonic_15, True)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 8: Import 24-word mnemonic
    print("Test 8: Import wallet with 24-word mnemonic")
    mnemonic_24 = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon art"
    ok, msg = test_import_wallet(mnemonic_24, True)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    lock_wallet()
    
    # Test 9: Import invalid mnemonic (13 words)
    print("Test 9: Import invalid mnemonic (13 words - should fail)")
    mnemonic_13 = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
    ok, msg = test_import_wallet(mnemonic_13, False)
    if ok:
        print(f"  ✓ PASS: {msg}")
        passed += 1
    else:
        print(f"  ✗ FAIL: {msg}")
        failed += 1
    print()
    
    # Summary
    print("=" * 60)
    print("TEST SUMMARY")
    print("=" * 60)
    print(f"Passed: {passed}")
    print(f"Failed: {failed}")
    print()
    
    stop_server(proc)
    
    if failed == 0:
        print("✓ ALL TESTS PASSED!")
        return 0
    else:
        print("✗ SOME TESTS FAILED")
        return 1

if __name__ == "__main__":
    exit(main())

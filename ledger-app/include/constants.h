/*
    This file is part of Octra Wallet Ledger App.

    Octra Wallet Ledger App is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    Octra Wallet Ledger App is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Octra Wallet Ledger App.  If not, see <http://www.gnu.org/licenses/>.

    Copyright 2025-2026 Octra Labs
*/

#pragma once

#include <stdint.h>
#include <stdbool.h>

// App version
#define APP_VERSION_MAJOR       1
#define APP_VERSION_MINOR       0
#define APP_VERSION_PATCH       0

// CLA (Class byte) for Octra app
#define CLA_OCTRA               0xE0

// Maximum sizes
#define MAX_BIP32_PATH          10
#define MAX_DERIVED_PATH_LEN    256
#define MAX_TRANSACTION_LEN     1024
#define MAX_MESSAGE_LEN         256
#define MAX_RPC_URL_LEN         128

// Transaction types
#define TX_TYPE_TRANSFER        0x00
#define TX_TYPE_ENCRYPT         0x01
#define TX_TYPE_DECRYPT         0x02
#define TX_TYPE_STEALTH         0x03
#define TX_TYPE_TOKEN           0x04
#define TX_TYPE_CONTRACT        0x05

// Address format
#define ADDRESS_PREFIX          "oct"
#define ADDRESS_LEN             47  // "oct" + 44 base58 chars
#define PUBLIC_KEY_LEN          32
#define PRIVATE_KEY_LEN         64
#define SIGNATURE_LEN           64
#define SEED_LEN                64

// Hash lengths
#define SHA256_LEN              32
#define HASH_LEN                32

// Base58 alphabet
#define BASE58_ALPHABET         "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

// HD Path prefixes
#define HD_PATH_M               0x80000000
#define HD_PATH_OCTRA           0x80000C54  // 44' for Octra (registered SLIP-44: 3156 = 0xC54)
#define HD_PATH_PURPOSE         0x8000002C  // 44' - BIP44
#define HD_PATH_COIN_TYPE       0x80000C54  // 3156' - Octra
#define HD_PATH_ACCOUNT         0x80000000  // 0' - default account
#define HD_PATH_CHANGE_EXTERNAL 0x00000000  // 0 - external
#define HD_PATH_CHANGE_INTERNAL 0x00000001  // 1 - internal (change)

// Default derivation path: m/44'/3156'/0'/0/0
#define DEFAULT_DERIVATION_PATH { HD_PATH_PURPOSE, HD_PATH_COIN_TYPE, HD_PATH_ACCOUNT, 0, 0 }

// Buffer sizes
#define IO_BUFFER_SIZE          260
#define WORK_BUFFER_SIZE        512

// Flags for APDU commands
#define FLAG_NONE               0x00
#define FLAG_MORE               0x80  // More chunks coming
#define FLAG_LAST               0x00  // Last chunk (or only chunk)

// Display constraints (Nano S)
#define SCREEN_WIDTH            128
#define SCREEN_HEIGHT           32
#define MAX_DISPLAY_CHARS       16

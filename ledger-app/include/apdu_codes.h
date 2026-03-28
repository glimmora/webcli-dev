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

// Instruction codes for APDU commands
#define INS_GET_VERSION         0x00  // Get app version and device info
#define INS_GET_PUBLIC_KEY      0x01  // Get public key for address derivation
#define INS_SIGN_TRANSACTION    0x02  // Sign a transaction
#define INS_DERIVE_ADDRESS      0x03  // Derive address from HD path
#define INS_SIGN_MESSAGE        0x04  // Sign arbitrary message
#define INS_GET_BALANCE         0x05  // Get balance (via RPC passthrough)
#define INS_SUBMIT_TX           0x06  // Submit signed transaction

// APDU response codes
#define APDU_CODE_OK            0x9000  // Success
#define APDU_CODE_CANCEL        0x5501  // User cancelled
#define APDU_CODE_INVALID_P1P2  0x6A86  // Invalid P1/P2
#define APDU_CODE_INVALID_DATA  0x6A80  // Invalid data
#define APDU_CODE_WRONG_LENGTH  0x6700  // Wrong length
#define APDU_CODE_CONDITIONS    0x6985  // Conditions not satisfied
#define APDU_CODE_INTERNAL      0x6F00  // Internal error
#define APDU_CODE_CLASS         0x6E00  // Class not supported

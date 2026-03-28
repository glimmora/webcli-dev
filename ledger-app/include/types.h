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
#include "constants.h"

// Transaction structure for signing
typedef struct {
    uint8_t tx_type;              // Transaction type
    char from[ADDRESS_LEN + 1];   // Sender address
    char to[ADDRESS_LEN + 1];     // Recipient address
    uint64_t amount;              // Amount in micro-OCT
    uint32_t nonce;               // Account nonce
    uint32_t ou;                  // Operation unit (fee)
    uint64_t timestamp;           // Unix timestamp
    char message[256];            // Optional message
    uint8_t encrypted_data[256];  // Optional encrypted data
    uint8_t encrypted_len;        // Length of encrypted data
} octra_transaction_t;

// APDU command context
typedef struct {
    uint8_t ins;                  // Instruction code
    uint8_t p1;                   // Parameter 1
    uint8_t p2;                   // Parameter 2
    uint16_t lc;                  // Length of command data
    uint16_t le;                  // Expected response length
} apdu_command_t;

// Handler function type
typedef uint16_t (*apdu_handler_t)(const uint8_t* data, uint16_t data_len, 
                                    uint8_t* response, uint16_t max_response_len);

// State machine for multi-part operations
typedef enum {
    STATE_READY,
    STATE_RECEIVING_TX,
    STATE_SIGNING,
    STATE_WAITING_USER_CONFIRM
} app_state_t;

// Application context
typedef struct {
    app_state_t state;
    uint32_t derivation_path[MAX_BIP32_PATH];
    uint8_t path_len;
    uint8_t private_key[PRIVATE_KEY_LEN];
    uint8_t public_key[PUBLIC_KEY_LEN];
    char address[ADDRESS_LEN + 1];
    octra_transaction_t current_tx;
    uint8_t tx_buffer[MAX_TRANSACTION_LEN];
    uint16_t tx_buffer_offset;
    bool user_confirmed;
} app_context_t;

// Global application context
extern app_context_t g_app;

// Function declarations
void app_init(void);
void app_reset(void);
uint16_t handle_get_version(const uint8_t* data, uint16_t data_len, 
                            uint8_t* response, uint16_t max_response_len);
uint16_t handle_get_public_key(const uint8_t* data, uint16_t data_len,
                               uint8_t* response, uint16_t max_response_len);
uint16_t handle_derive_address(const uint8_t* data, uint16_t data_len,
                               uint8_t* response, uint16_t max_response_len);
uint16_t handle_sign_transaction(const uint8_t* data, uint16_t data_len,
                                 uint8_t* response, uint16_t max_response_len);
uint16_t handle_sign_message(const uint8_t* data, uint16_t data_len,
                             uint8_t* response, uint16_t max_response_len);

// Crypto functions
int crypto_derive_keypair(const uint32_t* path, uint8_t path_len,
                          uint8_t* private_key, uint8_t* public_key);
int crypto_sign(const uint8_t* message, uint16_t message_len,
                const uint8_t* private_key, uint8_t* signature);
int crypto_hash_sha256(const uint8_t* data, uint16_t data_len, uint8_t* hash);
int crypto_encode_base58(const uint8_t* data, uint16_t data_len, 
                         char* output, uint16_t max_output_len);
int crypto_encode_base64(const uint8_t* data, uint16_t data_len,
                         char* output, uint16_t max_output_len);

// Address functions
int derive_address_from_pubkey(const uint8_t* pubkey, char* address, uint16_t addr_len);
bool validate_address(const char* address);

// UI functions
bool ui_confirm_transaction(const octra_transaction_t* tx);
bool ui_confirm_message(const char* message, uint16_t len);
void ui_display_address(const char* address);
void ui_display_version(void);
void ui_display_error(const char* error);

// Buffer utilities
void buffer_append_uint32_be(uint8_t* buffer, uint16_t offset, uint32_t value);
uint32_t buffer_read_uint32_be(const uint8_t* buffer, uint16_t offset);
void buffer_append_uint64_be(uint8_t* buffer, uint16_t offset, uint64_t value);
uint64_t buffer_read_uint64_be(const uint8_t* buffer, uint16_t offset);

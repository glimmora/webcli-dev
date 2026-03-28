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
#include "types.h"

// Crypto function declarations
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

// Buffer utilities
void buffer_append_uint32_be(uint8_t* buffer, uint16_t offset, uint32_t value);
uint32_t buffer_read_uint32_be(const uint8_t* buffer, uint16_t offset);
void buffer_append_uint64_be(uint8_t* buffer, uint16_t offset, uint64_t value);
uint64_t buffer_read_uint64_be(const uint8_t* buffer, uint16_t offset);

// Secure memory zeroing
void secure_memzero(void* buffer, size_t len);

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

#include <os.h>
#include <os_io_seproxyhal.h>
#include <ux.h>
#include "types.h"

// UI function declarations
void ui_display_version(void);
void ui_display_error(const char* error);
void ui_display_address(const char* address);
void ui_display_amount(const char* label, uint64_t amount);
void ui_display_string(const char* label, const char* value);

// User confirmation
bool ui_confirm_path(const uint32_t* path, uint8_t path_len);
bool ui_confirm_transaction(const octra_transaction_t* tx);
bool ui_confirm_message(const char* message, uint16_t len);

// UX flows
extern const ux_flow_step_t* const ux_main_flow[];
extern const ux_flow_step_t* const ux_confirm_tx_flow[];
extern ux_state_t ux_state;

// Display buffers (extern)
extern char g_display_buffer[];
extern char g_amount_buffer[];
extern char g_address_buffer[];

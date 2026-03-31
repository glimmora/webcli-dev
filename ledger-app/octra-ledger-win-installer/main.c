/*
    Octra Wallet Ledger App - Production Build for Nano S/X
    Copyright 2025-2026 Octra Labs

    Compile with: make (inside Docker with BOLOS_SDK set)
*/

#include <stdint.h>
#include <string.h>

#include "os.h"
#include "ux.h"
#include "cx.h"
#include "os_io_seproxyhal.h"

// ============================================================================
// App Configuration
// ============================================================================

#define APPNAME    "Octra"
#define APPVERSION "1.0.0"

// APDU CLA
#define CLA 0xE0

// Instructions
#define INS_GET_VERSION      0x00
#define INS_GET_PUBLIC_KEY   0x01
#define INS_SIGN_TRANSACTION 0x02
#define INS_DERIVE_ADDRESS   0x03
#define INS_SIGN_MESSAGE     0x04

// Response codes
#define SW_OK           0x9000
#define SW_CANCEL       0x6985
#define SW_INVALID_DATA 0x6A80
#define SW_INTERNAL     0x6F00
#define SW_WRONG_LENGTH 0x6700
#define SW_CLA_NOT_SUPP 0x6E00
#define SW_INS_NOT_SUPP 0x6D00

// Constants
#define MAX_PATH     10
#define ADDR_LEN     47
#define PUB_KEY_LEN  32
#define PRIV_KEY_LEN 64
#define SIG_LEN      64
#define SHA256_LEN   32

// ============================================================================
// Global State
// ============================================================================

typedef struct {
    uint32_t path[MAX_PATH];
    uint8_t  path_len;
    uint8_t  pubkey[PUB_KEY_LEN];
    char     addr[ADDR_LEN + 1];
} app_state_t;

static app_state_t G_app_state;

// ============================================================================
// Forward Declarations
// ============================================================================

static void     app_main_impl(void);
static uint16_t handle_get_version(void);
static uint16_t handle_get_pubkey(const uint8_t *buf, uint16_t len);
static uint16_t handle_derive_addr(const uint8_t *buf, uint16_t len);
static uint16_t handle_sign_tx(const uint8_t *buf, uint16_t len);
static uint16_t handle_sign_msg(const uint8_t *buf, uint16_t len);

// ============================================================================
// Initialization
// ============================================================================

void app_exit(void) {
    os_sched_exit(-1);
}

static void reset_state(void) {
    explicit_bzero(&G_app_state, sizeof(app_state_t));
}

static void common_init(void) {
    UX_INIT();
    io_seproxyhal_init();
    USB_power(0);
    USB_power(1);
}

// ============================================================================
// Buffer Utilities
// ============================================================================

static void write_u32_be(uint8_t *buf, uint16_t off, uint32_t val) {
    buf[off]     = (val >> 24) & 0xFF;
    buf[off + 1] = (val >> 16) & 0xFF;
    buf[off + 2] = (val >> 8) & 0xFF;
    buf[off + 3] = val & 0xFF;
}

static uint32_t read_u32_be(const uint8_t *buf, uint16_t off) {
    return ((uint32_t)buf[off] << 24) | ((uint32_t)buf[off + 1] << 16) |
           ((uint32_t)buf[off + 2] << 8) | buf[off + 3];
}

static void write_u64_be(uint8_t *buf, uint16_t off, uint64_t val) {
    write_u32_be(buf, off, (uint32_t)(val >> 32));
    write_u32_be(buf, off + 4, (uint32_t)(val & 0xFFFFFFFF));
}

static uint64_t read_u64_be(const uint8_t *buf, uint16_t off) {
    return ((uint64_t)read_u32_be(buf, off) << 32) | read_u32_be(buf, off + 4);
}

// ============================================================================
// Base58 Encoding
// ============================================================================

static const char B58_ALPHABET[] =
    "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

static int base58_encode(const uint8_t *data, int len, char *out, int max) {
    if (len == 0) return 0;

    int zeros = 0;
    while (zeros < len && data[zeros] == 0) zeros++;

    int size = (len - zeros) * 138 / 100 + 1;
    if (size + zeros >= max) return -1;

    memset(out, 0, max);
    for (int i = 0; i < zeros; i++) out[i] = '1';

    uint8_t *b58   = (uint8_t *)out + zeros;
    int      b58len = 0;

    for (int i = zeros; i < len; i++) {
        uint16_t carry = data[i];
        for (int j = 0; j < b58len || carry; j++) {
            carry += (uint16_t)b58[j] << 8;
            b58[j] = carry % 58;
            carry /= 58;
            if (j >= b58len) b58len = j + 1;
        }
    }

    for (int i = 0; i < b58len; i++)
        out[zeros + i] = B58_ALPHABET[b58[b58len - 1 - i]];

    out[zeros + b58len] = '\0';
    return zeros + b58len;
}

// ============================================================================
// Cryptography  (updated to use no-throw SDK API)
// ============================================================================

/**
 * Derive Ed25519 keypair from BIP32 path.
 * Uses the modern no-throw SDK API.
 */
static int derive_keypair(const uint32_t *path, uint8_t path_len,
                          cx_ecfp_private_key_t *priv_key,
                          cx_ecfp_public_key_t  *pub_key) {
    uint8_t  raw[64];
    cx_err_t err;

    /* Derive raw private key bytes from seed */
    err = os_derive_bip32_with_seed_no_throw(
        HDW_ED25519_SLIP10,   /* derivation mode */
        CX_CURVE_Ed25519,
        path,
        (unsigned int)path_len,
        raw,
        NULL,                 /* chain code (optional) */
        NULL,                 /* seed key (NULL = default) */
        0                     /* seed key length */
    );
    if (err != CX_OK) {
        explicit_bzero(raw, sizeof(raw));
        return -1;
    }

    /* Initialise private key structure */
    err = cx_ecfp_init_private_key_no_throw(CX_CURVE_Ed25519, raw, 32, priv_key);
    explicit_bzero(raw, sizeof(raw));
    if (err != CX_OK) return -1;

    /* Derive public key */
    err = cx_ecfp_generate_pair_no_throw(CX_CURVE_Ed25519, pub_key, priv_key, 1);
    if (err != CX_OK) {
        explicit_bzero(priv_key, sizeof(*priv_key));
        return -1;
    }

    return 0;
}

/**
 * SHA-256 hash using the modern no-throw API.
 */
static int sha256_hash(const uint8_t *in, uint16_t len, uint8_t *out) {
    cx_sha256_t sha;
    cx_err_t    err;

    err = cx_sha256_init_no_throw(&sha);
    if (err != CX_OK) return -1;

    err = cx_hash_no_throw(&sha.header, CX_LAST, in, len, out, SHA256_LEN);
    return (err == CX_OK) ? 0 : -1;
}

/**
 * Derive Octra address from a 32-byte Ed25519 public key.
 * Format: "oct" + base58(SHA256(pubkey)), padded to 47 chars total.
 */
static int get_address(const uint8_t *pub32, char *addr) {
    uint8_t hash[SHA256_LEN];

    if (sha256_hash(pub32, PUB_KEY_LEN, hash) != 0) return -1;

    char b58[64];
    if (base58_encode(hash, SHA256_LEN, b58, sizeof(b58)) < 0) return -1;

    int blen = (int)strlen(b58);

    addr[0] = 'o';
    addr[1] = 'c';
    addr[2] = 't';

    /* Pad with leading '1's to reach 44 base58 chars */
    if (blen < 44) {
        int pad = 44 - blen;
        for (int i = 0; i < pad; i++) addr[3 + i] = '1';
        memcpy(addr + 3 + pad, b58, blen);
    } else {
        memcpy(addr + 3, b58, 44);
    }

    addr[ADDR_LEN] = '\0';
    return 0;
}

// ============================================================================
// APDU Handlers
// ============================================================================

static uint16_t handle_get_version(void) {
    G_io_apdu_buffer[0] = 1; /* Major */
    G_io_apdu_buffer[1] = 0; /* Minor */
    G_io_apdu_buffer[2] = 0; /* Patch */
#if defined(TARGET_NANOX)
    G_io_apdu_buffer[3] = 2; /* Device type: 2=Nano X */
#elif defined(TARGET_NANOS2)
    G_io_apdu_buffer[3] = 3; /* Device type: 3=Nano S Plus */
#elif defined(TARGET_STAX)
    G_io_apdu_buffer[3] = 4; /* Device type: 4=Stax */
#else
    G_io_apdu_buffer[3] = 1; /* Device type: 1=Nano S */
#endif
    return 4;
}

static uint16_t handle_get_pubkey(const uint8_t *buf, uint16_t len) {
    if (len < 5) return SW_INVALID_DATA;

    uint8_t path_len = buf[0];
    if (path_len == 0 || path_len > MAX_PATH) return SW_INVALID_DATA;
    if (len < (uint16_t)(1 + path_len * 4)) return SW_WRONG_LENGTH;

    /* Parse derivation path */
    for (uint8_t i = 0; i < path_len; i++)
        G_app_state.path[i] = read_u32_be(buf, (uint16_t)(1 + i * 4));
    G_app_state.path_len = path_len;

    /* Derive keypair */
    cx_ecfp_private_key_t priv_key;
    cx_ecfp_public_key_t  pub_key;

    if (derive_keypair(G_app_state.path, G_app_state.path_len,
                       &priv_key, &pub_key) != 0) {
        return SW_INTERNAL;
    }

    /* Extract raw 32-byte public key (compressed Ed25519 point) */
    memcpy(G_app_state.pubkey, pub_key.W + 1, PUB_KEY_LEN);
    explicit_bzero(&priv_key, sizeof(priv_key));

    /* Derive address */
    if (get_address(G_app_state.pubkey, G_app_state.addr) != 0)
        return SW_INTERNAL;

    /* Build response: [pubkey_len][pubkey][addr_len][addr] */
    uint16_t resp = 0;
    G_io_apdu_buffer[resp++] = PUB_KEY_LEN;
    memcpy(G_io_apdu_buffer + resp, G_app_state.pubkey, PUB_KEY_LEN);
    resp += PUB_KEY_LEN;

    uint16_t alen = (uint16_t)strlen(G_app_state.addr);
    G_io_apdu_buffer[resp++] = (uint8_t)alen;
    memcpy(G_io_apdu_buffer + resp, G_app_state.addr, alen);
    resp += alen;

    return resp;
}

static uint16_t handle_derive_addr(const uint8_t *buf, uint16_t len) {
    if (len < 5) return SW_INVALID_DATA;

    uint8_t path_len = buf[0];
    if (path_len == 0 || path_len > MAX_PATH) return SW_INVALID_DATA;
    if (len < (uint16_t)(1 + path_len * 4)) return SW_WRONG_LENGTH;

    uint32_t path[MAX_PATH];
    for (uint8_t i = 0; i < path_len; i++)
        path[i] = read_u32_be(buf, (uint16_t)(1 + i * 4));

    cx_ecfp_private_key_t priv_key;
    cx_ecfp_public_key_t  pub_key;

    if (derive_keypair(path, path_len, &priv_key, &pub_key) != 0)
        return SW_INTERNAL;

    uint8_t pub32[PUB_KEY_LEN];
    memcpy(pub32, pub_key.W + 1, PUB_KEY_LEN);
    explicit_bzero(&priv_key, sizeof(priv_key));

    char addr[ADDR_LEN + 1];
    if (get_address(pub32, addr) != 0) return SW_INTERNAL;

    uint16_t alen = (uint16_t)strlen(addr);
    memcpy(G_io_apdu_buffer, addr, alen);
    return alen;
}

static uint16_t handle_sign_tx(const uint8_t *buf, uint16_t len) {
    if (len < 75) return SW_INVALID_DATA;

    /* Hash transaction data */
    uint8_t hash[SHA256_LEN];
    if (sha256_hash(buf, len, hash) != 0) return SW_INTERNAL;

    /* Derive signing key */
    cx_ecfp_private_key_t priv_key;
    cx_ecfp_public_key_t  pub_key;

    if (G_app_state.path_len > 0) {
        if (derive_keypair(G_app_state.path, G_app_state.path_len,
                           &priv_key, &pub_key) != 0)
            return SW_INTERNAL;
    } else {
        /* Default: m/44'/3156'/0'/0/0 */
        uint32_t defpath[] = {0x8000002C, 0x80000C54, 0x80000000, 0, 0};
        if (derive_keypair(defpath, 5, &priv_key, &pub_key) != 0)
            return SW_INTERNAL;
    }

    /* Sign hash with Ed25519 */
    size_t   sig_len = SIG_LEN;
    cx_err_t err = cx_eddsa_sign_no_throw(&priv_key, CX_SHA512,
                                          hash, SHA256_LEN,
                                          G_io_apdu_buffer, sig_len);
    explicit_bzero(&priv_key, sizeof(priv_key));

    if (err != CX_OK) return SW_INTERNAL;
    return (uint16_t)sig_len;
}

static uint16_t handle_sign_msg(const uint8_t *buf, uint16_t len) {
    if (len == 0) return SW_INVALID_DATA;

    /* Hash message */
    uint8_t hash[SHA256_LEN];
    if (sha256_hash(buf, len, hash) != 0) return SW_INTERNAL;

    /* Derive signing key */
    cx_ecfp_private_key_t priv_key;
    cx_ecfp_public_key_t  pub_key;

    if (G_app_state.path_len > 0) {
        if (derive_keypair(G_app_state.path, G_app_state.path_len,
                           &priv_key, &pub_key) != 0)
            return SW_INTERNAL;
    } else {
        uint32_t defpath[] = {0x8000002C, 0x80000C54, 0x80000000, 0, 0};
        if (derive_keypair(defpath, 5, &priv_key, &pub_key) != 0)
            return SW_INTERNAL;
    }

    size_t   sig_len = SIG_LEN;
    cx_err_t err = cx_eddsa_sign_no_throw(&priv_key, CX_SHA512,
                                          hash, SHA256_LEN,
                                          G_io_apdu_buffer, sig_len);
    explicit_bzero(&priv_key, sizeof(priv_key));

    if (err != CX_OK) return SW_INTERNAL;
    return (uint16_t)sig_len;
}

// ============================================================================
// Main APDU Loop  (uses io_exchange — the standard SDK pattern)
// ============================================================================

static void app_main_impl(void) {
    volatile uint16_t rx = 0;
    volatile uint16_t tx = 0;
    volatile uint8_t  flags = 0;

    for (;;) {
        BEGIN_TRY {
            TRY {
                rx = io_exchange(CHANNEL_APDU | flags, tx);
                flags = 0;
                tx    = 0;

                if (rx < 4) {
                    /* Malformed APDU */
                    G_io_apdu_buffer[tx++] = (SW_WRONG_LENGTH >> 8) & 0xFF;
                    G_io_apdu_buffer[tx++] = SW_WRONG_LENGTH & 0xFF;
                    continue;
                }

                uint8_t cla = G_io_apdu_buffer[0];
                uint8_t ins = G_io_apdu_buffer[1];
                /* p1/p2 reserved for future use */
                uint8_t lc  = (rx > 4) ? G_io_apdu_buffer[4] : 0;

                /* Validate CLA */
                if (cla != CLA) {
                    G_io_apdu_buffer[tx++] = (SW_CLA_NOT_SUPP >> 8) & 0xFF;
                    G_io_apdu_buffer[tx++] = SW_CLA_NOT_SUPP & 0xFF;
                    continue;
                }

                const uint8_t *data     = (lc > 0 && rx >= (uint16_t)(5 + lc))
                                              ? G_io_apdu_buffer + 5
                                              : NULL;
                uint16_t       data_len = (lc > 0 && rx >= (uint16_t)(5 + lc))
                                              ? lc
                                              : 0;

                uint16_t sw;
                switch (ins) {
                    case INS_GET_VERSION:
                        sw = handle_get_version();
                        break;
                    case INS_GET_PUBLIC_KEY:
                        sw = handle_get_pubkey(data, data_len);
                        break;
                    case INS_DERIVE_ADDRESS:
                        sw = handle_derive_addr(data, data_len);
                        break;
                    case INS_SIGN_TRANSACTION:
                        sw = handle_sign_tx(data, data_len);
                        break;
                    case INS_SIGN_MESSAGE:
                        sw = handle_sign_msg(data, data_len);
                        break;
                    default:
                        sw = SW_INS_NOT_SUPP;
                }

                /* Append status word */
                if (sw >= 0x6000) {
                    /* Error: return only SW */
                    tx = 0;
                    G_io_apdu_buffer[tx++] = (sw >> 8) & 0xFF;
                    G_io_apdu_buffer[tx++] = sw & 0xFF;
                } else {
                    /* Success: data already in buffer, append 9000 */
                    G_io_apdu_buffer[sw]     = 0x90;
                    G_io_apdu_buffer[sw + 1] = 0x00;
                    tx = sw + 2;
                }
            }
            CATCH(EXCEPTION_IO_RESET) {
                THROW(EXCEPTION_IO_RESET);
            }
            CATCH_OTHER(e) {
                uint16_t sw = (e >= 0x6000 && e < 0x9000) ? (uint16_t)e : SW_INTERNAL;
                if (e == SW_CANCEL) sw = 0x6985;
                tx = 0;
                G_io_apdu_buffer[tx++] = (sw >> 8) & 0xFF;
                G_io_apdu_buffer[tx++] = sw & 0xFF;
            }
            FINALLY {}
        }
        END_TRY;
    }
}

// ============================================================================
// App Entry Point
// ============================================================================

__attribute__((section(".boot"))) void app_main(void) {
    reset_state();
    common_init();
    app_main_impl();
}

// N00bDemo/shim.c — minimal C glue
//
// Provides:
//  1. POSIX stubs required by libswiftEmbeddedPlatformPOSIX
//  2. Static OT + primitive buffers (fixed-size C arrays)
//  3. GPU primitive macro wrappers (not importable to Swift)

#include <stddef.h>
#include <stdint.h>
#include <psxgpu.h>
#include <psxsio.h>

// ---------------------------------------------------------------------------
// POSIX stubs for libswiftEmbeddedPlatformPOSIX
// ---------------------------------------------------------------------------

extern void *malloc(size_t size);
extern void  free(void *ptr);

int posix_memalign(void **memptr, size_t alignment, size_t size) {
    void *p = malloc(size);
    if (!p) return 12; // ENOMEM
    *memptr = p;
    return 0;
}

void arc4random_buf(void *buf, size_t nbytes) {
    static uint32_t state = 0xDEADBEEF;
    uint8_t *p = (uint8_t *)buf;
    for (size_t i = 0; i < nbytes; i++) {
        state = state * 1664525u + 1013904223u;
        p[i] = (uint8_t)(state >> 24);
    }
}

int  putchar(int c)   { AddSIO(c); return c; }
void exit(int code)   { (void)code; while (1) {} }

uintptr_t __stack_chk_guard = 0xDEADC0DE;
void __stack_chk_fail(void) { while (1) {} }

// ---------------------------------------------------------------------------
// Static render buffers
// ---------------------------------------------------------------------------

#define OT_LENGTH  16
#define BUFFER_LEN 8192

static uint32_t s_ot[2][OT_LENGTH];
static uint8_t  s_prim[2][BUFFER_LEN];
static uint8_t *s_next_prim;

uint32_t *ps1_ot(int buf)         { return s_ot[buf]; }
void      ps1_prim_reset(int buf) { s_next_prim = s_prim[buf]; }
void      ps1_clear_ot(int buf)   { ClearOTagR(s_ot[buf], OT_LENGTH); }

// ---------------------------------------------------------------------------
// GPU primitive macro wrappers
// ---------------------------------------------------------------------------

void ps1_set_rgb0(DRAWENV *e, uint8_t r, uint8_t g, uint8_t b) {
    setRGB0(e, r, g, b);
}

void ps1_add_tile(int buf, int z,
                  int x, int y, int w, int h,
                  uint8_t r, uint8_t g, uint8_t b) {
    TILE *tile = (TILE *)s_next_prim;
    setTile(tile);
    setXY0(tile, x, y);
    setWH(tile, w, h);
    setRGB0(tile, r, g, b);
    addPrim(&s_ot[buf][z], tile);
    s_next_prim += sizeof(TILE);
}

void ps1_fnt_sort(int buf, int z, int x, int y, const char *text) {
    s_next_prim = (uint8_t *)FntSort(&s_ot[buf][z], (char *)s_next_prim, x, y, text);
}

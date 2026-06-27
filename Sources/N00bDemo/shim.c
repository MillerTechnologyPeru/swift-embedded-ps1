// N00bDemo/shim.c — minimal C glue
//
// Provides:
//  1. POSIX stubs required by libswiftEmbeddedPlatformPOSIX
//  2. Static OT + primitive buffers (fixed-size C arrays)
//  3. GPU primitive macro wrappers (not importable to Swift)

#include <stddef.h>
#include <stdint.h>
#include <psxgpu.h>
#include <psxapi.h>
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
// Static render buffers + display state
// ---------------------------------------------------------------------------

#define OT_LENGTH  16
#define BUFFER_LEN 8192

static uint32_t s_ot[2][OT_LENGTH];
static uint8_t  s_prim[2][BUFFER_LEN];
static uint8_t *s_next_prim;

static DISPENV s_disp[2];
static DRAWENV s_draw[2];
static int     s_active = 0;

int ps1_active_buffer(void) { return s_active; }

void ps1_init_display(void) {
    ResetGraph(0);
    FntLoad(960, 0);

    SetDefDispEnv(&s_disp[0], 0,   0, 320, 240);
    SetDefDispEnv(&s_disp[1], 0, 240, 320, 240);
    SetDefDrawEnv(&s_draw[0], 0, 240, 320, 240);
    SetDefDrawEnv(&s_draw[1], 0,   0, 320, 240);

    setRGB0(&s_draw[0], 63, 0, 127);
    setRGB0(&s_draw[1], 63, 0, 127);
    s_draw[0].isbg = 1;
    s_draw[1].isbg = 1;

    s_active = 0;
    ClearOTagR(s_ot[0], OT_LENGTH);
    s_next_prim = s_prim[0];

    PutDispEnv(&s_disp[0]);
    PutDrawEnv(&s_draw[0]);
    SetDispMask(1);
}

void ps1_flip(void) {
    int draw = s_active;
    int disp = draw ^ 1;
    DrawSync(0);
    VSync(0);
    PutDispEnv(&s_disp[disp]);
    PutDrawEnv(&s_draw[draw]);
    DrawOTag(s_ot[draw] + OT_LENGTH - 1);
    s_active = disp;
    s_next_prim = s_prim[disp];
    ClearOTagR(s_ot[disp], OT_LENGTH);
}

// ---------------------------------------------------------------------------
// GPU primitive macro wrappers
// ---------------------------------------------------------------------------

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

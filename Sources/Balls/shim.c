// Balls/shim.c — C glue for the balls example
//
// Provides:
//  1. POSIX stubs for libswiftEmbeddedPlatformPOSIX
//  2. Static OT + primitive buffers (fixed-size C arrays)
//  3. GPU primitive macro wrappers (not importable to Swift)
//  4. TIM texture load helpers
//  5. rand/srand wrappers (stdlib not in bridging header)

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
    if (!p) return 12;
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
// Static render buffers (OT_LEN=8, 64 KB prim buffer — matches original)
// ---------------------------------------------------------------------------

#define OT_LEN     8
#define BUFFER_LEN 65536

static uint32_t s_ot[2][OT_LEN];
static uint8_t  s_prim[2][BUFFER_LEN];
static uint8_t *s_next_prim;

uint32_t *ps1_ot(int buf)         { return s_ot[buf]; }
void      ps1_prim_reset(int buf) { s_next_prim = s_prim[buf]; }
void      ps1_clear_ot(int buf)   { ClearOTagR(s_ot[buf], OT_LEN); }
int       ps1_ot_len(void)        { return OT_LEN; }

// ---------------------------------------------------------------------------
// DRAWENV background colour macro wrapper
// ---------------------------------------------------------------------------

void ps1_set_rgb0(DRAWENV *e, uint8_t r, uint8_t g, uint8_t b) {
    setRGB0(e, r, g, b);
}

// ---------------------------------------------------------------------------
// TIM texture loading
// ---------------------------------------------------------------------------

extern const uint32_t ball16c[];   // defined in ball16c.S

static uint16_t s_clut_x, s_clut_y, s_tpage;

void ps1_load_tim(void) {
    TIM_IMAGE tim;
    GetTimInfo((uint32_t *)ball16c, &tim);
    LoadImage(tim.prect, tim.paddr);
    if (tim.mode & 0x8)
        LoadImage(tim.crect, tim.caddr);
    DrawSync(0);
    s_clut_x = tim.crect->x;
    s_clut_y = tim.crect->y;
    s_tpage  = getTPage(tim.mode & 0x3, 0, tim.prect->x, tim.prect->y);
}

uint16_t ps1_clut_x(void)   { return s_clut_x; }
uint16_t ps1_clut_y(void)   { return s_clut_y; }
uint16_t ps1_tpage_val(void) { return s_tpage; }

// ---------------------------------------------------------------------------
// GPU primitive macro wrappers
// ---------------------------------------------------------------------------

// SPRT_16: 16x16 textured sprite with CLUT
void ps1_add_sprt16(int buf, int z,
                    int x, int y, uint8_t u, uint8_t v,
                    uint8_t r, uint8_t g, uint8_t b) {
    SPRT_16 *sprt = (SPRT_16 *)s_next_prim;
    setSprt16(sprt);
    setXY0(sprt, x, y);
    setRGB0(sprt, r, g, b);
    setUV0(sprt, u, v);
    setClut(sprt, s_clut_x, s_clut_y);
    addPrim(&s_ot[buf][z], sprt);
    s_next_prim += sizeof(SPRT_16);
}

// DR_TPAGE: GPU command to set the active texture page
void ps1_add_tpage(int buf, int z) {
    DR_TPAGE *tpri = (DR_TPAGE *)s_next_prim;
    setDrawTPage(tpri, 0, 0, s_tpage);
    addPrim(&s_ot[buf][z], tpri);
    s_next_prim += sizeof(DR_TPAGE);
}

// ---------------------------------------------------------------------------
// rand/srand wrappers (stdlib.h not in bridging header)
// ---------------------------------------------------------------------------

extern int  rand(void);
extern void srand(unsigned int seed);

int  ps1_rand(void)             { return rand(); }
void ps1_srand(unsigned int s)  { srand(s); }

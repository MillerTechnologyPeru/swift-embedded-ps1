// shim.c — PSn00bSDK wrappers + POSIX stubs for libswiftEmbeddedPlatformPOSIX
//
// Rendering follows the PSn00bSDK reference pattern:
//   FntSort → OT → DrawOTagEnv   (NOT FntPrint/FntFlush)

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

int putchar(int c) { AddSIO(c); return c; }

void exit(int code) { (void)code; while (1) {} }

uintptr_t __stack_chk_guard = 0xDEADC0DE;
void __stack_chk_fail(void) { while (1) {} }

// ---------------------------------------------------------------------------
// Render context  (mirrors PSn00bSDK reference example)
// ---------------------------------------------------------------------------

#define OT_LENGTH    16
#define BUFFER_LEN   8192

typedef struct {
    DISPENV  disp;
    DRAWENV  draw;
    uint32_t ot[OT_LENGTH];
    uint8_t  prim[BUFFER_LEN];
} RenderBuffer;

static RenderBuffer s_buf[2];
static uint8_t     *s_next;
static int          s_active;

void swift_init_display(void) {
    ResetGraph(0);
    FntLoad(960, 0);

    // Buffer 0: display top half, draw bottom half
    SetDefDispEnv(&s_buf[0].disp, 0,   0, 320, 240);
    SetDefDrawEnv(&s_buf[0].draw, 0, 240, 320, 240);
    // Buffer 1: display bottom half, draw top half
    SetDefDispEnv(&s_buf[1].disp, 0, 240, 320, 240);
    SetDefDrawEnv(&s_buf[1].draw, 0,   0, 320, 240);

    setRGB0(&s_buf[0].draw, 24, 8, 64);
    setRGB0(&s_buf[1].draw, 24, 8, 64);
    s_buf[0].draw.isbg = 1;
    s_buf[1].draw.isbg = 1;

    s_active = 0;
    s_next   = s_buf[0].prim;
    ClearOTagR(s_buf[0].ot, OT_LENGTH);

    PutDispEnv(&s_buf[0].disp);
    PutDrawEnv(&s_buf[0].draw);
    SetDispMask(1);
}

void swift_flip(void) {
    DrawSync(0);
    VSync(0);

    RenderBuffer *draw = &s_buf[s_active];
    RenderBuffer *disp = &s_buf[s_active ^ 1];

    PutDispEnv(&disp->disp);
    PutDrawEnv(&draw->draw);
    DrawOTag(&draw->ot[OT_LENGTH - 1]);

    s_active ^= 1;
    s_next    = disp->prim;
    ClearOTagR(disp->ot, OT_LENGTH);
}

// PS1 debug font glyph height is 15 pixels.
#define FONT_LINE_H 15
static int s_text_y = 8;

void swift_draw_text(const char *text) {
    s_next = (uint8_t *)FntSort(
        &s_buf[s_active].ot[0], s_next, 8, s_text_y, text);
    s_text_y += FONT_LINE_H;
}

void swift_begin_frame(void) {
    s_text_y = 8;
}

void swift_draw_hello(void) {
    swift_draw_text("Hello from Swift on PS1!");
    swift_draw_text("PSn00bSDK + Embedded Swift");
}

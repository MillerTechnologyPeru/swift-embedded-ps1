// Balls/shim.c — PSn00bSDK balls example, C code verbatim.
// Swift entry point (swift_main) just calls balls_main().

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>
#include <psxgpu.h>
#include <psxapi.h>
#include <psxgte.h>
#include <psxetc.h>
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
// Heap init
// ---------------------------------------------------------------------------

extern int InitHeap(unsigned int *addr, int size);
extern char _end;

void ps1_init_heap(void) {
    unsigned int start = (unsigned int)&_end;
    int size = (int)(0x801E0000u - start);
    InitHeap((unsigned int *)start, size);
}

// ---------------------------------------------------------------------------
// Balls example — verbatim from PSn00bSDK examples/graphics/balls/main.c
// (only change: main() renamed balls_main())
// ---------------------------------------------------------------------------

#define OTLEN       8
#define MAX_BALLS   1024

typedef struct {
    DISPENV disp;
    DRAWENV draw;
} DB;

DB      db[2];
int     db_active = 0;

unsigned int  ot[2][OTLEN];
char          pribuff[2][65536];
char         *nextpri;

u_short tpage;
u_short clut_x, clut_y;

#include "BallTypes.h"

BALL balls[MAX_BALLS];

extern const unsigned int ball16c[];   /* ball16c.S — .incbin of ball16c.tim */

int counter = 0;

// Accessors so Swift can drive the frame flip.  Globals stay in C; the
// DISPENV/DRAWENV/OT pointers are handed to Swift to pass back into the
// (importable) PutDispEnv/PutDrawEnv/DrawOTag/ClearOTagR functions.
int           balls_db_active(void)    { return db_active; }
void          balls_db_swap(void)      { db_active ^= 1; }
DISPENV      *balls_dispenv(int b)     { return &db[b].disp; }
DRAWENV      *balls_drawenv(int b)     { return &db[b].draw; }
unsigned int *balls_ot(int b)          { return ot[b]; }
void          balls_reset_prim(int b)  { nextpri = pribuff[b]; }

void init(void) {
    int i;
    TIM_IMAGE tim;

    ResetGraph(0);

    SetDefDispEnv(&db[0].disp, 0, 0, 640, 480);
    SetDefDrawEnv(&db[0].draw, 0, 0, 640, 480);
    SetDefDispEnv(&db[1].disp, 0, 0, 640, 480);
    SetDefDrawEnv(&db[1].draw, 0, 0, 640, 480);

    db[0].disp.isinter = 1;
    db[1].disp.isinter = 1;

    setRGB0(&db[0].draw, 63, 0, 127);
    db[0].draw.isbg = 1;
    db[0].draw.dtd  = 1;
    setRGB0(&db[1].draw, 63, 0, 127);
    db[1].draw.isbg = 1;
    db[1].draw.dtd  = 1;

    PutDispEnv(&db[0].disp);
    PutDrawEnv(&db[0].draw);
    SetDispMask(1);

    GetTimInfo(ball16c, &tim);
    LoadImage(tim.prect, tim.paddr);
    if (tim.mode & 0x8)
        LoadImage(tim.crect, tim.caddr);
    DrawSync(0);

    tpage  = getTPage(tim.mode & 0x3, 0, tim.prect->x, tim.prect->y);
    clut_x = tim.crect->x;
    clut_y = tim.crect->y;

    db_active = 0;
    ClearOTagR(ot[0], OTLEN);
    nextpri = pribuff[0];

    for (i = 0; i < MAX_BALLS; i++) {
        balls[i].x    = rand() % 624;
        balls[i].y    = rand() % 464;
        balls[i].xdir = 1 - (rand() % 3);
        balls[i].ydir = 1 - (rand() % 3);
        if (!balls[i].xdir) balls[i].xdir = 1;
        if (!balls[i].ydir) balls[i].ydir = 1;
        balls[i].xdir *= 2;
        balls[i].ydir *= 2;
        balls[i].r = rand() % 256;
        balls[i].g = rand() % 256;
        balls[i].b = rand() % 256;
    }
}

void balls_init(void) {
    init();
}

BALL *balls_array(void) { return balls; }

/* Macro-wrapper shims so Swift can build the frame.  The GPU primitive setup
   is all C macros (setSprt16/setClut/addPrim/...) which can't be imported. */

void balls_add_sprite(int x, int y, int r, int g, int b) {
    SPRT_16 *sprt = (SPRT_16 *)nextpri;
    setSprt16(sprt);
    setXY0(sprt, x, y);
    setRGB0(sprt, r, g, b);
    setUV0(sprt, 0, 0);
    setClut(sprt, clut_x, clut_y);
    addPrim(ot[db_active] + (OTLEN - 1), sprt);
    nextpri += sizeof(SPRT_16);
}

void balls_add_tpage(void) {
    DR_TPAGE *tpri = (DR_TPAGE *)nextpri;
    setDrawTPage(tpri, 0, 0, tpage);
    addPrim(ot[db_active] + (OTLEN - 1), tpri);
    nextpri += sizeof(DR_TPAGE);
}

int  balls_counter(void) { return counter; }
void balls_tick(void)    { counter++; }

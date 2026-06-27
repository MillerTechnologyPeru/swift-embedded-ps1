// RGB24/shim.c — PSn00bSDK RGB24 (24-bit color) example, C code verbatim.
// (only change: main() renamed rgb24_main() so Swift can call it)

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/types.h>
#include <psxgte.h>
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
// RGB24 example — verbatim from PSn00bSDK examples/graphics/rgb24/main.c
// ---------------------------------------------------------------------------

// So data from tim.s can be accessed
extern u_long tim_image[];

void rgb24_main() {

	DISPENV		disp;
	TIM_IMAGE	tim;

	// Reset GPU
	ResetGraph(0);

	// Setup 640x480 24-bit video mode
	SetDefDispEnv(&disp, 0, 0, 640, 480);
	disp.isrgb24 = 1;
	disp.isinter = 1;

	// Apply and enable display
	PutDispEnv(&disp);
	SetDispMask(1);

	// Upload image to VRAM
	GetTimInfo(tim_image, &tim);
	LoadImage(tim.prect, tim.paddr);
	DrawSync(0);

	while(1) {
	}

}

// shim.c — thin C wrappers over PSn00bSDK APIs that can't be called directly
// from Embedded Swift (function-like macros, variadic functions), plus POSIX
// stubs required by libswiftEmbeddedPlatformPOSIX.a.

#include <stddef.h>
#include <stdint.h>
#include <psxgpu.h>
#include <psxsio.h>

// ---------------------------------------------------------------------------
// POSIX stubs for libswiftEmbeddedPlatformPOSIX
// ---------------------------------------------------------------------------

// posix_memalign — backed by PSn00bSDK malloc.
// malloc is provided by psn00bsdk/libc.a.
extern void *malloc(size_t size);
extern void  free(void *ptr);

int posix_memalign(void **memptr, size_t alignment, size_t size) {
    // PSn00bSDK malloc aligns to at least 4 bytes; alignment > 4 unsupported.
    void *p = malloc(size);
    if (!p) return 12; // ENOMEM
    *memptr = p;
    return 0;
}

// arc4random_buf — simple LCG; PS1 has no hardware RNG.
void arc4random_buf(void *buf, size_t nbytes) {
    static uint32_t state = 0xDEADBEEF;
    uint8_t *p = (uint8_t *)buf;
    for (size_t i = 0; i < nbytes; i++) {
        state = state * 1664525u + 1013904223u;
        p[i] = (uint8_t)(state >> 24);
    }
}

// putchar — route to PSn00bSDK serial I/O (SIO TTY).
int putchar(int c) {
    AddSIO(c);
    return c;
}

// exit — infinite halt (no OS to return to).
void exit(int code) {
    (void)code;
    while (1) {}
}

// Stack-protector stubs — bare metal has no canary infrastructure.
// Disable further generation with -fno-stack-protector in compile flags.
uintptr_t __stack_chk_guard = 0xDEADC0DE;
void __stack_chk_fail(void) { while (1) {} }

// ---------------------------------------------------------------------------
// PSn00bSDK macro/variadic wrappers
// ---------------------------------------------------------------------------

// setRGB0 is a function-like macro.
void swift_setRGB0(DRAWENV *p, unsigned char r, unsigned char g, unsigned char b) {
    setRGB0(p, r, g, b);
}

// FntPrint is variadic — expose a non-variadic version for Swift.
void swift_FntPrint(int id, const char *text) {
    FntPrint(id, "%s", text);
}

static int g_fnt_id = 0;

void swift_SetDumpFnt(int id) { g_fnt_id = id; }
int  swift_GetDumpFnt(void)   { return g_fnt_id; }

void swift_print_messages(void) {
    FntPrint(g_fnt_id, "Hello from Swift on PS1!\n");
    FntPrint(g_fnt_id, "PSn00bSDK + Embedded Swift\n");
}

// Flush using the same stream id we printed to (avoids -1/id mismatch).
void swift_FntFlush(void) {
    FntFlush(g_fnt_id);
}

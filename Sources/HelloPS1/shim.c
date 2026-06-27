// shim.c — thin C wrappers over PSn00bSDK APIs that can't be called directly
// from Embedded Swift (function-like macros, variadic functions).

#include <psxgpu.h>

// setRGB0 is a function-like macro — wrap it as a real function.
void swift_setRGB0(DRAWENV *p, unsigned char r, unsigned char g, unsigned char b) {
    setRGB0(p, r, g, b);
}

// FntPrint is variadic — expose a non-variadic version for Swift.
void swift_FntPrint(int id, const char *text) {
    FntPrint(id, "%s", text);
}

// FntOpen returns the font handle; SetDumpFnt (newer SDK) just stores it.
// We track it explicitly and expose a setter.
static int g_fnt_id = 0;

void swift_SetDumpFnt(int id) {
    g_fnt_id = id;
}

int swift_GetDumpFnt(void) {
    return g_fnt_id;
}

// Print the hello world messages — keeps Swift free of String/atomic ops
// which emit MIPS-II sync instructions unsupported by MIPS-I (PS1/R3000).
void swift_print_messages(void) {
    FntPrint(g_fnt_id, "Hello from Swift on PS1!\n");
    FntPrint(g_fnt_id, "PSn00bSDK + Embedded Swift\n");
}

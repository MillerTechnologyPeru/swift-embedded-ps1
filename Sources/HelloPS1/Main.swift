// HelloPS1/Main.swift
// Embedded Swift hello world for PlayStation 1
// Uses PSn00bSDK (psxgpu.h) for GPU, display environments, and BIOS font.

// shim.c provides wrappers for unavailable C APIs (macros, variadic functions).
@_silgen_name("swift_setRGB0")
func setRGB0(_ p: UnsafeMutablePointer<DRAWENV>, _ r: UInt8, _ g: UInt8, _ b: UInt8)


@_silgen_name("swift_SetDumpFnt")
func setDumpFnt(_ id: Int32)

@_silgen_name("swift_print_messages")
func printMessages()

// ---------------------------------------------------------------------------
// MARK: - Display state
// ---------------------------------------------------------------------------

var disp = (DISPENV(), DISPENV())
var draw = (DRAWENV(), DRAWENV())
var db: Int32 = 0

// ---------------------------------------------------------------------------
// MARK: - GPU / display initialisation
// ---------------------------------------------------------------------------

func initDisplay() {
    ResetGraph(0)

    SetDefDispEnv(&disp.0, 0,   0, 320, 240)
    SetDefDispEnv(&disp.1, 0, 240, 320, 240)
    SetDefDrawEnv(&draw.0, 0, 240, 320, 240)
    SetDefDrawEnv(&draw.1, 0,   0, 320, 240)

    setRGB0(&draw.0, 24, 8, 64)
    setRGB0(&draw.1, 24, 8, 64)
    draw.0.isbg = 1
    draw.1.isbg = 1

    PutDispEnv(&disp.0)
    PutDrawEnv(&draw.0)
    SetDispMask(1)

    FntLoad(960, 0)
    setDumpFnt(FntOpen(0, 8, 320, 224, 0, 512))
}

// ---------------------------------------------------------------------------
// MARK: - Frame flip
// ---------------------------------------------------------------------------

func display() {
    DrawSync(0)
    VSync(0)

    db ^= 1
    if db == 0 {
        PutDispEnv(&disp.0)
        PutDrawEnv(&draw.0)
    } else {
        PutDispEnv(&disp.1)
        PutDrawEnv(&draw.1)
    }
}

// ---------------------------------------------------------------------------
// MARK: - Entry point  (called from _start in boot.S)
// ---------------------------------------------------------------------------

@_cdecl("swift_main")
public func swiftMain() {
    initDisplay()

    while true {
        printMessages()
        FntFlush(-1)
        display()
    }
}

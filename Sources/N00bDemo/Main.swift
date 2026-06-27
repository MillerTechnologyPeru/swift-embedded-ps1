// N00bDemo/Main.swift — PSn00bSDK n00bdemo port in Embedded Swift
//
// Bouncing yellow square + debug text overlay, double-buffered via OT.
// Mirrors the PSn00bSDK C reference example (examples/hellogfx).

// ---------------------------------------------------------------------------
// C helpers (shim.c — buffer storage + macro wrappers)
// ---------------------------------------------------------------------------

@_silgen_name("ps1_set_rgb0")
func _setRGB0(_ env: UnsafeMutablePointer<DRAWENV>, _ r: UInt8, _ g: UInt8, _ b: UInt8)

@_silgen_name("ps1_ot")
func _ot(_ buf: Int32) -> UnsafeMutablePointer<UInt32>

@_silgen_name("ps1_prim_reset")
func _primReset(_ buf: Int32)

@_silgen_name("ps1_clear_ot")
func _clearOT(_ buf: Int32)

@_silgen_name("ps1_add_tile")
func _addTile(_ buf: Int32, _ z: Int32,
              _ x: Int32, _ y: Int32, _ w: Int32, _ h: Int32,
              _ r: UInt8, _ g: UInt8, _ b: UInt8)

@_silgen_name("ps1_fnt_sort")
func _fntSort(_ buf: Int32, _ z: Int32, _ x: Int32, _ y: Int32,
              _ text: UnsafePointer<CChar>)

// ---------------------------------------------------------------------------
// Display constants
// ---------------------------------------------------------------------------

let screenW: Int32  = 320
let screenH: Int32  = 240
let otLength: Int32 = 16

// ---------------------------------------------------------------------------
// Display state
// ---------------------------------------------------------------------------

var dispEnv0 = DISPENV()
var dispEnv1 = DISPENV()
var drawEnv0 = DRAWENV()
var drawEnv1 = DRAWENV()
var activeBuffer: Int32 = 0

// ---------------------------------------------------------------------------
// Primitive helpers
// ---------------------------------------------------------------------------

func addTile(z: Int32, x: Int32, y: Int32, w: Int32, h: Int32,
             r: UInt8, g: UInt8, b: UInt8) {
    _addTile(activeBuffer, z, x, y, w, h, r, g, b)
}

// StaticString literals are null-terminated UTF-8 in .rodata — no heap needed.
@inline(__always)
func drawText(_ s: StaticString, x: Int32, y: Int32, z: Int32 = 0) {
    s.withUTF8Buffer { buf in
        buf.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buf.count + 1) {
            _fntSort(activeBuffer, z, x, y, $0)
        }
    }
}

// ---------------------------------------------------------------------------
// Display init + flip
// ---------------------------------------------------------------------------

func initDisplay() {
    ResetGraph(0)
    FntLoad(960, 0)

    SetDefDispEnv(&dispEnv0, 0,       0, screenW, screenH)
    SetDefDispEnv(&dispEnv1, 0, screenH, screenW, screenH)
    SetDefDrawEnv(&drawEnv0, 0, screenH, screenW, screenH)
    SetDefDrawEnv(&drawEnv1, 0,       0, screenW, screenH)

    _setRGB0(&drawEnv0, 63, 0, 127)
    _setRGB0(&drawEnv1, 63, 0, 127)
    drawEnv0.isbg = 1
    drawEnv1.isbg = 1

    activeBuffer = 0
    _primReset(0)
    _clearOT(0)

    PutDispEnv(&dispEnv0)
    PutDrawEnv(&drawEnv0)
    SetDispMask(1)
}

func flip() {
    DrawSync(0)
    VSync(0)

    let drawBuf = activeBuffer
    let dispBuf = activeBuffer ^ 1

    if dispBuf == 0 { PutDispEnv(&dispEnv0) } else { PutDispEnv(&dispEnv1) }
    if drawBuf == 0 { PutDrawEnv(&drawEnv0) } else { PutDrawEnv(&drawEnv1) }
    DrawOTag(_ot(drawBuf).advanced(by: Int(otLength - 1)))

    activeBuffer = dispBuf
    _primReset(dispBuf)
    _clearOT(dispBuf)
}

// ---------------------------------------------------------------------------
// Game state
// ---------------------------------------------------------------------------

let squareSize: Int32 = 64
var squareX: Int32  = 0
var squareY: Int32  = 0
var squareDX: Int32 = 1
var squareDY: Int32 = 1

func update() {
    if squareX < 0 || squareX > screenW - squareSize { squareDX = -squareDX }
    if squareY < 0 || squareY > screenH - squareSize { squareDY = -squareDY }
    squareX &+= squareDX
    squareY &+= squareDY
}

func draw() {
    // Square at Z=1 (behind text)
    addTile(z: 1, x: squareX, y: squareY, w: squareSize, h: squareSize,
            r: 255, g: 255, b: 0)
    // Text at Z=0 (in front)
    drawText("Hello from Swift on PS1!", x: 8, y: 16)
    drawText("PSn00bSDK + Embedded Swift", x: 8, y: 32)
}

// ---------------------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------------------

@_cdecl("swift_main")
public func swiftMain() {
    initDisplay()
    while true {
        update()
        draw()
        flip()
    }
}

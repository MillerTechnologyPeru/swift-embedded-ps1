// N00bDemo/Main.swift — PSn00bSDK n00bdemo port in Embedded Swift

// ---------------------------------------------------------------------------
// C helpers (shim.c)
// ---------------------------------------------------------------------------

@_silgen_name("ps1_init_display")  func _initDisplay()
@_silgen_name("ps1_flip")          func _flip()
@_silgen_name("ps1_active_buffer") func _activeBuf() -> Int32

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

let screenW: Int32 = 320
let screenH: Int32 = 240

// ---------------------------------------------------------------------------
// Primitive helpers
// ---------------------------------------------------------------------------

func addTile(z: Int32, x: Int32, y: Int32, w: Int32, h: Int32,
             r: UInt8, g: UInt8, b: UInt8) {
    _addTile(_activeBuf(), z, x, y, w, h, r, g, b)
}

@inline(__always)
func drawText(_ s: StaticString, x: Int32, y: Int32, z: Int32 = 0) {
    let buf = _activeBuf()
    s.withUTF8Buffer { bytes in
        bytes.baseAddress!.withMemoryRebound(to: CChar.self, capacity: bytes.count + 1) {
            _fntSort(buf, z, x, y, $0)
        }
    }
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
    addTile(z: 1, x: squareX, y: squareY, w: squareSize, h: squareSize,
            r: 255, g: 255, b: 0)
    drawText("Hello from Swift on PS1!", x: 8, y: 16)
    drawText("PSn00bSDK + Embedded Swift", x: 8, y: 32)
}

// ---------------------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------------------

@_cdecl("swift_main")
public func swiftMain() {
    _initDisplay()
    while true {
        update()
        draw()
        _flip()
    }
}

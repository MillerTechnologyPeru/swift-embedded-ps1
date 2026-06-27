// Balls/Main.swift — PSn00bSDK balls example port in Embedded Swift
//
// 1024 bouncing textured sprites + a 32-sprite sine-wave snake.
// Faithful port of examples/graphics/balls/main.c by Lameguy64.

// ---------------------------------------------------------------------------
// C helpers (shim.c)
// ---------------------------------------------------------------------------

@_silgen_name("ps1_set_rgb0")
func _setRGB0(_ env: UnsafeMutablePointer<DRAWENV>, _ r: UInt8, _ g: UInt8, _ b: UInt8)

@_silgen_name("ps1_ot")
func _ot(_ buf: Int32) -> UnsafeMutablePointer<UInt32>

@_silgen_name("ps1_prim_reset")
func _primReset(_ buf: Int32)

@_silgen_name("ps1_clear_ot")
func _clearOT(_ buf: Int32)

@_silgen_name("ps1_ot_len")
func _otLen() -> Int32

@_silgen_name("ps1_load_tim")
func _loadTim()

@_silgen_name("ps1_clut_x")
func _clutX() -> UInt16

@_silgen_name("ps1_clut_y")
func _clutY() -> UInt16

@_silgen_name("ps1_add_sprt16")
func _addSprt16(_ buf: Int32, _ z: Int32,
                _ x: Int32, _ y: Int32, _ u: UInt8, _ v: UInt8,
                _ r: UInt8, _ g: UInt8, _ b: UInt8)

@_silgen_name("ps1_add_tpage")
func _addTPage(_ buf: Int32, _ z: Int32)

@_silgen_name("ps1_rand")
func _rand() -> Int32

@_silgen_name("ps1_srand")
func _srand(_ seed: UInt32)

// ---------------------------------------------------------------------------
// Display constants  (640x480 interlaced — matches original)
// ---------------------------------------------------------------------------

let screenW: Int32 = 640
let screenH: Int32 = 480
let centerX: Int32 = screenW / 2
let centerY: Int32 = screenH / 2

// ---------------------------------------------------------------------------
// Display state  (single buffer pair — original uses same VRAM area each frame)
// ---------------------------------------------------------------------------

var dispEnv = DISPENV()
var drawEnv = DRAWENV()
var db: Int32 = 0

func initDisplay() {
    ResetGraph(0)

    SetDefDispEnv(&dispEnv, 0, 0, screenW, screenH)
    SetDefDrawEnv(&drawEnv, 0, 0, screenW, screenH)
    dispEnv.isinter = 1   // interlace required for 640x480

    _setRGB0(&drawEnv, 63, 0, 127)
    drawEnv.isbg = 1
    drawEnv.dtd  = 1      // dither

    PutDispEnv(&dispEnv)
    PutDrawEnv(&drawEnv)
    SetDispMask(1)

    _loadTim()
}

func flip() {
    DrawSync(0)
    VSync(0)
    // PutDrawEnv with isbg=1 clears the screen before we submit the OT.
    PutDrawEnv(&drawEnv)
    DrawOTag(_ot(db).advanced(by: Int(_otLen() - 1)))
    db ^= 1
}

// ---------------------------------------------------------------------------
// Ball type
// ---------------------------------------------------------------------------

struct Ball {
    var x: Int16 = 0
    var y: Int16 = 0
    var xdir: Int16 = 0
    var ydir: Int16 = 0
    var r: UInt8 = 0
    var g: UInt8 = 0
    var b: UInt8 = 0
    var pad: UInt8 = 0
}

let maxBalls = 1024
var balls = [Ball](repeating: Ball(), count: maxBalls)

func initBalls() {
    for i in 0..<maxBalls {
        balls[i].x    = Int16(_rand() % 624)
        balls[i].y    = Int16(_rand() % 464)
        balls[i].xdir = Int16(1 &- (_rand() % 3))
        balls[i].ydir = Int16(1 &- (_rand() % 3))
        if balls[i].xdir == 0 { balls[i].xdir = 1 }
        if balls[i].ydir == 0 { balls[i].ydir = 1 }
        balls[i].xdir = balls[i].xdir &* 2
        balls[i].ydir = balls[i].ydir &* 2
        balls[i].r = UInt8(_rand() % 256)
        balls[i].g = UInt8(_rand() % 256)
        balls[i].b = UInt8(_rand() % 256)
    }
}

// ---------------------------------------------------------------------------
// Update + draw
// ---------------------------------------------------------------------------

var counter: Int32 = 0

func update() {
    for i in 0..<maxBalls {
        balls[i].x = balls[i].x &+ balls[i].xdir
        balls[i].y = balls[i].y &+ balls[i].ydir

        if Int32(balls[i].x) + 16 > 640 {
            balls[i].xdir = -2
        } else if balls[i].x < 0 {
            balls[i].xdir = 2
        }
        if Int32(balls[i].y) + 16 > 480 {
            balls[i].ydir = -2
        } else if balls[i].y < 0 {
            balls[i].ydir = 2
        }
    }
    counter &+= 1
}

func draw() {
    _clearOT(db)
    _primReset(db)

    // Snake: 32 sprites following a Lissajous curve driven by isin/icos
    _srand(64)  // fixed seed each frame → consistent random colours
    for i: Int32 in 0..<32 {
        let sx = (centerX - 8) + (isin((counter - (i << 4)) << 3) >> 5)
        let sy = (centerY - 8) - (icos((counter - (i << 2)) << 3) >> 5)
        _addSprt16(db, 0, sx, sy, 0, 0,
                   UInt8(_rand() % 256), UInt8(_rand() % 256), UInt8(_rand() % 256))
    }

    // 1024 bouncing balls
    for i in 0..<maxBalls {
        _addSprt16(db, 0,
                   Int32(balls[i].x), Int32(balls[i].y), 0, 0,
                   balls[i].r, balls[i].g, balls[i].b)
    }

    // Texture page command so GPU knows where the sprite sheet lives in VRAM
    _addTPage(db, 0)
}

// ---------------------------------------------------------------------------
// Entry point
// ---------------------------------------------------------------------------

@_cdecl("swift_main")
public func swiftMain() {
    initDisplay()
    initBalls()

    while true {
        draw()
        update()
        flip()
    }
}

@_silgen_name("balls_init")       func ballsInit()

@_silgen_name("balls_array")      func ballsArray() -> UnsafeMutablePointer<BALL>
@_silgen_name("balls_add_sprite") func ballsAddSprite(_ x: Int32, _ y: Int32, _ r: Int32, _ g: Int32, _ b: Int32)
@_silgen_name("balls_add_tpage")  func ballsAddTPage()
@_silgen_name("balls_counter")    func ballsCounter() -> Int32
@_silgen_name("balls_tick")       func ballsTick()

@_silgen_name("balls_db_active")   func ballsDbActive() -> Int32
@_silgen_name("balls_db_swap")     func ballsDbSwap()
@_silgen_name("balls_dispenv")     func ballsDispEnv(_ b: Int32) -> UnsafeMutablePointer<DISPENV>
@_silgen_name("balls_drawenv")     func ballsDrawEnv(_ b: Int32) -> UnsafeMutablePointer<DRAWENV>
@_silgen_name("balls_ot")          func ballsOT(_ b: Int32) -> UnsafeMutablePointer<UInt32>
@_silgen_name("balls_reset_prim")  func ballsResetPrim(_ b: Int32)

func ballsUpdate() {
    let b = ballsArray()
    for i in 0..<1024 {
        b[i].x &+= b[i].xdir
        b[i].y &+= b[i].ydir

        if Int32(b[i].x) + 16 > 640 { b[i].xdir = -2 }
        else if b[i].x < 0          { b[i].xdir =  2 }
        if Int32(b[i].y) + 16 > 480 { b[i].ydir = -2 }
        else if b[i].y < 0          { b[i].ydir =  2 }
    }
}

func ballsDraw() {
    let counter = ballsCounter()

    // Snake — 32 sprites on a Lissajous path
    srand(64)
    for i in 0..<32 {
        let sx = (640 / 2 - 8) &+ (isin((counter &- Int32(i << 4)) << 3) >> 5)
        let sy = (480 / 2 - 8) &- (icos((counter &- Int32(i << 2)) << 3) >> 5)
        ballsAddSprite(sx, sy, rand() % 256, rand() % 256, rand() % 256)
    }

    // 1024 bouncing balls
    let b = ballsArray()
    for i in 0..<1024 {
        ballsAddSprite(Int32(b[i].x), Int32(b[i].y),
                       Int32(b[i].r), Int32(b[i].g), Int32(b[i].b))
    }

    ballsAddTPage()
    ballsTick()
}

func ballsDisplay() {
    let active = ballsDbActive()
    DrawSync(0)
    _ = VSync(0)

    // Fill (clear) before DrawOTag so sprites render on top of the background.
    // On emulators the GPU is instant — fill-then-draw is required; on real
    // hardware the racing beam makes the original order work, but not here.
    PutDispEnv(ballsDispEnv(active))
    PutDrawEnv(ballsDrawEnv(active))
    DrawOTag(ballsOT(active) + 7)   // OTLEN - 1

    ballsDbSwap()
    let next = ballsDbActive()
    ballsResetPrim(next)
    ClearOTagR(ballsOT(next), 8)    // OTLEN
}

@_cdecl("swift_main")
public func swiftMain() {
    ballsInit()
    while true {
        ballsUpdate()
        ballsDraw()
        ballsDisplay()
    }
}

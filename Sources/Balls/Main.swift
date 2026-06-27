@_silgen_name("balls_init")    func ballsInit()
@_silgen_name("balls_display") func ballsDisplay()

@_silgen_name("balls_array")      func ballsArray() -> UnsafeMutablePointer<BALL>
@_silgen_name("balls_add_sprite") func ballsAddSprite(_ x: Int32, _ y: Int32, _ r: Int32, _ g: Int32, _ b: Int32)
@_silgen_name("balls_add_tpage")  func ballsAddTPage()
@_silgen_name("balls_counter")    func ballsCounter() -> Int32
@_silgen_name("balls_tick")       func ballsTick()

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

@_cdecl("swift_main")
public func swiftMain() {
    ballsInit()
    while true {
        ballsUpdate()
        ballsDraw()
        ballsDisplay()
    }
}

@_silgen_name("balls_init")    func ballsInit()
@_silgen_name("balls_draw")    func ballsDraw()
@_silgen_name("balls_display") func ballsDisplay()

@_silgen_name("balls_array") func ballsArray() -> UnsafeMutablePointer<BALL>

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

@_cdecl("swift_main")
public func swiftMain() {
    ballsInit()
    while true {
        ballsUpdate()
        ballsDraw()
        ballsDisplay()
    }
}

// Balls/Main.swift — Swift owns the main loop; all game logic stays in C.

@_silgen_name("balls_init")    func ballsInit()
@_silgen_name("balls_update")  func ballsUpdate()
@_silgen_name("balls_draw")    func ballsDraw()
@_silgen_name("balls_display") func ballsDisplay()

@_cdecl("swift_main")
public func swiftMain() {
    ballsInit()
    while true {
        ballsUpdate()
        ballsDraw()
        ballsDisplay()
    }
}

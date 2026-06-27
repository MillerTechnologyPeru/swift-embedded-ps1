// HelloPS1/Main.swift — Embedded Swift hello world for PlayStation 1
// Rendering via PSn00bSDK ordering table + FntSort (reference pattern).

@_silgen_name("swift_init_display")
func initDisplay()

@_silgen_name("swift_flip")
func flip()

@_silgen_name("swift_begin_frame")
func beginFrame()

@_silgen_name("swift_draw_hello")
func drawHello()

@_cdecl("swift_main")
public func swiftMain() {
    initDisplay()
    while true {
        beginFrame()
        drawHello()
        flip()
    }
}

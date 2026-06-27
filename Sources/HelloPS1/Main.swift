// HelloPS1/Main.swift — Embedded Swift hello world for PlayStation 1
// Rendering via PSn00bSDK ordering table + FntSort (reference pattern).

@_silgen_name("swift_init_display")
func initDisplay()

@_silgen_name("swift_begin_frame")
func beginFrame()

@_silgen_name("swift_draw_text")
func _drawText(_ text: UnsafePointer<CChar>)

@_silgen_name("swift_flip")
func flip()

// Wrap StaticString → UnsafePointer<CChar> with no heap allocation.
// StaticString literals are null-terminated UTF-8 in .rodata.
@inline(__always)
func drawText(_ s: StaticString) {
    s.withUTF8Buffer { buf in
        buf.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buf.count + 1) {
            _drawText($0)
        }
    }
}

func drawHello() {
    drawText("Hello from Swift on PS1!")
    drawText("PSn00bSDK + Embedded Swift")
}

@_cdecl("swift_main")
public func swiftMain() {
    initDisplay()
    while true {
        beginFrame()
        drawHello()
        flip()
    }
}

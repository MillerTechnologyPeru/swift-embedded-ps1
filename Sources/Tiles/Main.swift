// Tiles/Main.swift — Embedded Swift main loop for the tile-map example.
// Ported from PSn00bSDK examples/graphics/tilesasm/main.c.
// C handles GPU init, input, rendering primitives, and texture upload;
// Swift owns the main loop, state reading, and text rendering.

@_silgen_name("tiles_init_all")    func tilesInitAll()
@_silgen_name("tiles_handle_input") func tilesHandleInput()
@_silgen_name("tiles_sort_frame")   func tilesSortFrame()
@_silgen_name("tiles_display")      func tilesDisplay()

// Stats accessors
@_silgen_name("tiles_scroll_x")  func tilesScrollX() -> Int32
@_silgen_name("tiles_scroll_y")  func tilesScrollY() -> Int32
@_silgen_name("tiles_window_x")  func tilesWindowX() -> Int32
@_silgen_name("tiles_window_y")  func tilesWindowY() -> Int32
@_silgen_name("tiles_window_w")  func tilesWindowW() -> Int32
@_silgen_name("tiles_window_h")  func tilesWindowH() -> Int32

// FntPrint wrappers (variadic FntPrint can't be called from Swift)
@_silgen_name("tiles_print_str") func _printStr(_ s: UnsafePointer<CChar>)
@_silgen_name("tiles_print_kv")  func _printKV(_ label: UnsafePointer<CChar>, _ value: Int32, _ suffix: UnsafePointer<CChar>)
@_silgen_name("tiles_flush")     func tilesFlush()

// StaticString helpers (no heap allocation)
@inline(__always)
func printStr(_ s: StaticString) {
    s.withUTF8Buffer { buf in
        buf.baseAddress!.withMemoryRebound(to: CChar.self, capacity: buf.count + 1) {
            _printStr($0)
        }
    }
}

@inline(__always)
func printKV(_ label: StaticString, _ value: Int32, _ suffix: StaticString) {
    label.withUTF8Buffer { lb in
        suffix.withUTF8Buffer { sb in
            lb.baseAddress!.withMemoryRebound(to: CChar.self, capacity: lb.count + 1) { lp in
                sb.baseAddress!.withMemoryRebound(to: CChar.self, capacity: sb.count + 1) { sp in
                    _printKV(lp, value, sp)
                }
            }
        }
    }
}

@_cdecl("swift_main")
public func swiftMain() {
    tilesInitAll()
    while true {
        tilesHandleInput()
        tilesSortFrame()

        // Print stats in Swift
        printKV("X=", tilesScrollX(), " Y=")
        printKV("", tilesScrollY(), "\n")
        printStr("WINDOW POS. (")
        printKV("", tilesWindowX(), ",")
        printKV("", tilesWindowY(), ")\n")
        printStr("WINDOW SIZE (")
        printKV("", tilesWindowW(), ",")
        printKV("", tilesWindowH(), ")\n")
        tilesFlush()

        tilesDisplay()
    }
}
// Tiles/Main.swift — Embedded Swift main loop for the tile-map example.
// Ported from PSn00bSDK examples/graphics/tilesasm/main.c.
// Swift now owns: input handling, display flipping, and text printing.
// C handles: GPU init, texture upload, primitive sorting, and assembly tile renderer.

// Constants (from C)
var OT_LEN: Int32 { 4 }
var PKTBUFF_LEN: Int32 { 32768 }

// Pad constants
var PAD_L1: UInt16 { 0x0004 }
var PAD_L2: UInt16 { 0x0008 }
var PAD_UP: UInt16 { 0x0010 }
var PAD_DOWN: UInt16 { 0x0040 }
var PAD_LEFT: UInt16 { 0x0080 }
var PAD_RIGHT: UInt16 { 0x0020 }

// C function bindings
@_silgen_name("tiles_init_all")    func tilesInitAll()
@_silgen_name("tiles_sort_frame")   func tilesSortFrame()
@_silgen_name("tiles_display")      func tilesDisplay()

// C state accessors
@_silgen_name("tiles_disp")       func tilesDisp(_ i: Int32) -> UnsafeMutablePointer<DISPENV>
@_silgen_name("tiles_draw")       func tilesDraw(_ i: Int32) -> UnsafeMutablePointer<DRAWENV>
@_silgen_name("tiles_db")         func tilesDb() -> Int32
@_silgen_name("tiles_db_set")     func tilesDbSet(_ v: Int32)
@_silgen_name("tiles_ot")         func tilesOt(_ i: Int32) -> UnsafeMutablePointer<UInt32>
@_silgen_name("tiles_pkt")        func tilesPkt() -> UnsafeMutablePointer<Int8>
@_silgen_name("tiles_pkt_set")    func tilesPktSet(_ p: UnsafeMutablePointer<Int8>)
@_silgen_name("tiles_pkt_list")   func tilesPktList(_ i: Int32) -> UnsafeMutablePointer<Int8>
@_silgen_name("tiles_pad_buff")   func tilesPadBuff() -> UnsafeMutablePointer<UInt8>

// Stats accessors
@_silgen_name("tiles_scroll_x")  func tilesScrollX() -> Int32
@_silgen_name("tiles_scroll_y")  func tilesScrollY() -> Int32
@_silgen_name("tiles_window_x")  func tilesWindowX() -> Int32
@_silgen_name("tiles_window_y")  func tilesWindowY() -> Int32
@_silgen_name("tiles_window_w")  func tilesWindowW() -> Int32
@_silgen_name("tiles_window_h")  func tilesWindowH() -> Int32

// Scroll/window setters (for Swift input handling)
@_silgen_name("tiles_scroll_set") func tilesScrollSet(_ x: Int32, _ y: Int32)
@_silgen_name("tiles_window_set") func tilesWindowSet(_ x: Int32, _ y: Int32, _ w: Int32, _ h: Int32)

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

// Swift implementations

// Input handling (from C tiles_handle_input())
func tilesHandleInput() {
    let pad = tilesPadBuff().withMemoryRebound(to: PADTYPE.self, capacity: 2) { $0 }
    let p = pad.pointee

    if p.stat == 0 && (p.type == 0x4 || p.type == 0x5 || p.type == 0x7) {
        let btn = p.btn
        let db = tilesDb()
        let disp = tilesDisp(db).pointee
        var x = tilesWindowX()
        var y = tilesWindowY()
        var w = tilesWindowW()
        var h = tilesWindowH()

        if (btn & PAD_L1) == 0 { // Window resize
            if (btn & PAD_UP) == 0 && y > 0 {
                y -= 1
            }
            if (btn & PAD_DOWN) == 0 && (y + h) < disp.disp.h {
                y += 1
            }
            if (btn & PAD_LEFT) == 0 && x > 0 {
                x -= 1
            }
            if (btn & PAD_RIGHT) == 0 && (x + w) < disp.disp.w {
                x += 1
            }
        } else if (btn & PAD_L2) == 0 { // Window move
            if (btn & PAD_UP) == 0 && h > 0 {
                h -= 1
            }
            if (btn & PAD_DOWN) == 0 && (y + h) < disp.disp.h {
                h += 1
            }
            if (btn & PAD_LEFT) == 0 && w > 0 {
                w -= 1
            }
            if (btn & PAD_RIGHT) == 0 && (x + w) < disp.disp.w {
                w += 1
            }
        } else { // Scrolling
            var sx = tilesScrollX()
            var sy = tilesScrollY()
            if (btn & PAD_UP) == 0 {
                sy -= 2
            }
            if (btn & PAD_DOWN) == 0 {
                sy += 2
            }
            if (btn & PAD_LEFT) == 0 {
                sx -= 2
            }
            if (btn & PAD_RIGHT) == 0 {
                sx += 2
            }
            tilesScrollSet(sx, sy)
        }

        tilesWindowSet(x, y, w, h)
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
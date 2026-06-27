// Tiles/Main.swift — Embedded Swift main loop for the tile-map example.
// Ported from PSn00bSDK examples/graphics/tilesasm/main.c.
// C handles GPU init, input, rendering primitives, and texture upload;
// Swift owns the main loop and sequences the frame updates.

@_silgen_name("tiles_init_all")    func tilesInitAll()
@_silgen_name("tiles_handle_input") func tilesHandleInput()
@_silgen_name("tiles_sort_frame")   func tilesSortFrame()
@_silgen_name("tiles_print_stats")  func tilesPrintStats()
@_silgen_name("tiles_display")      func tilesDisplay()

@_cdecl("swift_main")
public func swiftMain() {
    tilesInitAll()
    while true {
        tilesHandleInput()
        tilesSortFrame()
        tilesPrintStats()
        tilesDisplay()
    }
}
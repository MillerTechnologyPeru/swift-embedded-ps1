// Tiles/Main.swift — Embedded Swift entry point for the tile-map example.
// Ported from PSn00bSDK examples/graphics/tilesasm/main.c.
// The full C logic runs verbatim in shim.c (tiles_main); Swift just drives it.

@_silgen_name("tiles_main") func tilesMain()

@_cdecl("swift_main")
public func swiftMain() {
    _ = tilesMain()
}

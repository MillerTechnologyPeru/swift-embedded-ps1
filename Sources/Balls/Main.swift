// Balls/Main.swift — thin Swift entry point; all game logic is in shim.c

@_silgen_name("balls_main") func ballsMain() -> Int32

@_cdecl("swift_main")
public func swiftMain() {
    _ = ballsMain()
}

// RGB24/Main.swift — PSn00bSDK 24-bit RGB display example
// The C demo (rgb24_main in shim.c) sets up the display and uploads the
// image; Swift just calls it once.

@_silgen_name("rgb24_main") func rgb24Main()

@_cdecl("swift_main")
public func swiftMain() {
    rgb24Main()
}

// RGB24/Main.swift — PSn00bSDK 24-bit RGB display example
// Ported from examples/graphics/rgb24/main.c (originally rgb24_main).

@_silgen_name("tim_image_ptr") func timImagePtr() -> UnsafeMutablePointer<UInt32>

@_cdecl("swift_main")
public func swiftMain() {
    // Reset GPU
    ResetGraph(0)

    // Setup 640x480 24-bit video mode
    var disp = DISPENV()
    SetDefDispEnv(&disp, 0, 0, 640, 480)
    disp.isrgb24 = 1
    disp.isinter = 1

    // Apply and enable display
    PutDispEnv(&disp)
    SetDispMask(1)

    // Upload image to VRAM
    var tim = TIM_IMAGE()
    withUnsafeMutablePointer(to: &tim) { tp in
        GetTimInfo(timImagePtr(), tp)
        LoadImage(tp.pointee.prect, tp.pointee.paddr)
    }
    DrawSync(0)

    while true {}
}

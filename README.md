# swift-ps1-hello

Embedded Swift hello world for the PlayStation 1, using **PSn00bSDK** as the C hardware layer — the same pattern as [swift-embedded-nds](https://github.com/MillerTechnologyPeru/swift-embedded-nds) with libnds.

```
Hello from Swift on PS1!
PSn00bSDK + Embedded Swift
```

Rendered via the BIOS debug font (`FntLoad` / `FntPrint` / `FntFlush`) on a double-buffered 320×240 NTSC display.

---

## Project layout

```
swift-ps1-hello/
├── Package.swift                    # SwiftPM manifest
├── Makefile                         # Drives swift build → psexe
├── Sources/
│   ├── PSn00bSDK/                   # System library wrapper (like libnds in NDS project)
│   │   └── include/
│   │       └── module.modulemap     # Exposes psxgpu.h, psxpad.h, … as PSn00bSDK module
│   └── HelloPS1/
│       └── Main.swift               # import PSn00bSDK.GPU; call FntPrint etc.
└── Support/
    ├── boot.S                       # MIPS _start, BSS zero-init, calls swift_main
    ├── psexe.ld                     # Linker script (loads at 0x80010000)
    └── elf2psexe.py                 # Wraps ELF binary with 2KB PS-X EXE header
```

The `Sources/PSn00bSDK/` directory is a SwiftPM **system library target** with a `module.modulemap` — no Swift or C sources of its own. SwiftPM uses it to teach the Clang importer about PSn00bSDK's headers, so `Main.swift` can write:

```swift
import PSn00bSDK.GPU

FntLoad(960, 0)
SetDumpFnt(FntOpen(0, 8, 320, 224, 0, 512))
FntPrint(-1, "Hello from Swift!\n")
FntFlush(-1)
```

---

## Prerequisites

| Tool | Purpose |
|------|---------|
| `swiftc` (patched) | Embedded Swift with `mipsel-none-none-elf` stdlib |
| `clang` / `ld.lld` / `llvm-objcopy` | Assemble boot stub + link |
| PSn00bSDK | Prebuilt headers + `.a` libs (`psxgpu`, `psxapi`, …) |
| Python 3 | `elf2psexe.py` to add the PS-X EXE header |
| Emulator | DuckStation / PCSX-Redux / no$psx |

### Install PSn00bSDK

```bash
# Option A: prebuilt package from GitHub releases
# https://github.com/Lameguy64/PSn00bSDK/releases
# Extract and export:
export PSN00BSDK_LIBS=/opt/psn00bsdk/lib/libpsn00b

# Option B: build from source
git clone https://github.com/Lameguy64/PSn00bSDK
cd PSn00bSDK && cmake -B build -DPSN00BSDK_TC="" && cmake --build build --target install
```

---

## Build

```bash
export PSN00BSDK_LIBS=/opt/psn00bsdk/lib/libpsn00b

# Verify SDK paths are correct
make check-sdk

# Build hello.psexe
make
```

The build runs four steps:

```
swift build          →  .build/release/HelloPS1.o   (Embedded Swift → mipsel object)
clang (boot.S)       →  build/boot.o                (MIPS _start stub)
ld.lld               →  build/hello.elf             (linked with PSn00bSDK .a libs)
llvm-objcopy + python →  hello.psexe                (PS-X EXE with 2KB header)
```

---

## Run

Load `hello.psexe` in any PS1 emulator:

- **DuckStation** — File → Load EXE  
- **PCSX-Redux** — File → Load Archive  
- **no$psx** — drag and drop  
- `make run` — launches PCSX-Redux if it's in PATH

---

## Extending

Because PSn00bSDK is a proper Swift-importable module, adding features is clean:

```swift
// Controller input
import PSn00bSDK.Pad

var padBuf = (PadBuf(), PadBuf())
PadInitDig(0, &padBuf.0, 34)
PadInitDig(1, &padBuf.1, 34)
PadStartCom()

// In game loop:
let pressed = padBuf.0.btn
if pressed & PADLup != 0 { /* D-pad up */ }
```

```swift
// CD-ROM
import PSn00bSDK.CDROM
CdInit()

// SPU / audio
import PSn00bSDK.SPU
SpuInit()
```

---

## How the module map works

SwiftPM's system library target mechanism (`Target.systemLibrary`) is used for installed C libraries that SwiftPM doesn't build itself. The `module.modulemap` at `Sources/PSn00bSDK/include/module.modulemap` defines a Clang module over PSn00bSDK's headers, and `Package.swift` passes `-I$(PSN00BSDK_INC)` to the Clang importer so the headers can be found at their install path.

The PSn00bSDK `.a` static libraries are linked at the `ld.lld` step in the Makefile — SwiftPM doesn't drive the final bare-metal link (same pattern as swift-embedded-nds where devkitPro's Makefile does the final `.nds` link).

## See also

- [swift-embedded-nds](https://github.com/MillerTechnologyPeru/swift-embedded-nds) — the NDS sibling project this was modeled on  
- [PSn00bSDK](https://github.com/Lameguy64/PSn00bSDK) — PS1 C SDK  
- [psx-spx](https://psx-spx.consoledev.net/) — PS1 hardware reference  
- [DuckStation](https://github.com/stenzek/duckstation) — recommended emulator for development

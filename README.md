# swift-embedded-ps1

Embedded Swift running on the PlayStation 1, using **PSn00bSDK** as the C hardware layer.

Three working examples, all targeting `mipsel-none-none-elf` (MIPS-I R3000A):

| Example | Output | Description |
|---------|--------|-------------|
| `hello` | `hello.psexe` | Debug font "Hello from Swift on PS1!" on a 320×240 display |
| `balls` | `balls.psexe` | 1024 bouncing textured sprites + sine-wave snake — port of PSn00bSDK `examples/graphics/balls` |
| `rgb24` | `rgb24.psexe` | 24-bit RGB image display — port of PSn00bSDK `examples/graphics/rgb24` |

---

## Screenshots

**hello** — 320×240, double-buffered, `FntSort` + ordering table  
**balls** — 640×480 interlaced, 1024 `SPRT_16` sprites + GTE sin/cos snake  
**rgb24** — 640×480 interlaced 24-bit RGB texture uploaded to VRAM

---

## Project layout

```
swift-embedded-ps1/
├── Makefile                         # Builds all examples; make / make hello / make balls
├── Sources/
│   ├── PSn00bSDK/include/           # Bridging header + module.modulemap
│   ├── HelloPS1/
│   │   ├── Main.swift               # Text rendering in Swift
│   │   └── shim.c                   # POSIX stubs + FntSort render context
│   ├── Balls/
│   │   ├── Main.swift               # 1024 balls + snake in Swift
│   │   ├── shim.c                   # POSIX stubs + SPRT_16/DR_TPAGE macro wrappers
│   │   ├── BridgingHeader.h         # Imports the PSn00bSDK sub-headers
│   │   ├── BallTypes.h              # BALL struct definition
│   │   ├── ball16c.S                # .incbin embeds ball16c.tim into .rodata
│   │   └── ball16c.tim              # 4-bit CLUT texture (16×16 px, 192 bytes)
│   └── RGB24/
│       ├── Main.swift               # 24-bit RGB display in Swift
│       ├── shim.c                   # POSIX stubs + TIM data pointer
│       ├── tim.S                    # .incbin embeds bunpattern.tim into .rodata
│       └── bunpattern.tim           # 24-bit RGB texture (256×256 px)
└── Support/
    ├── boot.S                       # MIPS _start: init $gp, zero BSS, jalr swift_main
    ├── psexe.ld                     # Linker script (load at 0x80010000)
    └── elf2psexe.py                 # Adds the 2 KB PS-X EXE header
```

---

## Build

```bash
# First-time: extract PSn00bSDK headers + libs from Docker
make setup-sdk

# Build all examples
make

# Or build individually
make hello
make balls
make rgb24
```

Each example builds independently into `build/<name>/` and produces its own `.psexe`.

Build steps per example:

```
swiftc (WMO)     →  build/<name>/main.swift.o   (Embedded Swift → mipsel-none-none-elf)
clang            →  build/<name>/boot.o          (MIPS _start stub)
clang            →  build/<name>/shim.o          (C macro wrappers + POSIX stubs)
ld.lld           →  build/<name>/out.elf         (linked with PSn00bSDK .a libs)
llvm-objcopy     →  build/<name>/out.bin         (raw binary)
elf2psexe.py     →  <name>.psexe                 (PS-X EXE with 2 KB header)
```

---

## Prerequisites

| Tool | Purpose |
|------|---------|
| `swiftc` (patched) | Embedded Swift targeting `mipsel-none-none-elf` |
| `clang` / `ld.lld` / `llvm-objcopy` | Compile boot stub + link |
| `libswiftEmbeddedPlatformPOSIX.a` | Swift runtime for POSIX-like embedded targets |
| Docker (first run) | Extracts PSn00bSDK headers + `.a` libs via `make setup-sdk` |
| Python 3 | `elf2psexe.py` PS-X EXE header wrapper |
| Emulator | DuckStation / PCSX-Redux / no$psx |

The toolchain paths are configured at the top of the `Makefile` (`TOOLCHAIN`, `SWIFTC`, `CLANG`, `LLD`).

---

## Run

Load any `.psexe` in a PS1 emulator:

- **DuckStation** — File → Load EXE
- **PCSX-Redux** — File → Load Archive
- **no$psx** — drag and drop

---

## Architecture

### Why a shim.c per example?

PSn00bSDK's GPU drawing API is almost entirely **C macros** (`setTile`, `setSprt16`, `setXY0`, `setRGB0`, `addPrim`, `getTPage`, `setDrawTPage`, …). Macros can't be imported into Swift, so each example's `shim.c` provides thin C wrappers that Swift calls via `@_silgen_name`.

Everything else — game state, rendering logic, the main loop — lives in Swift.

### boot.S — two critical requirements

1. **`$gp` must be initialized before any C/Swift call.** PSn00bSDK and `libswiftEmbeddedPlatformPOSIX` are compiled with O32 abicalls (GOT-relative data access). `_gp` is the linker-computed GOT anchor; without it every global variable access faults.

2. **`swift_main` must be called via `la $t9 / jalr $t9`.** O32 abicalls prologues compute `$gp` from `$t9 + _gp_disp`. Using plain `jal` leaves `$t9` stale and breaks any abicalls function called transitively from Swift.

### Linker script — small data layout

PSn00bSDK accesses many of its internal statics via `R_MIPS_GPREL16` (GP-relative), which has a ±32 KB range from `_gp`. The linker script places `.got → .sdata → .sbss` together so all GP-relative references stay in range, and puts the large primitive buffers (up to 128 KB) in `.bss` afterward where GP-relative addressing isn't used.

### Embedded Swift flags

```
-target mipsel-none-none-elf
-enable-experimental-feature Embedded
-wmo  -Osize
-Xcc -march=mips1 -Xcc -mabi=o32 -Xcc -mno-abicalls -Xcc -fno-pic
-Xcc -msoft-float  -Xcc -G0
-Xllvm -mattr=+noabicalls  -Xllvm -relocation-model=static
```

`-mno-abicalls` / `-relocation-model=static` prevent the Swift LLVM backend from emitting GOT-indirect calls. PSn00bSDK libs are abicalls but our Swift code is static — they coexist because `boot.S` sets `$gp` before any call.

### LLVM/lld patches

The build requires a patched Swift/LLVM toolchain. Patches applied:

| File | Change |
|------|--------|
| `clang/lib/Basic/CodeGenOptions.cpp` | Don't reset relocation model to PIC during PCH emission |
| `llvm/lib/Target/Mips/MipsSubtarget.cpp` | Don't fatal-error on PIC+no-abicalls during PCH (no real code emitted) |
| `llvm/lib/Target/Mips/MipsISelDAGToDAG.cpp` | Drop `MipsISD::Sync` on MIPS-I (R3000A has no SYNC instruction) |
| `llvm/lib/MC/MCSymbolELF.cpp` | Return `STB_LOCAL` for temporary symbols even when used in a reloc (MIPS O32 JALR-hint `$tmp` labels) |
| `lld/ELF/InputFiles.cpp` | Warn instead of error for LOCAL symbol after GLOBAL (old mipsel-gcc PSn00bSDK artefact) |
| `lld/ELF/Arch/MipsArchTree.cpp` | Warn instead of error for n64/o32 ABI mismatch and soft/double-float mismatch (old PSn00bSDK artefact) |

---

## See also

- [swift-embedded-nds](https://github.com/MillerTechnologyPeru/swift-embedded-nds) — NDS sibling project this was modeled on
- [PSn00bSDK](https://github.com/Lameguy64/PSn00bSDK) — PS1 homebrew C SDK
- [psx-spx](https://psx-spx.consoledev.net/) — PS1 hardware reference
- [DuckStation](https://github.com/stenzek/duckstation) — recommended emulator

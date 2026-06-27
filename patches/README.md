# Toolchain patches

Embedded Swift for the PS1 (`mipsel-none-none-elf`, MIPS-I R3000A) requires a
patched Swift + LLVM toolchain. These two patches reproduce the toolchain used
to build the examples.

| Patch | Repo | Base branch | Base commit |
|-------|------|-------------|-------------|
| `swift.patch` | [swiftlang/swift](https://github.com/swiftlang/swift) | `main` | `794007a78d72b45c148c57765ee36424d57a131e` |
| `llvm-project.patch` | [swiftlang/llvm-project](https://github.com/swiftlang/llvm-project) | `stable/21.x` | `52bae8ee9de8a26e4d91cf9e44a2ecff1a9c4574` |

`swift` base = `swift-DEVELOPMENT-SNAPSHOT-2026-06-24-a` era `main`;
`llvm-project` base = matching `stable/21.x`.

Each patch contains both the committed feature work and the local working-tree
changes (generated with `git diff <base>`), so applying them on top of the base
commit yields the exact tree that was built.

## What the patches do

**LLVM / Clang / LLD** (`llvm-project.patch`)

- `clang/lib/Basic/CodeGenOptions.cpp` — don't reset relocation model to PIC during PCH emission
- `clang/lib/CodeGen/Targets/Mips.cpp`, `Targets/PPC.cpp` — Swift ABI support for MIPS / 32-bit PowerPC
- `llvm/lib/Target/Mips/MipsSubtarget.cpp` — don't fatal-error on PIC + no-abicalls during PCH
- `llvm/lib/Target/Mips/MipsISelDAGToDAG.cpp` — drop `MipsISD::Sync` on MIPS-I (R3000A has no SYNC)
- `llvm/lib/Target/Mips/MipsISelLowering.cpp` — MIPS lowering adjustments
- `llvm/lib/MC/MCSymbolELF.cpp` — return `STB_LOCAL` for temporary symbols used in relocs (O32 JALR-hint `$tmp` labels)
- `llvm/lib/MC/ELFObjectWriter.cpp` — related ELF emission fix
- `lld/ELF/InputFiles.cpp` — warn (not error) for LOCAL symbol after GLOBAL (old mipsel-gcc PSn00bSDK artefact)
- `lld/ELF/Arch/MipsArchTree.cpp` — warn (not error) for n64/o32 ABI and soft/double-float mismatch
- `llvm/lib/Target/PowerPC/PPCISelLowering.cpp` — PPC support (sibling target)

**Swift** (`swift.patch`)

- `lib/Basic/LangOptions.cpp` — MIPS target triple support
- `stdlib/public/CMakeLists.txt`, `stdlib/public/stubs/MathStubs.cpp` — embedded stdlib for MIPS
- `cmake/modules/*` — build-system plumbing for the new targets

## Applying

```bash
# LLVM
git clone https://github.com/swiftlang/llvm-project.git
cd llvm-project
git checkout 52bae8ee9de8a26e4d91cf9e44a2ecff1a9c4574
git apply /path/to/patches/llvm-project.patch

# Swift
git clone https://github.com/swiftlang/swift.git
cd swift
git checkout 794007a78d72b45c148c57765ee36424d57a131e
git apply /path/to/patches/swift.patch
```

Then build the toolchain as usual (`utils/build-script`). Regenerate these
patches with:

```bash
git -C <llvm-project> diff stable/21.x      > patches/llvm-project.patch
git -C <swift>        diff main             > patches/swift.patch
```

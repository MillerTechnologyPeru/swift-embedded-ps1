# Makefile — swift-ps1-hello
#
# Build flow (mirrors swift-embedded-nds/common/common.mk):
#   swiftc       →  build/main.swift.o   (Embedded Swift, mipsel-none-none-elf)
#   clang        →  build/boot.o         (MIPS assembly entry point)
#   ld.lld       →  build/hello.elf      (linked with PSn00bSDK .a files)
#   llvm-objcopy →  build/hello.bin      (raw binary)
#   python3      →  hello.psexe          (PS-X EXE with 2KB header)
#
# First-time setup:
#   make setup-sdk          pulls PSn00bSDK headers + libs from Docker
#
# Then build:
#   make                    builds hello.psexe
#
# Override the Swift toolchain:
#   make SWIFTC=/path/to/swiftc

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

TOOLCHAIN    := /Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert
SWIFTC       ?= $(TOOLCHAIN)/swift-macosx-arm64/bin/swiftc
CLANG        ?= $(TOOLCHAIN)/llvm-macosx-arm64/bin/clang
LLD          ?= $(TOOLCHAIN)/llvm-macosx-arm64/bin/ld.lld
OBJCOPY      ?= $(TOOLCHAIN)/llvm-macosx-arm64/bin/llvm-objcopy
PYTHON       ?= python3

# PSn00bSDK extracted from Docker (populated by `make setup-sdk`)
SDK          := psn00bsdk
PSN00BSDK_LIBS := $(SDK)
PSN00BSDK_INC  := $(SDK)/include

# Docker image used for SDK extraction
SDK_IMAGE    := nahimr/psn00bsdk_docker_mipsel

# Pre-compiled Embedded Swift runtime libs for mipsel-none-none-elf
SWIFT_EMBEDDED_LIBS := $(TOOLCHAIN)/swift-macosx-arm64/lib/swift/embedded/mipsel-none-none-elf

# ---------------------------------------------------------------------------
# Build directories
# ---------------------------------------------------------------------------

BUILD        = build

# ---------------------------------------------------------------------------
# Swift flags  (mirrors common.mk SWIFTFLAGS)
# ---------------------------------------------------------------------------

SWIFT_TARGET = mipsel-none-none-elf

SWIFTFLAGS   = \
    -target $(SWIFT_TARGET) \
    -enable-experimental-feature Embedded \
    -wmo \
    -Osize \
    -Xcc -march=mips1 \
    -Xcc -mabi=o32 \
    -Xcc -mno-abicalls \
    -Xcc -fno-pic \
    -Xcc -fno-PIC \
    -Xcc -msoft-float \
    -Xcc -fno-stack-protector \
    -Xcc -I$(PSN00BSDK_INC) \
    -Xcc -w \
    -Xllvm -mattr=+noabicalls \
    -Xllvm -relocation-model=static \
    -module-name HelloPS1 \
    -import-objc-header Sources/PSn00bSDK/include/PSn00bSDK.h

# ---------------------------------------------------------------------------
# Clang flags (boot stub)
# ---------------------------------------------------------------------------

CLANG_TARGET = mipsel-none-elf
CLANG_FLAGS  = \
    --target=$(CLANG_TARGET) \
    -march=mips1 \
    -mabi=o32 \
    -mno-abicalls \
    -fno-pic \
    -msoft-float \
    -I$(PSN00BSDK_INC) \
    -c

# ---------------------------------------------------------------------------
# Linker flags (ld.lld)
# ---------------------------------------------------------------------------

SWIFT_RUNTIME_LIBS = \
    $(SWIFT_EMBEDDED_LIBS)/libswiftEmbeddedPlatformPOSIX.a \
    $(SWIFT_EMBEDDED_LIBS)/libswiftExclusivitySingleThreaded.a

PSN00B_LIBS  = \
    $(PSN00BSDK_LIBS)/libpsxgpu.a \
    $(PSN00BSDK_LIBS)/libpsxapi.a \
    $(PSN00BSDK_LIBS)/libpsxetc.a \
    $(PSN00BSDK_LIBS)/libpsxgte.a \
    $(PSN00BSDK_LIBS)/libpsxsio.a \
    $(PSN00BSDK_LIBS)/libpsxspu.a \
    $(PSN00BSDK_LIBS)/libc.a

LLD_FLAGS    = \
    -m elf32ltsmip \
    -T Support/psexe.ld \
    --no-eh-frame-hdr \
    --allow-multiple-definition \
    -nostdlib

# ---------------------------------------------------------------------------
# Source / output files
# ---------------------------------------------------------------------------

SWIFT_SRCS   = $(wildcard Sources/HelloPS1/*.swift)
SWIFT_OBJ    = $(BUILD)/main.swift.o

SHIM_SRC     = Sources/HelloPS1/shim.c
SHIM_OBJ     = $(BUILD)/shim.o

BOOT_SRC     = Support/boot.S
BOOT_OBJ     = $(BUILD)/boot.o

ELF          = $(BUILD)/hello.elf
BIN          = $(BUILD)/hello.bin
PSEXE        = hello.psexe
LOAD_ADDR    = 0x80010000

# ---------------------------------------------------------------------------
# Rules
# ---------------------------------------------------------------------------

.PHONY: all clean run setup-sdk check-sdk

all: $(PSEXE)

$(BUILD):
	mkdir -p $(BUILD)

# 1. Compile Swift directly (mirrors common.mk — no `swift build`)
$(SWIFT_OBJ): $(SWIFT_SRCS) Sources/PSn00bSDK/include/module.modulemap | $(BUILD)
	$(SWIFTC) $(SWIFTFLAGS) -c $(SWIFT_SRCS) -o $@

# 2. Compile C shim
$(SHIM_OBJ): $(SHIM_SRC) | $(BUILD)
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# 3. Assemble the MIPS boot stub
$(BOOT_OBJ): $(BOOT_SRC) | $(BUILD)
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# 4. Link
$(ELF): $(BOOT_OBJ) $(SHIM_OBJ) $(SWIFT_OBJ) Support/psexe.ld | $(BUILD)
	$(LLD) $(LLD_FLAGS) \
	    -o $@ \
	    $(BOOT_OBJ) \
	    $(SHIM_OBJ) \
	    $(SWIFT_OBJ) \
	    $(SWIFT_RUNTIME_LIBS) \
	    $(PSN00B_LIBS)

# 5. Strip to raw binary
$(BIN): $(ELF)
	$(OBJCOPY) -O binary $< $@

# 6. Wrap with PS-X EXE header
$(PSEXE): $(BIN) Support/elf2psexe.py
	$(PYTHON) Support/elf2psexe.py $< $@ $(LOAD_ADDR)
	@echo ""
	@echo "  Load hello.psexe in DuckStation, PCSX-Redux, or no\$$psx"

# ---------------------------------------------------------------------------
# SDK setup — extract headers + libs from Docker
# ---------------------------------------------------------------------------

setup-sdk:
	@echo "Pulling $(SDK_IMAGE)..."
	docker pull $(SDK_IMAGE)
	@echo "Extracting PSn00bSDK headers and libs to $(SDK)/..."
	mkdir -p $(SDK)/include
	docker run --rm \
	    -v $(CURDIR)/$(SDK):/out \
	    $(SDK_IMAGE) \
	    sh -c "cp -r /usr/local/PSN00BSDK_LIBS/include/. /out/include/ && \
	           cp /usr/local/PSN00BSDK_LIBS/*.a /out/"
	@echo "SDK ready at $(SDK)/"

# ---------------------------------------------------------------------------

check-sdk:
	@test -f "$(PSN00BSDK_INC)/psxgpu.h" || \
	    { echo "ERROR: psxgpu.h not found — run: make setup-sdk"; exit 1; }
	@echo "SDK OK: $(PSN00BSDK_INC)"

clean:
	rm -rf $(BUILD) $(PSEXE) .build

PCSX_REDUX ?= pcsx-redux
run: $(PSEXE)
	$(PCSX_REDUX) -exe $(PSEXE)

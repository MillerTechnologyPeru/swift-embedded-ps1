# Makefile — swift-ps1 examples
#
# Examples:
#   make hello      →  hello.psexe      (HelloPS1 — simple text demo)
#   make balls      →  balls.psexe      (Balls — bouncing ball demo)
#   make rgb24      →  rgb24.psexe      (RGB24 — 24-bit color display)
#   make tiles      →  tiles.psexe      (Tiles — asm tile-map renderer)
#   make            →  builds all

.DEFAULT_GOAL := all

# ---------------------------------------------------------------------------
# Toolchain
# ---------------------------------------------------------------------------

TOOLCHAIN    := /Volumes/Crucial-2TB/Developer/build/Ninja-ReleaseAssert
SWIFTC       ?= $(TOOLCHAIN)/swift-macosx-arm64/bin/swiftc
CLANG        ?= $(TOOLCHAIN)/llvm-macosx-arm64/bin/clang
LLD          ?= $(TOOLCHAIN)/llvm-macosx-arm64/bin/ld.lld
OBJCOPY      ?= $(TOOLCHAIN)/llvm-macosx-arm64/bin/llvm-objcopy
PYTHON       ?= python3

# ---------------------------------------------------------------------------
# SDK paths
# ---------------------------------------------------------------------------

SDK              := psn00bsdk
PSN00BSDK_LIBS   := $(SDK)
PSN00BSDK_INC    := $(SDK)/include
SDK_IMAGE        := nahimr/psn00bsdk_docker_mipsel
SWIFT_EMBEDDED_LIBS := $(TOOLCHAIN)/swift-macosx-arm64/lib/swift/embedded/mipsel-none-none-elf

# ---------------------------------------------------------------------------
# Common flags
# ---------------------------------------------------------------------------

SWIFT_TARGET = mipsel-none-none-elf

DEFAULT_BRIDGING_HDR = Sources/PSn00bSDK/include/PSn00bSDK.h

SWIFTFLAGS_COMMON = \
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
    -Xllvm -relocation-model=static

CLANG_TARGET = mipsel-none-elf
CLANG_FLAGS  = \
    --target=$(CLANG_TARGET) \
    -march=mips1 \
    -mabi=o32 \
    -mno-abicalls \
    -fno-pic \
    -msoft-float \
    -G0 \
    -I$(PSN00BSDK_INC) \
    -c

SWIFT_RUNTIME_LIBS = \
    $(SWIFT_EMBEDDED_LIBS)/libswiftEmbeddedPlatformPOSIX.a \
    $(SWIFT_EMBEDDED_LIBS)/libswiftExclusivitySingleThreaded.a

PSN00B_LIBS = \
    $(PSN00BSDK_LIBS)/libpsxgpu.a \
    $(PSN00BSDK_LIBS)/libpsxapi.a \
    $(PSN00BSDK_LIBS)/libpsxetc.a \
    $(PSN00BSDK_LIBS)/libpsxgte.a \
    $(PSN00BSDK_LIBS)/libpsxsio.a \
    $(PSN00BSDK_LIBS)/libpsxspu.a \
    $(PSN00BSDK_LIBS)/libc.a

LLD_FLAGS = \
    -m elf32ltsmip \
    -T Support/psexe.ld \
    --no-eh-frame-hdr \
    --allow-multiple-definition \
    -nostdlib

LOAD_ADDR = 0x80010000

# ---------------------------------------------------------------------------
# Template: build one example
#
# Usage: $(eval $(call EXAMPLE_RULES,tag,SourceDir,ModuleName,out.psexe))
# ---------------------------------------------------------------------------

# $(1)=tag  $(2)=SourceDir  $(3)=ModuleName  $(4)=out.psexe  $(5)=extra .o files  $(6)=bridging header (optional)
define EXAMPLE_RULES

build/$(1):
	mkdir -p $$@

build/$(1)/boot.o: Support/boot.S | build/$(1)
	$(CLANG) $(CLANG_FLAGS) -o $$@ $$<

build/$(1)/shim.o: Sources/$(2)/shim.c | build/$(1)
	$(CLANG) $(CLANG_FLAGS) -o $$@ $$<

build/$(1)/main.swift.o: $$(wildcard Sources/$(2)/*.swift) \
                          Sources/PSn00bSDK/include/module.modulemap | build/$(1)
	$(SWIFTC) $(SWIFTFLAGS_COMMON) \
	    -import-objc-header $(if $(6),$(6),$(DEFAULT_BRIDGING_HDR)) \
	    -module-name $(3) \
	    -c $$(wildcard Sources/$(2)/*.swift) -o $$@

build/$(1)/out.elf: build/$(1)/boot.o build/$(1)/shim.o \
                    build/$(1)/main.swift.o $(5) Support/psexe.ld
	$(LLD) $(LLD_FLAGS) -o $$@ \
	    build/$(1)/boot.o \
	    build/$(1)/shim.o \
	    build/$(1)/main.swift.o \
	    $(5) \
	    $(SWIFT_RUNTIME_LIBS) \
	    $(PSN00B_LIBS)

build/$(1)/out.bin: build/$(1)/out.elf
	$(OBJCOPY) -O binary $$< $$@

$(4): build/$(1)/out.bin Support/elf2psexe.py
	$(PYTHON) Support/elf2psexe.py $$< $$@ $(LOAD_ADDR)
	@echo "  ✓  $(4)"

endef

# ---------------------------------------------------------------------------
# Examples
# ---------------------------------------------------------------------------

$(eval $(call EXAMPLE_RULES,hello,HelloPS1,HelloPS1,hello.psexe,))
$(eval $(call EXAMPLE_RULES,balls,Balls,Balls,balls.psexe,build/balls/ball16c.o,Sources/Balls/BridgingHeader.h))
$(eval $(call EXAMPLE_RULES,rgb24,RGB24,RGB24,rgb24.psexe,build/rgb24/tim.o,))
$(eval $(call EXAMPLE_RULES,tiles,Tiles,Tiles,tiles.psexe,build/tiles/drawtiles.o build/tiles/tim.o,))

# ball16c.tim embedded as a .o via .incbin in ball16c.S
build/balls/ball16c.o: Sources/Balls/ball16c.S Sources/Balls/ball16c.tim | build/balls
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# bunpattern.tim embedded as a .o via .incbin in tim.S
build/rgb24/tim.o: Sources/RGB24/tim.S Sources/RGB24/bunpattern.tim | build/rgb24
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# tiles_256.tim embedded as a .o via .incbin in tim.S
build/tiles/tim.o: Sources/Tiles/tim.S Sources/Tiles/tiles_256.tim | build/tiles
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# DrawTiles assembler routine (verbatim from PSn00bSDK tilesasm/drawtiles.s)
build/tiles/drawtiles.o: Sources/Tiles/drawtiles.s | build/tiles
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# bunpattern.tim embedded as a .o via .incbin in tim.S
build/rgb24/tim.o: Sources/RGB24/tim.S Sources/RGB24/bunpattern.tim | build/rgb24
	$(CLANG) $(CLANG_FLAGS) -o $@ $<

# ---------------------------------------------------------------------------
# Top-level targets
# ---------------------------------------------------------------------------

.PHONY: all hello balls rgb24 tiles clean setup-sdk check-sdk

all: hello.psexe balls.psexe rgb24.psexe tiles.psexe

hello: hello.psexe
balls: balls.psexe
rgb24: rgb24.psexe
tiles: tiles.psexe

# ---------------------------------------------------------------------------
# SDK setup
# ---------------------------------------------------------------------------

setup-sdk:
	@echo "Pulling $(SDK_IMAGE)..."
	docker pull $(SDK_IMAGE)
	mkdir -p $(SDK)/include
	docker run --rm \
	    -v $(CURDIR)/$(SDK):/out \
	    $(SDK_IMAGE) \
	    sh -c "cp -r /usr/local/PSN00BSDK_LIBS/include/. /out/include/ && \
	           cp /usr/local/PSN00BSDK_LIBS/*.a /out/"
	@echo "SDK ready at $(SDK)/"

check-sdk:
	@test -f "$(PSN00BSDK_INC)/psxgpu.h" || \
	    { echo "ERROR: psxgpu.h not found — run: make setup-sdk"; exit 1; }
	@echo "SDK OK: $(PSN00BSDK_INC)"

clean:
	rm -rf build hello.psexe balls.psexe rgb24.psexe tiles.psexe

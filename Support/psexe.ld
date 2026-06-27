/*
 * psexe.ld — Linker script for PS-X EXE
 *
 * PS1 user RAM starts at 0x80010000 (first 64KB reserved by BIOS kernel).
 * The PS-X EXE header tells the BIOS loader where to DMA the payload and
 * where to jump; elf2psexe.py fills that header from this script's symbols.
 */

/* elf32-littlemips is a BFD name not recognised by lld; omit OUTPUT_FORMAT
   and rely on -m elf32ltsmip passed on the lld command line instead. */
OUTPUT_ARCH(mips)
ENTRY(_start)

MEMORY {
    RAM (rwx) : ORIGIN = 0x80010000, LENGTH = 0x1F0000   /* ~1.9 MB usable */
}

SECTIONS {
    . = 0x80010000;

    .text : {
        KEEP(*(.text.boot))     /* _start must be first byte of the image */
        *(.text*)
        *(.rodata*)
    } > RAM

    .data : {
        *(.data*)
    } > RAM

    /* Group GOT + small-data sections so _gp (= GOT_start + 0x7FF0) covers
       .sdata and .sbss.  PSn00bSDK font.o keeps _nstreams in .sbss and
       accesses it via R_MIPS_GPREL16; it must stay within ±32 KB of _gp. */
    .got : {
        *(.got*)
    } > RAM

    .sdata : {
        *(.sdata*)
    } > RAM

    .bss (NOLOAD) : {
        _bss_start = .;
        *(.bss*)
        *(.sbss*)
        *(COMMON)
        _bss_end = .;
    } > RAM

    /* _end marks the start of the heap (used by PSn00bSDK malloc). */
    _end = .;

    /DISCARD/ : {
        *(.eh_frame*)
        *(.ARM.exidx*)
        *(.comment)
        *(.note*)
        *(.MIPS.abiflags)
    }
}

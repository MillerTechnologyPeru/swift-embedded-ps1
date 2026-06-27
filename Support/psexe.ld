/*
 * psexe.ld — Linker script for PS-X EXE
 *
 * PS1 user RAM starts at 0x80010000 (first 64KB reserved by BIOS kernel).
 * The PS-X EXE header tells the BIOS loader where to DMA the payload and
 * where to jump; elf2psexe.py fills that header from this script's symbols.
 */

OUTPUT_FORMAT("elf32-littlemips")
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
        *(.sdata*)
    } > RAM

    .data : {
        *(.data*)
    } > RAM

    .bss : {
        _bss_start = .;
        *(.bss*)
        *(COMMON)
        _bss_end = .;
    } > RAM

    /DISCARD/ : {
        *(.eh_frame*)
        *(.ARM.exidx*)
        *(.comment)
        *(.note*)
        *(.MIPS.abiflags)
    }
}

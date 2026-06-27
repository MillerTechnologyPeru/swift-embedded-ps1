# boot.S — PS1 bare-metal entry point
# Assembled with clang --target=mipsel-none-elf -march=mips1 -mabi=o32
#
# PSn00bSDK handles all GPU/hardware init from C (ResetGraph etc).
# All we need here is:
#   1. Set up the stack pointer
#   2. Zero .bss
#   3. Call swift_main (which calls PSn00bSDK init then loops)

    .section .text.boot, "ax", @progbits
    .set    noreorder
    .global _start
    .type   _start, @function

_start:
    # Disable interrupts via COP0 Status register
    mfc0    $t0, $12
    li      $t1, ~0x0401        # clear IE + IM[2]
    and     $t0, $t0, $t1
    mtc0    $t0, $12

    # Stack: top of 2MB user RAM (KUSEG cached at 0x80000000)
    # 0x80200000 is one byte past 2MB; the stack grows downward
    lui     $sp, 0x8020
    addiu   $sp, $sp, -16       # 16-byte O32 ABI alignment

    # Zero .bss (required before any Swift globals are touched)
    la      $t0, _bss_start
    la      $t1, _bss_end
.zero_bss:
    beq     $t0, $t1, .call_swift
    nop
    sw      $zero, 0($t0)
    addiu   $t0, $t0, 4
    j       .zero_bss
    nop

.call_swift:
    # Jump into Swift — ResetGraph / GPU init is called from swiftMain()
    jal     swift_main
    nop

    # Should never return; halt
.halt:
    j       .halt
    nop

    .size _start, . - _start

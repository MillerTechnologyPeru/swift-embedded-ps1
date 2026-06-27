	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.text
	.file	"main.swift.s"
	.protected	main                    # -- Begin function main
	.globl	main
	.p2align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$fp,32,$ra
	.mask 	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)                    # 4-byte Folded Spill
	sw	$fp, 24($sp)                    # 4-byte Folded Spill
	sw	$16, 20($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	lw	$4, %got($e8HelloPS14dispSo7DISPENVV_ADtvp)($16)
	lw	$25, %call16(memset)($16)
	addiu	$5, $zero, 0
	addiu	$6, $zero, 40
	.reloc $tmp0, R_MIPS_JALR, memset
$tmp0:
	jalr	$25
	move	$gp, $16
	lw	$4, %got($e8HelloPS14drawSo7DRAWENVV_ADtvp)($16)
	lw	$25, %call16(memset)($16)
	addiu	$5, $zero, 0
	.reloc $tmp1, R_MIPS_JALR, memset
$tmp1:
	jalr	$25
	addiu	$6, $zero, 184
	lw	$1, %got($e8HelloPS12dbs5Int32Vvp)($16)
	nop
	sw	$zero, 0($1)
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$16, 20($sp)                    # 4-byte Folded Reload
	lw	$fp, 24($sp)                    # 4-byte Folded Reload
	lw	$ra, 28($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 32
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end0:
	.size	main, $func_end0-main
                                        # -- End function
	.protected	$e8HelloPS111initDisplayyyF # -- Begin function $e8HelloPS111initDisplayyyF
	.globl	$e8HelloPS111initDisplayyyF
	.p2align	2
	.type	$e8HelloPS111initDisplayyyF,@function
	.set	nomicromips
	.set	nomips16
	.ent	$e8HelloPS111initDisplayyyF
$e8HelloPS111initDisplayyyF:            # @"$e8HelloPS111initDisplayyyF"
	.frame	$fp,56,$ra
	.mask 	0xc01f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -56
	sw	$ra, 52($sp)                    # 4-byte Folded Spill
	sw	$fp, 48($sp)                    # 4-byte Folded Spill
	sw	$20, 44($sp)                    # 4-byte Folded Spill
	sw	$19, 40($sp)                    # 4-byte Folded Spill
	sw	$18, 36($sp)                    # 4-byte Folded Spill
	sw	$17, 32($sp)                    # 4-byte Folded Spill
	sw	$16, 28($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	lw	$25, %call16(ResetGraph)($16)
	addiu	$4, $zero, 0
	.reloc $tmp2, R_MIPS_JALR, ResetGraph
$tmp2:
	jalr	$25
	move	$gp, $16
	addiu	$20, $zero, 240
	sw	$20, 16($sp)
	lw	$17, %got($e8HelloPS14dispSo7DISPENVV_ADtvp)($16)
	lw	$25, %call16(SetDefDispEnv)($16)
	move	$4, $17
	addiu	$5, $zero, 0
	addiu	$6, $zero, 0
	addiu	$7, $zero, 320
	.reloc $tmp3, R_MIPS_JALR, SetDefDispEnv
$tmp3:
	jalr	$25
	move	$gp, $16
	addiu	$4, $17, 20
	sw	$20, 16($sp)
	lw	$25, %call16(SetDefDispEnv)($16)
	addiu	$5, $zero, 0
	addiu	$6, $zero, 240
	.reloc $tmp4, R_MIPS_JALR, SetDefDispEnv
$tmp4:
	jalr	$25
	addiu	$7, $zero, 320
	lw	$18, %got($e8HelloPS14drawSo7DRAWENVV_ADtvp)($16)
	sw	$20, 16($sp)
	lw	$25, %call16(SetDefDrawEnv)($16)
	move	$4, $18
	addiu	$5, $zero, 0
	addiu	$6, $zero, 240
	addiu	$7, $zero, 320
	.reloc $tmp5, R_MIPS_JALR, SetDefDrawEnv
$tmp5:
	jalr	$25
	move	$gp, $16
	addiu	$19, $18, 92
	sw	$20, 16($sp)
	lw	$25, %call16(SetDefDrawEnv)($16)
	move	$4, $19
	addiu	$5, $zero, 0
	addiu	$6, $zero, 0
	.reloc $tmp6, R_MIPS_JALR, SetDefDrawEnv
$tmp6:
	jalr	$25
	addiu	$7, $zero, 320
	lw	$25, %call16(swift_setRGB0)($16)
	move	$4, $18
	addiu	$5, $zero, 24
	addiu	$6, $zero, 8
	addiu	$7, $zero, 64
	.reloc $tmp7, R_MIPS_JALR, swift_setRGB0
$tmp7:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(swift_setRGB0)($16)
	move	$4, $19
	addiu	$5, $zero, 24
	addiu	$6, $zero, 8
	.reloc $tmp8, R_MIPS_JALR, swift_setRGB0
$tmp8:
	jalr	$25
	addiu	$7, $zero, 64
	addiu	$1, $zero, 1
	sb	$1, 116($18)
	sb	$1, 24($18)
	lw	$25, %call16(PutDispEnv)($16)
	move	$4, $17
	.reloc $tmp9, R_MIPS_JALR, PutDispEnv
$tmp9:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(PutDrawEnv)($16)
	move	$4, $18
	.reloc $tmp10, R_MIPS_JALR, PutDrawEnv
$tmp10:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(SetDispMask)($16)
	addiu	$4, $zero, 1
	.reloc $tmp11, R_MIPS_JALR, SetDispMask
$tmp11:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(FntLoad)($16)
	addiu	$4, $zero, 960
	addiu	$5, $zero, 0
	.reloc $tmp12, R_MIPS_JALR, FntLoad
$tmp12:
	jalr	$25
	move	$gp, $16
	addiu	$1, $zero, 512
	sw	$1, 20($sp)
	sw	$zero, 16($sp)
	lw	$25, %call16(FntOpen)($16)
	addiu	$4, $zero, 0
	addiu	$5, $zero, 8
	addiu	$6, $zero, 320
	addiu	$7, $zero, 224
	.reloc $tmp13, R_MIPS_JALR, FntOpen
$tmp13:
	jalr	$25
	move	$gp, $16
	move	$4, $2
	lw	$25, %call16(swift_SetDumpFnt)($16)
	nop
	.reloc $tmp14, R_MIPS_JALR, swift_SetDumpFnt
$tmp14:
	jalr	$25
	move	$gp, $16
	move	$sp, $fp
	lw	$16, 28($sp)                    # 4-byte Folded Reload
	lw	$17, 32($sp)                    # 4-byte Folded Reload
	lw	$18, 36($sp)                    # 4-byte Folded Reload
	lw	$19, 40($sp)                    # 4-byte Folded Reload
	lw	$20, 44($sp)                    # 4-byte Folded Reload
	lw	$fp, 48($sp)                    # 4-byte Folded Reload
	lw	$ra, 52($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 56
	.set	at
	.set	macro
	.set	reorder
	.end	$e8HelloPS111initDisplayyyF
$func_end1:
	.size	$e8HelloPS111initDisplayyyF, $func_end1-$e8HelloPS111initDisplayyyF
                                        # -- End function
	.protected	swift_main              # -- Begin function swift_main
	.globl	swift_main
	.p2align	2
	.type	swift_main,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_main
swift_main:                             # @swift_main
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($e8HelloPS19swiftMainyyF)($gp)
	nop
	.reloc $tmp15, R_MIPS_JALR, $e8HelloPS19swiftMainyyF
$tmp15:
	jalr	$25
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	swift_main
$func_end2:
	.size	swift_main, $func_end2-swift_main
                                        # -- End function
	.protected	$e8HelloPS19swiftMainyyF # -- Begin function $e8HelloPS19swiftMainyyF
	.globl	$e8HelloPS19swiftMainyyF
	.p2align	2
	.type	$e8HelloPS19swiftMainyyF,@function
	.set	nomicromips
	.set	nomips16
	.ent	$e8HelloPS19swiftMainyyF
$e8HelloPS19swiftMainyyF:               # @"$e8HelloPS19swiftMainyyF"
	.frame	$fp,56,$ra
	.mask 	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -56
	sw	$ra, 52($sp)                    # 4-byte Folded Spill
	sw	$fp, 48($sp)                    # 4-byte Folded Spill
	sw	$23, 44($sp)                    # 4-byte Folded Spill
	sw	$22, 40($sp)                    # 4-byte Folded Spill
	sw	$21, 36($sp)                    # 4-byte Folded Spill
	sw	$20, 32($sp)                    # 4-byte Folded Spill
	sw	$19, 28($sp)                    # 4-byte Folded Spill
	sw	$18, 24($sp)                    # 4-byte Folded Spill
	sw	$17, 20($sp)                    # 4-byte Folded Spill
	sw	$16, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	lw	$25, %call16($e8HelloPS111initDisplayyyF)($16)
	nop
	.reloc $tmp16, R_MIPS_JALR, $e8HelloPS111initDisplayyyF
$tmp16:
	jalr	$25
	move	$gp, $16
	lw	$17, %got($e8HelloPS14dispSo7DISPENVV_ADtvp)($16)
	nop
	addiu	$18, $17, 20
	addiu	$19, $zero, 1
	lw	$20, %got($e8HelloPS12dbs5Int32Vvp)($16)
	lw	$21, %got($e8HelloPS14drawSo7DRAWENVV_ADtvp)($16)
	nop
	addiu	$22, $21, 92
$BB3_1:                                 # =>This Inner Loop Header: Depth=1
	lw	$25, %call16(swift_print_messages)($16)
	nop
	.reloc $tmp17, R_MIPS_JALR, swift_print_messages
$tmp17:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(FntFlush)($16)
	addiu	$4, $zero, -1
	.reloc $tmp18, R_MIPS_JALR, FntFlush
$tmp18:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(DrawSync)($16)
	addiu	$4, $zero, 0
	.reloc $tmp19, R_MIPS_JALR, DrawSync
$tmp19:
	jalr	$25
	move	$gp, $16
	lw	$25, %call16(VSync)($16)
	addiu	$4, $zero, 0
	.reloc $tmp20, R_MIPS_JALR, VSync
$tmp20:
	jalr	$25
	move	$gp, $16
	lw	$1, 0($20)
	nop
	xori	$2, $1, 1
	sw	$2, 0($20)
	xor	$1, $1, $19
	sltiu	$23, $1, 1
	bnez	$23, $BB3_3
	move	$4, $17
# %bb.2:                                #   in Loop: Header=BB3_1 Depth=1
	move	$4, $18
$BB3_3:                                 #   in Loop: Header=BB3_1 Depth=1
	lw	$25, %call16(PutDispEnv)($16)
	nop
	.reloc $tmp21, R_MIPS_JALR, PutDispEnv
$tmp21:
	jalr	$25
	move	$gp, $16
	bnez	$23, $BB3_5
	move	$4, $21
# %bb.4:                                #   in Loop: Header=BB3_1 Depth=1
	move	$4, $22
$BB3_5:                                 #   in Loop: Header=BB3_1 Depth=1
	lw	$25, %call16(PutDrawEnv)($16)
	nop
	.reloc $tmp22, R_MIPS_JALR, PutDrawEnv
$tmp22:
	jalr	$25
	move	$gp, $16
	b	$BB3_1
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	$e8HelloPS19swiftMainyyF
$func_end3:
	.size	$e8HelloPS19swiftMainyyF, $func_end3-$e8HelloPS19swiftMainyyF
                                        # -- End function
	.protected	swift_allocBox          # -- Begin function swift_allocBox
	.weak	swift_allocBox
	.p2align	2
	.type	swift_allocBox,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_allocBox
swift_allocBox:                         # @swift_allocBox
	.frame	$fp,48,$ra
	.mask 	0xc00f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -48
	sw	$ra, 44($sp)                    # 4-byte Folded Spill
	sw	$fp, 40($sp)                    # 4-byte Folded Spill
	sw	$19, 36($sp)                    # 4-byte Folded Spill
	sw	$18, 32($sp)                    # 4-byte Folded Spill
	sw	$17, 28($sp)                    # 4-byte Folded Spill
	sw	$16, 24($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	move	$17, $4
	lw	$18, %got(__stack_chk_guard)($16)
	nop
	lw	$1, 0($18)
	nop
	sw	$1, 20($fp)
	lw	$1, -4($4)
	nop
	lbu	$2, 40($1)
	nop
	not	$3, $2
	addiu	$4, $2, 8
	and	$19, $4, $3
	lw	$1, 32($1)
	nop
	addu	$6, $19, $1
	slt	$3, $6, $19
	slti	$1, $1, 0
	xor	$1, $1, $3
	bnez	$1, $BB4_6
	nop
# %bb.1:
	sltiu	$1, $2, 4
	bnez	$1, $BB4_3
	addiu	$5, $zero, 4
# %bb.2:
	ori	$1, $2, 3
	addiu	$5, $1, 1
$BB4_3:
	sw	$zero, 16($fp)
	addiu	$4, $fp, 16
	lw	$25, %call16(posix_memalign)($16)
	nop
	.reloc $tmp23, R_MIPS_JALR, posix_memalign
$tmp23:
	jalr	$25
	move	$gp, $16
	lw	$2, 16($fp)
	nop
	beqz	$2, $BB4_7
	nop
# %bb.4:
	addiu	$1, $zero, 1
	sw	$1, 4($2)
	sw	$17, 0($2)
	lw	$1, 0($18)
	lw	$3, 20($fp)
	nop
	bne	$1, $3, $BB4_8
	nop
# %bb.5:
	addu	$3, $2, $19
	move	$sp, $fp
	lw	$16, 24($sp)                    # 4-byte Folded Reload
	lw	$17, 28($sp)                    # 4-byte Folded Reload
	lw	$18, 32($sp)                    # 4-byte Folded Reload
	lw	$19, 36($sp)                    # 4-byte Folded Reload
	lw	$fp, 40($sp)                    # 4-byte Folded Reload
	lw	$ra, 44($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 48
$BB4_6:
	break
$BB4_7:
	break
$BB4_8:
	lw	$25, %call16(__stack_chk_fail)($16)
	nop
	.reloc $tmp24, R_MIPS_JALR, __stack_chk_fail
$tmp24:
	jalr	$25
	move	$gp, $16
	.set	at
	.set	macro
	.set	reorder
	.end	swift_allocBox
$func_end4:
	.size	swift_allocBox, $func_end4-swift_allocBox
                                        # -- End function
	.protected	swift_makeBoxUnique     # -- Begin function swift_makeBoxUnique
	.weak	swift_makeBoxUnique
	.p2align	2
	.type	swift_makeBoxUnique,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_makeBoxUnique
swift_makeBoxUnique:                    # @swift_makeBoxUnique
	.frame	$fp,56,$ra
	.mask 	0xc07f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -56
	sw	$ra, 52($sp)                    # 4-byte Folded Spill
	sw	$fp, 48($sp)                    # 4-byte Folded Spill
	sw	$22, 44($sp)                    # 4-byte Folded Spill
	sw	$21, 40($sp)                    # 4-byte Folded Spill
	sw	$20, 36($sp)                    # 4-byte Folded Spill
	sw	$19, 32($sp)                    # 4-byte Folded Spill
	sw	$18, 28($sp)                    # 4-byte Folded Spill
	sw	$17, 24($sp)                    # 4-byte Folded Spill
	sw	$16, 20($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$17, $2, $25
	addiu	$2, $6, 8
	slt	$1, $2, $6
	bnez	$1, $BB5_6
	nop
# %bb.1:
	move	$19, $5
	move	$16, $4
	lw	$18, 0($4)
	not	$1, $6
	and	$1, $2, $1
	beqz	$18, $BB5_4
	addu	$22, $18, $1
# %bb.2:
	lw	$1, 4($18)
	addiu	$2, $zero, 1
	bne	$1, $2, $BB5_4
	nop
# %bb.3:
	move	$20, $18
	b	$BB5_5
	move	$21, $22
$BB5_4:
	lw	$25, %call16(swift_allocBox)($17)
	move	$4, $19
	.reloc $tmp25, R_MIPS_JALR, swift_allocBox
$tmp25:
	jalr	$25
	move	$gp, $17
	move	$20, $2
	move	$21, $3
	lw	$1, -4($19)
	nop
	lw	$25, 8($1)
	move	$4, $3
	move	$5, $22
	jalr	$25
	move	$6, $19
	lw	$25, %call16(swift_releaseBox)($17)
	move	$4, $18
	.reloc $tmp26, R_MIPS_JALR, swift_releaseBox
$tmp26:
	jalr	$25
	move	$gp, $17
	sw	$20, 0($16)
$BB5_5:
	move	$2, $20
	move	$3, $21
	move	$sp, $fp
	lw	$16, 20($sp)                    # 4-byte Folded Reload
	lw	$17, 24($sp)                    # 4-byte Folded Reload
	lw	$18, 28($sp)                    # 4-byte Folded Reload
	lw	$19, 32($sp)                    # 4-byte Folded Reload
	lw	$20, 36($sp)                    # 4-byte Folded Reload
	lw	$21, 40($sp)                    # 4-byte Folded Reload
	lw	$22, 44($sp)                    # 4-byte Folded Reload
	lw	$fp, 48($sp)                    # 4-byte Folded Reload
	lw	$ra, 52($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 56
$BB5_6:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_makeBoxUnique
$func_end5:
	.size	swift_makeBoxUnique, $func_end5-swift_makeBoxUnique
                                        # -- End function
	.hidden	swift_releaseBox                # -- Begin function swift_releaseBox
	.weak	swift_releaseBox
	.p2align	2
	.type	swift_releaseBox,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_releaseBox
swift_releaseBox:                       # @swift_releaseBox
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	beqz	$4, $BB6_8
	nop
# %bb.1:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$2, 4($4)
	nop
	and	$3, $2, $1
	beq	$3, $1, $BB6_6
	nop
# %bb.2:
	addiu	$1, $4, 4
	addiu	$3, $zero, 1
$BB6_3:                                 # =>This Inner Loop Header: Depth=1
	ll	$5, 0($1)
	subu	$6, $5, $3
	sc	$6, 0($1)
	beqz	$6, $BB6_3
	nop
# %bb.4:
	addiu	$3, $5, -1
	slt	$1, $3, $5
	beqz	$1, $BB6_9
	nop
# %bb.5:
	lui	$1, 32767
	ori	$5, $1, 65535
	and	$1, $3, $5
	beqz	$1, $BB6_7
	nop
$BB6_6:
	jr	$ra
	nop
$BB6_7:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	or	$1, $2, $5
	sw	$1, 4($4)
	lw	$5, 0($4)
	nop
	lw	$1, -4($5)
	nop
	lbu	$2, 40($1)
	nop
	not	$3, $2
	addiu	$2, $2, 8
	and	$2, $2, $3
	lw	$25, 4($1)
	nop
	jalr	$25
	addu	$4, $4, $2
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
$BB6_8:
	break
$BB6_9:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_releaseBox
$func_end6:
	.size	swift_releaseBox, $func_end6-swift_releaseBox
                                        # -- End function
	.protected	swift_deallocBox        # -- Begin function swift_deallocBox
	.weak	swift_deallocBox
	.p2align	2
	.type	swift_deallocBox,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deallocBox
swift_deallocBox:                       # @swift_deallocBox
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16(free)($gp)
	nop
	.reloc $tmp27, R_MIPS_JALR, free
$tmp27:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deallocBox
$func_end7:
	.size	swift_deallocBox, $func_end7-swift_deallocBox
                                        # -- End function
	.protected	swift_allocEmptyBox     # -- Begin function swift_allocEmptyBox
	.weak	swift_allocEmptyBox
	.p2align	2
	.type	swift_allocEmptyBox,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_allocEmptyBox
swift_allocEmptyBox:                    # @swift_allocEmptyBox
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	addu	$1, $2, $25
	lui	$2, 32767
	ori	$3, $2, 65535
	lw	$2, %got($es16_emptyBoxStorageSi_Sitvp)($1)
	nop
	lw	$1, 4($2)
	nop
	and	$1, $1, $3
	beq	$1, $3, $BB8_4
	nop
# %bb.1:
	addiu	$1, $2, 4
	addiu	$3, $zero, 1
$BB8_2:                                 # =>This Inner Loop Header: Depth=1
	ll	$4, 0($1)
	addu	$5, $4, $3
	sc	$5, 0($1)
	beqz	$5, $BB8_2
	nop
# %bb.3:
	.insn
$BB8_4:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_allocEmptyBox
$func_end8:
	.size	swift_allocEmptyBox, $func_end8-swift_allocEmptyBox
                                        # -- End function
	.protected	swift_allocObject       # -- Begin function swift_allocObject
	.weak	swift_allocObject
	.p2align	2
	.type	swift_allocObject,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_allocObject
swift_allocObject:                      # @swift_allocObject
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF)($gp)
	nop
	.reloc $tmp28, R_MIPS_JALR, $es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
$tmp28:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_allocObject
$func_end9:
	.size	swift_allocObject, $func_end9-swift_allocObject
                                        # -- End function
	.hidden	$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF # -- Begin function $es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
	.weak	$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
	.p2align	2
	.type	$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF: # @"$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF"
	.frame	$fp,48,$ra
	.mask 	0xc0070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -48
	sw	$ra, 44($sp)                    # 4-byte Folded Spill
	sw	$fp, 40($sp)                    # 4-byte Folded Spill
	sw	$18, 36($sp)                    # 4-byte Folded Spill
	sw	$17, 32($sp)                    # 4-byte Folded Spill
	sw	$16, 28($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	move	$2, $5
	lw	$18, %got(__stack_chk_guard)($16)
	nop
	lw	$1, 0($18)
	nop
	sw	$1, 24($fp)
	addiu	$1, $zero, -1
	beq	$6, $1, $BB10_4
	move	$17, $4
# %bb.1:
	addiu	$5, $6, 1
	slt	$1, $5, $6
	bnez	$1, $BB10_8
	nop
# %bb.2:
	addiu	$1, $zero, 4
	slt	$1, $1, $5
	bnez	$1, $BB10_5
	nop
# %bb.3:
	b	$BB10_5
	addiu	$5, $zero, 4
$BB10_4:
	addiu	$5, $zero, 16
$BB10_5:
	sw	$zero, 20($fp)
	addiu	$4, $fp, 20
	lw	$25, %call16(posix_memalign)($16)
	move	$6, $2
	.reloc $tmp29, R_MIPS_JALR, posix_memalign
$tmp29:
	jalr	$25
	move	$gp, $16
	lw	$2, 20($fp)
	nop
	beqz	$2, $BB10_9
	nop
# %bb.6:
	addiu	$1, $zero, 1
	sw	$1, 4($2)
	sw	$17, 0($2)
	lw	$1, 0($18)
	lw	$3, 24($fp)
	nop
	bne	$1, $3, $BB10_10
	nop
# %bb.7:
	move	$sp, $fp
	lw	$16, 28($sp)                    # 4-byte Folded Reload
	lw	$17, 32($sp)                    # 4-byte Folded Reload
	lw	$18, 36($sp)                    # 4-byte Folded Reload
	lw	$fp, 40($sp)                    # 4-byte Folded Reload
	lw	$ra, 44($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 48
$BB10_8:
	break
$BB10_9:
	break
$BB10_10:
	lw	$25, %call16(__stack_chk_fail)($16)
	nop
	.reloc $tmp30, R_MIPS_JALR, __stack_chk_fail
$tmp30:
	jalr	$25
	move	$gp, $16
	.set	at
	.set	macro
	.set	reorder
	.end	$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
$func_end10:
	.size	$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF, $func_end10-$es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
                                        # -- End function
	.protected	swift_allocObjectTyped  # -- Begin function swift_allocObjectTyped
	.weak	swift_allocObjectTyped
	.p2align	2
	.type	swift_allocObjectTyped,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_allocObjectTyped
swift_allocObjectTyped:                 # @swift_allocObjectTyped
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF)($gp)
	nop
	.reloc $tmp31, R_MIPS_JALR, $es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
$tmp31:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_allocObjectTyped
$func_end11:
	.size	swift_allocObjectTyped, $func_end11-swift_allocObjectTyped
                                        # -- End function
	.protected	swift_initStackObject   # -- Begin function swift_initStackObject
	.weak	swift_initStackObject
	.p2align	2
	.type	swift_initStackObject,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_initStackObject
swift_initStackObject:                  # @swift_initStackObject
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	sw	$4, 0($5)
	lui	$1, 32768
	ori	$1, $1, 1
	sw	$1, 4($5)
	move	$2, $5
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_initStackObject
$func_end12:
	.size	swift_initStackObject, $func_end12-swift_initStackObject
                                        # -- End function
	.protected	swift_initStaticObject  # -- Begin function swift_initStaticObject
	.weak	swift_initStaticObject
	.p2align	2
	.type	swift_initStaticObject,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_initStaticObject
swift_initStaticObject:                 # @swift_initStaticObject
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$1, $zero, -1
	sw	$1, 4($5)
	sw	$4, 0($5)
	move	$2, $5
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_initStaticObject
$func_end13:
	.size	swift_initStaticObject, $func_end13-swift_initStaticObject
                                        # -- End function
	.p2align	2                               # -- Begin function 
	.type	$__unnamed_1,@function
	.set	nomicromips
	.set	nomips16
	.ent	$__unnamed_1
$__unnamed_1:                           # @0
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16(free)($gp)
	nop
	.reloc $tmp32, R_MIPS_JALR, free
$tmp32:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	$__unnamed_1
$func_end14:
	.size	$__unnamed_1, $func_end14-$__unnamed_1
                                        # -- End function
	.protected	swift_deallocClassInstance # -- Begin function swift_deallocClassInstance
	.weak	swift_deallocClassInstance
	.p2align	2
	.type	swift_deallocClassInstance,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deallocClassInstance
swift_deallocClassInstance:             # @swift_deallocClassInstance
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	lw	$1, 4($4)
	nop
	bltz	$1, $BB15_2
	addu	$gp, $2, $25
# %bb.1:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	lw	$25, %call16(free)($gp)
	nop
	.reloc $tmp33, R_MIPS_JALR, free
$tmp33:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 24
$BB15_2:
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deallocClassInstance
$func_end15:
	.size	swift_deallocClassInstance, $func_end15-swift_deallocClassInstance
                                        # -- End function
	.protected	swift_deallocPartialClassInstance # -- Begin function swift_deallocPartialClassInstance
	.weak	swift_deallocPartialClassInstance
	.p2align	2
	.type	swift_deallocPartialClassInstance,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deallocPartialClassInstance
swift_deallocPartialClassInstance:      # @swift_deallocPartialClassInstance
	.frame	$fp,40,$ra
	.mask 	0xc0070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -40
	sw	$ra, 36($sp)                    # 4-byte Folded Spill
	sw	$fp, 32($sp)                    # 4-byte Folded Spill
	sw	$18, 28($sp)                    # 4-byte Folded Spill
	sw	$17, 24($sp)                    # 4-byte Folded Spill
	sw	$16, 20($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	move	$16, $5
	move	$17, $4
	lw	$18, 0($4)
	nop
$BB16_1:                                # =>This Inner Loop Header: Depth=1
	beq	$18, $16, $BB16_5
	nop
# %bb.2:                                #   in Loop: Header=BB16_1 Depth=1
	lw	$25, 8($18)
	nop
	beqz	$25, $BB16_4
	nop
# %bb.3:                                #   in Loop: Header=BB16_1 Depth=1
	jalr	$25
	move	$4, $17
$BB16_4:                                #   in Loop: Header=BB16_1 Depth=1
	lw	$18, 0($18)
	nop
	bnez	$18, $BB16_1
	nop
$BB16_5:
	move	$sp, $fp
	lw	$16, 20($sp)                    # 4-byte Folded Reload
	lw	$17, 24($sp)                    # 4-byte Folded Reload
	lw	$18, 28($sp)                    # 4-byte Folded Reload
	lw	$fp, 32($sp)                    # 4-byte Folded Reload
	lw	$ra, 36($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 40
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deallocPartialClassInstance
$func_end16:
	.size	swift_deallocPartialClassInstance, $func_end16-swift_deallocPartialClassInstance
                                        # -- End function
	.protected	swift_slowAlloc         # -- Begin function swift_slowAlloc
	.weak	swift_slowAlloc
	.p2align	2
	.type	swift_slowAlloc,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_slowAlloc
swift_slowAlloc:                        # @swift_slowAlloc
	.frame	$fp,40,$ra
	.mask 	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -40
	sw	$ra, 36($sp)                    # 4-byte Folded Spill
	sw	$fp, 32($sp)                    # 4-byte Folded Spill
	sw	$17, 28($sp)                    # 4-byte Folded Spill
	sw	$16, 24($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	lw	$17, %got(__stack_chk_guard)($16)
	nop
	lw	$1, 0($17)
	nop
	sw	$1, 20($fp)
	addiu	$1, $zero, -1
	beq	$5, $1, $BB17_4
	move	$6, $4
# %bb.1:
	move	$2, $5
	addiu	$5, $5, 1
	slt	$1, $5, $2
	bnez	$1, $BB17_7
	nop
# %bb.2:
	addiu	$1, $zero, 4
	slt	$1, $1, $5
	bnez	$1, $BB17_5
	nop
# %bb.3:
	b	$BB17_5
	addiu	$5, $zero, 4
$BB17_4:
	addiu	$5, $zero, 16
$BB17_5:
	sw	$zero, 16($fp)
	addiu	$4, $fp, 16
	lw	$25, %call16(posix_memalign)($16)
	nop
	.reloc $tmp34, R_MIPS_JALR, posix_memalign
$tmp34:
	jalr	$25
	move	$gp, $16
	lw	$2, 16($fp)
	lw	$1, 0($17)
	lw	$3, 20($fp)
	nop
	bne	$1, $3, $BB17_8
	nop
# %bb.6:
	move	$sp, $fp
	lw	$16, 24($sp)                    # 4-byte Folded Reload
	lw	$17, 28($sp)                    # 4-byte Folded Reload
	lw	$fp, 32($sp)                    # 4-byte Folded Reload
	lw	$ra, 36($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 40
$BB17_7:
	break
$BB17_8:
	lw	$25, %call16(__stack_chk_fail)($16)
	nop
	.reloc $tmp35, R_MIPS_JALR, __stack_chk_fail
$tmp35:
	jalr	$25
	move	$gp, $16
	.set	at
	.set	macro
	.set	reorder
	.end	swift_slowAlloc
$func_end17:
	.size	swift_slowAlloc, $func_end17-swift_slowAlloc
                                        # -- End function
	.protected	swift_willThrow         # -- Begin function swift_willThrow
	.weak	swift_willThrow
	.p2align	2
	.type	swift_willThrow,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_willThrow
swift_willThrow:                        # @swift_willThrow
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_willThrow
$func_end18:
	.size	swift_willThrow, $func_end18-swift_willThrow
                                        # -- End function
	.protected	swift_unexpectedError   # -- Begin function swift_unexpectedError
	.weak	swift_unexpectedError
	.p2align	2
	.type	swift_unexpectedError,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_unexpectedError
swift_unexpectedError:                  # @swift_unexpectedError
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_unexpectedError
$func_end19:
	.size	swift_unexpectedError, $func_end19-swift_unexpectedError
                                        # -- End function
	.protected	swift_release_n         # -- Begin function swift_release_n
	.weak	swift_release_n
	.p2align	2
	.type	swift_release_n,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_release_n
swift_release_n:                        # @swift_release_n
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	beqz	$4, $BB20_7
	nop
# %bb.1:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$2, 4($4)
	nop
	and	$3, $2, $1
	beq	$3, $1, $BB20_7
	nop
# %bb.2:
	bltz	$5, $BB20_9
	nop
# %bb.3:
	addiu	$1, $4, 4
$BB20_4:                                # =>This Inner Loop Header: Depth=1
	ll	$6, 0($1)
	subu	$3, $6, $5
	sc	$3, 0($1)
	beqz	$3, $BB20_4
	nop
# %bb.5:
	subu	$3, $6, $5
	slt	$1, $3, $6
	slt	$5, $zero, $5
	xor	$1, $5, $1
	bnez	$1, $BB20_10
	nop
# %bb.6:
	lui	$1, 32767
	ori	$5, $1, 65535
	and	$1, $3, $5
	beqz	$1, $BB20_8
	nop
$BB20_7:
	jr	$ra
	nop
$BB20_8:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	or	$1, $2, $5
	sw	$1, 4($4)
	lw	$1, 0($4)
	nop
	lw	$25, 4($1)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
$BB20_9:
	break
$BB20_10:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_release_n
$func_end20:
	.size	swift_release_n, $func_end20-swift_release_n
                                        # -- End function
	.protected	swift_setDeallocating   # -- Begin function swift_setDeallocating
	.weak	swift_setDeallocating
	.p2align	2
	.type	swift_setDeallocating,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_setDeallocating
swift_setDeallocating:                  # @swift_setDeallocating
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_setDeallocating
$func_end21:
	.size	swift_setDeallocating, $func_end21-swift_setDeallocating
                                        # -- End function
	.p2align	2                               # -- Begin function 
	.type	$__unnamed_2,@function
	.set	nomicromips
	.set	nomips16
	.ent	$__unnamed_2
$__unnamed_2:                           # @1
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	beqz	$4, $BB22_6
	nop
# %bb.1:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$2, 4($4)
	nop
	and	$2, $2, $1
	beq	$2, $1, $BB22_6
	nop
# %bb.2:
	bltz	$5, $BB22_7
	nop
# %bb.3:
	addiu	$1, $4, 4
$BB22_4:                                # =>This Inner Loop Header: Depth=1
	ll	$2, 0($1)
	addu	$3, $2, $5
	sc	$3, 0($1)
	beqz	$3, $BB22_4
	nop
# %bb.5:
	.insn
$BB22_6:
	move	$2, $4
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
$BB22_7:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	$__unnamed_2
$func_end22:
	.size	$__unnamed_2, $func_end22-$__unnamed_2
                                        # -- End function
	.p2align	2                               # -- Begin function 
	.type	$__unnamed_3,@function
	.set	nomicromips
	.set	nomips16
	.ent	$__unnamed_3
$__unnamed_3:                           # @2
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16(swift_release_n)($gp)
	nop
	.reloc $tmp36, R_MIPS_JALR, swift_release_n
$tmp36:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	$__unnamed_3
$func_end23:
	.size	$__unnamed_3, $func_end23-$__unnamed_3
                                        # -- End function
	.p2align	2                               # -- Begin function 
	.type	$__unnamed_4,@function
	.set	nomicromips
	.set	nomips16
	.ent	$__unnamed_4
$__unnamed_4:                           # @3
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	beqz	$4, $BB24_5
	nop
# %bb.1:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$2, 4($4)
	nop
	and	$2, $2, $1
	beq	$2, $1, $BB24_5
	nop
# %bb.2:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$1, $4, 4
	addiu	$2, $zero, 1
$BB24_3:                                # =>This Inner Loop Header: Depth=1
	ll	$3, 0($1)
	addu	$5, $3, $2
	sc	$5, 0($1)
	beqz	$5, $BB24_3
	nop
# %bb.4:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	addiu	$sp, $sp, 8
$BB24_5:
	jr	$ra
	move	$2, $4
	.set	at
	.set	macro
	.set	reorder
	.end	$__unnamed_4
$func_end24:
	.size	$__unnamed_4, $func_end24-$__unnamed_4
                                        # -- End function
	.p2align	2                               # -- Begin function 
	.type	$__unnamed_5,@function
	.set	nomicromips
	.set	nomips16
	.ent	$__unnamed_5
$__unnamed_5:                           # @4
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$1, $2, $25
	lw	$1, %got(swift_releaseTm)($1)
	nop
	addiu	$25, $1, %lo(swift_releaseTm)
	.reloc $tmp37, R_MIPS_JALR, swift_releaseTm
$tmp37:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	$__unnamed_5
$func_end25:
	.size	$__unnamed_5, $func_end25-$__unnamed_5
                                        # -- End function
	.protected	swift_bridgeObjectRelease # -- Begin function swift_bridgeObjectRelease
	.weak	swift_bridgeObjectRelease
	.p2align	2
	.type	swift_bridgeObjectRelease,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_bridgeObjectRelease
swift_bridgeObjectRelease:              # @swift_bridgeObjectRelease
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16(swift_release_n)($gp)
	nop
	.reloc $tmp38, R_MIPS_JALR, swift_release_n
$tmp38:
	jalr	$25
	addiu	$5, $zero, 1
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_bridgeObjectRelease
$func_end26:
	.size	swift_bridgeObjectRelease, $func_end26-swift_bridgeObjectRelease
                                        # -- End function
	.p2align	2                               # -- Begin function swift_releaseTm
	.type	swift_releaseTm,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_releaseTm
swift_releaseTm:                        # @swift_releaseTm
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	beqz	$4, $BB27_6
	nop
# %bb.1:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$2, 4($4)
	nop
	and	$3, $2, $1
	beq	$3, $1, $BB27_6
	nop
# %bb.2:
	addiu	$1, $4, 4
	addiu	$3, $zero, 1
$BB27_3:                                # =>This Inner Loop Header: Depth=1
	ll	$5, 0($1)
	subu	$6, $5, $3
	sc	$6, 0($1)
	beqz	$6, $BB27_3
	nop
# %bb.4:
	addiu	$3, $5, -1
	slt	$1, $3, $5
	beqz	$1, $BB27_8
	nop
# %bb.5:
	lui	$1, 32767
	ori	$5, $1, 65535
	and	$1, $3, $5
	beqz	$1, $BB27_7
	nop
$BB27_6:
	jr	$ra
	nop
$BB27_7:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	or	$1, $2, $5
	sw	$1, 4($4)
	lw	$1, 0($4)
	nop
	lw	$25, 4($1)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
$BB27_8:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_releaseTm
$func_end27:
	.size	swift_releaseTm, $func_end27-swift_releaseTm
                                        # -- End function
	.protected	swift_isUniquelyReferenced_native # -- Begin function swift_isUniquelyReferenced_native
	.weak	swift_isUniquelyReferenced_native
	.p2align	2
	.type	swift_isUniquelyReferenced_native,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_isUniquelyReferenced_native
swift_isUniquelyReferenced_native:      # @swift_isUniquelyReferenced_native
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	beqz	$4, $BB28_2
	nop
# %bb.1:
	lw	$1, 4($4)
	addiu	$2, $zero, 1
	xor	$1, $1, $2
	b	$BB28_3
	sltiu	$2, $1, 1
$BB28_2:
	addiu	$2, $zero, 0
$BB28_3:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_isUniquelyReferenced_native
$func_end28:
	.size	swift_isUniquelyReferenced_native, $func_end28-swift_isUniquelyReferenced_native
                                        # -- End function
	.protected	swift_isUniquelyReferenced_nonNull_native # -- Begin function swift_isUniquelyReferenced_nonNull_native
	.weak	swift_isUniquelyReferenced_nonNull_native
	.p2align	2
	.type	swift_isUniquelyReferenced_nonNull_native,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_isUniquelyReferenced_nonNull_native
swift_isUniquelyReferenced_nonNull_native: # @swift_isUniquelyReferenced_nonNull_native
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$1, 4($4)
	addiu	$2, $zero, 1
	xor	$1, $1, $2
	sltiu	$2, $1, 1
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_isUniquelyReferenced_nonNull_native
$func_end29:
	.size	swift_isUniquelyReferenced_nonNull_native, $func_end29-swift_isUniquelyReferenced_nonNull_native
                                        # -- End function
	.protected	swift_isEscapingClosureAtFileLocation # -- Begin function swift_isEscapingClosureAtFileLocation
	.weak	swift_isEscapingClosureAtFileLocation
	.p2align	2
	.type	swift_isEscapingClosureAtFileLocation,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_isEscapingClosureAtFileLocation
swift_isEscapingClosureAtFileLocation:  # @swift_isEscapingClosureAtFileLocation
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	beqz	$4, $BB30_2
	nop
# %bb.1:
	lw	$1, 4($4)
	addiu	$2, $zero, 1
	bne	$1, $2, $BB30_3
	nop
$BB30_2:
	addiu	$2, $zero, 0
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
$BB30_3:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_isEscapingClosureAtFileLocation
$func_end30:
	.size	swift_isEscapingClosureAtFileLocation, $func_end30-swift_isEscapingClosureAtFileLocation
                                        # -- End function
	.protected	swift_getObjectType     # -- Begin function swift_getObjectType
	.weak	swift_getObjectType
	.p2align	2
	.type	swift_getObjectType,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_getObjectType
swift_getObjectType:                    # @swift_getObjectType
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$2, 0($4)
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_getObjectType
$func_end31:
	.size	swift_getObjectType, $func_end31-swift_getObjectType
                                        # -- End function
	.protected	swift_dynamicCastClass  # -- Begin function swift_dynamicCastClass
	.weak	swift_dynamicCastClass
	.p2align	2
	.type	swift_dynamicCastClass,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_dynamicCastClass
swift_dynamicCastClass:                 # @swift_dynamicCastClass
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$2, 0($4)
	nop
$BB32_1:                                # =>This Inner Loop Header: Depth=1
	beq	$2, $5, $BB32_4
	nop
# %bb.2:                                #   in Loop: Header=BB32_1 Depth=1
	lw	$2, 0($2)
	nop
	bnez	$2, $BB32_1
	nop
# %bb.3:
	addiu	$4, $zero, 0
$BB32_4:
	move	$2, $4
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_dynamicCastClass
$func_end32:
	.size	swift_dynamicCastClass, $func_end32-swift_dynamicCastClass
                                        # -- End function
	.protected	swift_dynamicCastClassUnconditional # -- Begin function swift_dynamicCastClassUnconditional
	.weak	swift_dynamicCastClassUnconditional
	.p2align	2
	.type	swift_dynamicCastClassUnconditional,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_dynamicCastClassUnconditional
swift_dynamicCastClassUnconditional:    # @swift_dynamicCastClassUnconditional
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$2, 0($4)
	nop
$BB33_1:                                # =>This Inner Loop Header: Depth=1
	beq	$2, $5, $BB33_4
	nop
# %bb.2:                                #   in Loop: Header=BB33_1 Depth=1
	lw	$2, 0($2)
	nop
	bnez	$2, $BB33_1
	nop
# %bb.3:
	break
$BB33_4:
	move	$2, $4
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_dynamicCastClassUnconditional
$func_end33:
	.size	swift_dynamicCastClassUnconditional, $func_end33-swift_dynamicCastClassUnconditional
                                        # -- End function
	.protected	swift_dynamicCast       # -- Begin function swift_dynamicCast
	.weak	swift_dynamicCast
	.p2align	2
	.type	swift_dynamicCast,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_dynamicCast
swift_dynamicCast:                      # @swift_dynamicCast
	.frame	$fp,48,$ra
	.mask 	0xc00f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -48
	sw	$ra, 44($sp)                    # 4-byte Folded Spill
	sw	$fp, 40($sp)                    # 4-byte Folded Spill
	sw	$19, 36($sp)                    # 4-byte Folded Spill
	sw	$18, 32($sp)                    # 4-byte Folded Spill
	sw	$17, 28($sp)                    # 4-byte Folded Spill
	sw	$16, 24($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	move	$16, $6
	move	$17, $5
	lw	$19, 64($fp)
	nop
	andi	$18, $19, 2
	srl	$1, $18, 1
	sw	$1, 16($sp)
	lw	$25, %call16($es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF)($gp)
	move	$5, $7
	move	$6, $17
	.reloc $tmp39, R_MIPS_JALR, $es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF
$tmp39:
	jalr	$25
	move	$7, $16
	andi	$3, $2, 255
	beqz	$3, $BB34_5
	nop
# %bb.1:
	addiu	$19, $zero, 1
	bne	$3, $19, $BB34_4
	addiu	$2, $zero, 1
# %bb.2:
	beqz	$18, $BB34_4
	addiu	$2, $zero, 1
$BB34_3:
	lw	$1, -4($16)
	nop
	lw	$25, 4($1)
	move	$4, $17
	jalr	$25
	move	$5, $16
	move	$2, $19
$BB34_4:
	move	$sp, $fp
	lw	$16, 24($sp)                    # 4-byte Folded Reload
	lw	$17, 28($sp)                    # 4-byte Folded Reload
	lw	$18, 32($sp)                    # 4-byte Folded Reload
	lw	$19, 36($sp)                    # 4-byte Folded Reload
	lw	$fp, 40($sp)                    # 4-byte Folded Reload
	lw	$ra, 44($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 48
$BB34_5:
	andi	$1, $19, 1
	bnez	$1, $BB34_8
	nop
# %bb.6:
	andi	$1, $19, 4
	addiu	$19, $zero, 0
	beqz	$1, $BB34_4
	addiu	$2, $zero, 0
# %bb.7:
	b	$BB34_3
	nop
$BB34_8:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_dynamicCast
$func_end34:
	.size	swift_dynamicCast, $func_end34-swift_dynamicCast
                                        # -- End function
	.hidden	$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF # -- Begin function $es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF
	.weak	$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF
	.p2align	2
	.type	$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF
$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF: # @"$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF"
	.frame	$fp,48,$ra
	.mask 	0xc03f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -48
	sw	$ra, 44($sp)                    # 4-byte Folded Spill
	sw	$fp, 40($sp)                    # 4-byte Folded Spill
	sw	$21, 36($sp)                    # 4-byte Folded Spill
	sw	$20, 32($sp)                    # 4-byte Folded Spill
	sw	$19, 28($sp)                    # 4-byte Folded Spill
	sw	$18, 24($sp)                    # 4-byte Folded Spill
	sw	$17, 20($sp)                    # 4-byte Folded Spill
	sw	$16, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$19, $2, $25
	move	$2, $7
	move	$18, $6
	move	$17, $5
	move	$16, $4
	lw	$21, 64($fp)
	beq	$2, $17, $BB35_4
	addiu	$20, $zero, 3
$BB35_1:                                # =>This Inner Loop Header: Depth=1
	lw	$25, %call16($es12MetadataKindO8metadataABSgSV_tcfC)($19)
	move	$4, $2
	.reloc $tmp40, R_MIPS_JALR, $es12MetadataKindO8metadataABSgSV_tcfC
$tmp40:
	jalr	$25
	move	$gp, $19
	andi	$3, $2, 255
	addiu	$1, $3, -4
	sltiu	$1, $1, 3
	bnez	$1, $BB35_6
	nop
# %bb.2:                                #   in Loop: Header=BB35_1 Depth=1
	beq	$3, $20, $BB35_8
	nop
# %bb.3:                                #   in Loop: Header=BB35_1 Depth=1
	lw	$25, %call16($es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF)($19)
	move	$4, $18
	move	$5, $2
	.reloc $tmp41, R_MIPS_JALR, $es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF
$tmp41:
	jalr	$25
	move	$gp, $19
	xor	$1, $18, $3
	sltiu	$1, $1, 1
	and	$21, $21, $1
	bne	$2, $17, $BB35_1
	move	$18, $3
$BB35_4:
	lw	$3, -4($2)
	andi	$1, $21, 1
	beqz	$1, $BB35_14
	nop
# %bb.5:
	lw	$25, 16($3)
	move	$4, $16
	move	$5, $18
	jalr	$25
	move	$6, $2
	b	$BB35_7
	addiu	$20, $zero, 2
$BB35_6:
	addiu	$20, $zero, 0
$BB35_7:
	move	$2, $20
	move	$sp, $fp
	lw	$16, 16($sp)                    # 4-byte Folded Reload
	lw	$17, 20($sp)                    # 4-byte Folded Reload
	lw	$18, 24($sp)                    # 4-byte Folded Reload
	lw	$19, 28($sp)                    # 4-byte Folded Reload
	lw	$20, 32($sp)                    # 4-byte Folded Reload
	lw	$21, 36($sp)                    # 4-byte Folded Reload
	lw	$fp, 40($sp)                    # 4-byte Folded Reload
	lw	$ra, 44($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 48
$BB35_8:
	lw	$25, %call16($es12MetadataKindO8metadataABSgSV_tcfC)($19)
	nop
	.reloc $tmp42, R_MIPS_JALR, $es12MetadataKindO8metadataABSgSV_tcfC
$tmp42:
	jalr	$25
	move	$4, $17
	andi	$1, $2, 255
	addiu	$3, $zero, 6
	beq	$1, $3, $BB35_7
	addiu	$20, $zero, 0
# %bb.9:
	lw	$25, %call16($es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ)($19)
	move	$4, $2
	addiu	$5, $zero, 3
	.reloc $tmp43, R_MIPS_JALR, $es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ
$tmp43:
	jalr	$25
	move	$gp, $19
	andi	$1, $2, 1
	beqz	$1, $BB35_7
	nop
# %bb.10:
	lw	$2, 0($18)
	nop
	lw	$3, 0($2)
	nop
$BB35_11:                               # =>This Inner Loop Header: Depth=1
	beq	$3, $17, $BB35_15
	nop
# %bb.12:                               #   in Loop: Header=BB35_11 Depth=1
	lw	$3, 0($3)
	nop
	beqz	$3, $BB35_7
	nop
# %bb.13:                               #   in Loop: Header=BB35_11 Depth=1
	b	$BB35_11
	nop
$BB35_14:
	lw	$25, 8($3)
	move	$4, $16
	move	$5, $18
	jalr	$25
	move	$6, $2
	b	$BB35_7
	addiu	$20, $zero, 1
$BB35_15:
	sw	$2, 0($16)
	andi	$1, $21, 1
	bnez	$1, $BB35_7
	addiu	$20, $zero, 2
# %bb.16:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$3, 4($2)
	nop
	and	$3, $3, $1
	beq	$3, $1, $BB35_7
	addiu	$20, $zero, 1
# %bb.17:
	addiu	$1, $2, 4
	addiu	$20, $zero, 1
$BB35_18:                               # =>This Inner Loop Header: Depth=1
	ll	$2, 0($1)
	addu	$3, $2, $20
	sc	$3, 0($1)
	beqz	$3, $BB35_18
	nop
# %bb.19:
	b	$BB35_7
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF
$func_end35:
	.size	$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF, $func_end35-$es7tryCast33_8BFEAB69C69C8B87ED137407D82370D4LL3dst0J8Metadata3src0lK013takeOnSuccesss07DynamicB6ResultABLLOSv_S3VSbtF
                                        # -- End function
	.hidden	$es12MetadataKindO8metadataABSgSV_tcfC # -- Begin function $es12MetadataKindO8metadataABSgSV_tcfC
	.weak	$es12MetadataKindO8metadataABSgSV_tcfC
	.p2align	2
	.type	$es12MetadataKindO8metadataABSgSV_tcfC,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es12MetadataKindO8metadataABSgSV_tcfC
$es12MetadataKindO8metadataABSgSV_tcfC: # @"$es12MetadataKindO8metadataABSgSV_tcfC"
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$2, 0($4)
	nop
	beqz	$2, $BB36_8
	nop
# %bb.1:
	addiu	$1, $zero, 512
	beq	$2, $1, $BB36_6
	nop
# %bb.2:
	addiu	$1, $zero, 513
	beq	$2, $1, $BB36_7
	nop
# %bb.3:
	addiu	$1, $zero, 771
	bne	$2, $1, $BB36_9
	nop
# %bb.4:
	lw	$2, 4($4)
	nop
	sltiu	$1, $2, 3
	bnez	$1, $BB36_11
	nop
# %bb.5:
	b	$BB36_10
	nop
$BB36_6:
	b	$BB36_11
	addiu	$2, $zero, 4
$BB36_7:
	b	$BB36_11
	addiu	$2, $zero, 5
$BB36_8:
	b	$BB36_11
	addiu	$2, $zero, 3
$BB36_9:
	sltiu	$1, $2, 2048
	beqz	$1, $BB36_11
	addiu	$2, $zero, 3
$BB36_10:
	addiu	$2, $zero, 6
$BB36_11:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	$es12MetadataKindO8metadataABSgSV_tcfC
$func_end36:
	.size	$es12MetadataKindO8metadataABSgSV_tcfC, $func_end36-$es12MetadataKindO8metadataABSgSV_tcfC
                                        # -- End function
	.hidden	$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ # -- Begin function $es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ
	.weak	$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ
	.p2align	2
	.type	$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ
$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ: # @"$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ"
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	andi	$2, $4, 255
	addiu	$3, $zero, 3
	beq	$2, $3, $BB37_7
	nop
# %bb.1:
	addiu	$3, $zero, 4
	beq	$2, $3, $BB37_5
	nop
# %bb.2:
	addiu	$3, $zero, 5
	bne	$2, $3, $BB37_9
	nop
# %bb.3:
	andi	$1, $5, 255
	beq	$1, $3, $BB37_11
	addiu	$2, $zero, 1
# %bb.4:
	b	$BB37_10
	nop
$BB37_5:
	andi	$1, $5, 255
	beq	$1, $3, $BB37_11
	addiu	$2, $zero, 1
# %bb.6:
	b	$BB37_10
	nop
$BB37_7:
	andi	$1, $5, 255
	beq	$1, $3, $BB37_11
	addiu	$2, $zero, 1
# %bb.8:
	b	$BB37_10
	nop
$BB37_9:
	addiu	$1, $5, -3
	andi	$1, $1, 255
	sltiu	$1, $1, 3
	beqz	$1, $BB37_12
	nop
$BB37_10:
	addiu	$2, $zero, 0
$BB37_11:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
$BB37_12:
	andi	$1, $5, 255
	xor	$1, $2, $1
	b	$BB37_11
	sltiu	$2, $1, 1
	.set	at
	.set	macro
	.set	reorder
	.end	$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ
$func_end37:
	.size	$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ, $func_end37-$es12MetadataKindO21__derived_enum_equalsySbAB_ABtFZ
                                        # -- End function
	.hidden	$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF # -- Begin function $es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF
	.weak	$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF
	.p2align	2
	.type	$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF
$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF: # @"$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF"
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	andi	$2, $5, 255
	beqz	$2, $BB38_3
	nop
# %bb.1:
	addiu	$1, $zero, 1
	bne	$2, $1, $BB38_5
	nop
# %bb.2:
	lw	$4, 0($4)
	nop
	lw	$2, 0($4)
	b	$BB38_6
	nop
$BB38_3:
	lw	$2, 12($4)
	nop
	lw	$1, -4($2)
	nop
	lw	$3, 40($1)
	lui	$1, 2
	and	$1, $3, $1
	beqz	$1, $BB38_6
	nop
# %bb.4:
	andi	$1, $3, 255
	not	$3, $1
	addiu	$1, $1, 8
	and	$1, $1, $3
	lw	$3, 0($4)
	b	$BB38_6
	addu	$4, $3, $1
$BB38_5:
	lw	$1, 0($4)
	nop
	lw	$2, 8($1)
	nop
	lw	$3, -4($2)
	nop
	lbu	$3, 40($3)
	nop
	not	$4, $3
	addiu	$3, $3, 16
	and	$3, $3, $4
	addu	$4, $1, $3
$BB38_6:
	move	$3, $4
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF
$func_end38:
	.size	$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF, $func_end38-$es29ExistentialTypeRepresentationO7projectySV8metadata_SV5valuetSVF
                                        # -- End function
	.protected	swift_once              # -- Begin function swift_once
	.weak	swift_once
	.p2align	2
	.type	swift_once,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_once
swift_once:                             # @swift_once
	.frame	$fp,32,$ra
	.mask 	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lw	$1, 0($4)
	nop
	bltz	$1, $BB39_8
	nop
# %bb.1:
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)                    # 4-byte Folded Spill
	sw	$fp, 24($sp)                    # 4-byte Folded Spill
	sw	$16, 20($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	move	$16, $4
	addiu	$1, $zero, 1
	addiu	$2, $zero, 0
$BB39_2:                                # =>This Inner Loop Header: Depth=1
	ll	$3, 0($16)
	bne	$3, $2, $BB39_4
	nop
# %bb.3:                                #   in Loop: Header=BB39_2 Depth=1
	move	$4, $1
	sc	$4, 0($16)
	beqz	$4, $BB39_2
	nop
$BB39_4:
	bnez	$3, $BB39_6
	nop
# %bb.5:
	move	$25, $5
	jalr	$25
	move	$4, $6
	addiu	$1, $zero, -1
	b	$BB39_7
	sw	$1, 0($16)
$BB39_6:                                # =>This Inner Loop Header: Depth=1
	lw	$1, 0($16)
	nop
	bgez	$1, $BB39_6
	nop
$BB39_7:
	move	$sp, $fp
	lw	$16, 20($sp)                    # 4-byte Folded Reload
	lw	$fp, 24($sp)                    # 4-byte Folded Reload
	lw	$ra, 28($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 32
$BB39_8:
	jr	$ra
	nop
	.set	at
	.set	macro
	.set	reorder
	.end	swift_once
$func_end39:
	.size	swift_once, $func_end39-swift_once
                                        # -- End function
	.protected	swift_coroFrameAlloc    # -- Begin function swift_coroFrameAlloc
	.weak	swift_coroFrameAlloc
	.p2align	2
	.type	swift_coroFrameAlloc,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_coroFrameAlloc
swift_coroFrameAlloc:                   # @swift_coroFrameAlloc
	.frame	$fp,40,$ra
	.mask 	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -40
	sw	$ra, 36($sp)                    # 4-byte Folded Spill
	sw	$fp, 32($sp)                    # 4-byte Folded Spill
	sw	$17, 28($sp)                    # 4-byte Folded Spill
	sw	$16, 24($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	move	$6, $4
	lw	$17, %got(__stack_chk_guard)($16)
	nop
	lw	$1, 0($17)
	nop
	sw	$1, 20($fp)
	sw	$zero, 16($fp)
	addiu	$4, $fp, 16
	lw	$25, %call16(posix_memalign)($16)
	addiu	$5, $zero, 16
	.reloc $tmp44, R_MIPS_JALR, posix_memalign
$tmp44:
	jalr	$25
	move	$gp, $16
	lw	$2, 16($fp)
	lw	$1, 0($17)
	lw	$3, 20($fp)
	nop
	bne	$1, $3, $BB40_2
	nop
# %bb.1:
	move	$sp, $fp
	lw	$16, 24($sp)                    # 4-byte Folded Reload
	lw	$17, 28($sp)                    # 4-byte Folded Reload
	lw	$fp, 32($sp)                    # 4-byte Folded Reload
	lw	$ra, 36($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 40
$BB40_2:
	lw	$25, %call16(__stack_chk_fail)($16)
	nop
	.reloc $tmp45, R_MIPS_JALR, __stack_chk_fail
$tmp45:
	jalr	$25
	move	$gp, $16
	.set	at
	.set	macro
	.set	reorder
	.end	swift_coroFrameAlloc
$func_end40:
	.size	swift_coroFrameAlloc, $func_end40-swift_coroFrameAlloc
                                        # -- End function
	.protected	swift_deletedMethodError # -- Begin function swift_deletedMethodError
	.weak	swift_deletedMethodError
	.p2align	2
	.type	swift_deletedMethodError,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deletedMethodError
swift_deletedMethodError:               # @swift_deletedMethodError
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deletedMethodError
$func_end41:
	.size	swift_deletedMethodError, $func_end41-swift_deletedMethodError
                                        # -- End function
	.protected	swift_allocError        # -- Begin function swift_allocError
	.weak	swift_allocError
	.p2align	2
	.type	swift_allocError,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_allocError
swift_allocError:                       # @swift_allocError
	.frame	$fp,64,$ra
	.mask 	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -64
	sw	$ra, 60($sp)                    # 4-byte Folded Spill
	sw	$fp, 56($sp)                    # 4-byte Folded Spill
	sw	$23, 52($sp)                    # 4-byte Folded Spill
	sw	$22, 48($sp)                    # 4-byte Folded Spill
	sw	$21, 44($sp)                    # 4-byte Folded Spill
	sw	$20, 40($sp)                    # 4-byte Folded Spill
	sw	$19, 36($sp)                    # 4-byte Folded Spill
	sw	$18, 32($sp)                    # 4-byte Folded Spill
	sw	$17, 28($sp)                    # 4-byte Folded Spill
	sw	$16, 24($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$20, $2, $25
	lw	$1, -4($4)
	nop
	lbu	$23, 40($1)
	nop
	not	$2, $23
	addiu	$3, $23, 16
	and	$22, $3, $2
	lw	$1, 32($1)
	nop
	addu	$21, $22, $1
	slt	$2, $21, $22
	slti	$1, $1, 0
	xor	$1, $1, $2
	bnez	$1, $BB42_8
	nop
# %bb.1:
	move	$16, $6
	move	$19, $5
	sw	$7, 20($fp)                     # 4-byte Folded Spill
	lw	$18, %got($es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp)($20)
	nop
	lbu	$1, 0($18)
	nop
	bnez	$1, $BB42_3
	move	$17, $4
# %bb.2:
	lw	$1, %got($es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp)($20)
	lw	$2, %got(_swift_embedded_error_destroy_impl)($20)
	nop
	sw	$2, 0($1)
	lw	$4, 4($1)
	sw	$zero, 4($1)
	lw	$1, %got(swift_releaseTm)($20)
	nop
	addiu	$25, $1, %lo(swift_releaseTm)
	.reloc $tmp46, R_MIPS_JALR, swift_releaseTm
$tmp46:
	jalr	$25
	nop
	addiu	$1, $zero, 1
	sb	$1, 0($18)
	lw	$1, %got(_swift_embedded_error_box_destroy)($20)
	nop
	addiu	$1, $1, %lo(_swift_embedded_error_box_destroy)
	lw	$2, %got(_swift_embedded_error_metadata_storage)($20)
	nop
	sw	$1, 4($2)
$BB42_3:
	ori	$6, $23, 3
	lw	$4, %got(_swift_embedded_error_metadata_storage)($20)
	lw	$25, %call16($es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF)($20)
	move	$5, $21
	.reloc $tmp47, R_MIPS_JALR, $es17swift_allocObject8metadata12requiredSize0E13AlignmentMaskSpys04HeapC0VGSpys13ClassMetadataVG_S2itF
$tmp47:
	jalr	$25
	move	$gp, $20
	move	$20, $2
	sw	$19, 12($2)
	sw	$17, 8($2)
	beqz	$16, $BB42_7
	addu	$19, $2, $22
# %bb.4:
	lw	$1, 20($fp)                     # 4-byte Folded Reload
	nop
	andi	$1, $1, 1
	bnez	$1, $BB42_6
	addiu	$2, $zero, 16
# %bb.5:
	addiu	$2, $zero, 8
$BB42_6:
	lw	$1, -4($17)
	nop
	addu	$1, $1, $2
	lw	$25, 0($1)
	move	$4, $19
	move	$5, $16
	jalr	$25
	move	$6, $17
$BB42_7:
	move	$2, $20
	move	$3, $19
	move	$sp, $fp
	lw	$16, 24($sp)                    # 4-byte Folded Reload
	lw	$17, 28($sp)                    # 4-byte Folded Reload
	lw	$18, 32($sp)                    # 4-byte Folded Reload
	lw	$19, 36($sp)                    # 4-byte Folded Reload
	lw	$20, 40($sp)                    # 4-byte Folded Reload
	lw	$21, 44($sp)                    # 4-byte Folded Reload
	lw	$22, 48($sp)                    # 4-byte Folded Reload
	lw	$23, 52($sp)                    # 4-byte Folded Reload
	lw	$fp, 56($sp)                    # 4-byte Folded Reload
	lw	$ra, 60($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 64
$BB42_8:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_allocError
$func_end42:
	.size	swift_allocError, $func_end42-swift_allocError
                                        # -- End function
	.hidden	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_ # -- Begin function $es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_
	.weak	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_
	.p2align	2
	.type	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_
$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_: # @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_"
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_
$func_end43:
	.size	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_, $func_end43-$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_
                                        # -- End function
	.hidden	_swift_embedded_error_destroy_impl # -- Begin function _swift_embedded_error_destroy_impl
	.weak	_swift_embedded_error_destroy_impl
	.p2align	2
	.type	_swift_embedded_error_destroy_impl,@function
	.set	nomicromips
	.set	nomips16
	.ent	_swift_embedded_error_destroy_impl
_swift_embedded_error_destroy_impl:     # @_swift_embedded_error_destroy_impl
	.frame	$fp,32,$ra
	.mask 	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)                    # 4-byte Folded Spill
	sw	$fp, 24($sp)                    # 4-byte Folded Spill
	sw	$17, 20($sp)                    # 4-byte Folded Spill
	sw	$16, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	move	$17, $4
	lw	$25, %call16($es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF)($16)
	nop
	.reloc $tmp48, R_MIPS_JALR, $es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF
$tmp48:
	jalr	$25
	move	$gp, $16
	lw	$1, -4($2)
	nop
	lw	$25, 4($1)
	nop
	jalr	$25
	move	$5, $2
	lw	$25, %call16(free)($16)
	move	$4, $17
	.reloc $tmp49, R_MIPS_JALR, free
$tmp49:
	jalr	$25
	move	$gp, $16
	move	$sp, $fp
	lw	$16, 16($sp)                    # 4-byte Folded Reload
	lw	$17, 20($sp)                    # 4-byte Folded Reload
	lw	$fp, 24($sp)                    # 4-byte Folded Reload
	lw	$ra, 28($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 32
	.set	at
	.set	macro
	.set	reorder
	.end	_swift_embedded_error_destroy_impl
$func_end44:
	.size	_swift_embedded_error_destroy_impl, $func_end44-_swift_embedded_error_destroy_impl
                                        # -- End function
	.hidden	$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF # -- Begin function $es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF
	.weak	$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF
	.p2align	2
	.type	$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF,@function
	.set	nomicromips
	.set	nomips16
	.ent	$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF
$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF: # @"$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF"
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$2, 8($4)
	nop
	lw	$1, -4($2)
	nop
	lbu	$1, 40($1)
	nop
	not	$3, $1
	addiu	$1, $1, 16
	and	$1, $1, $3
	addu	$1, $4, $1
	lw	$3, 12($4)
	move	$4, $1
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF
$func_end45:
	.size	$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF, $func_end45-$es17_errorBoxContentsySV4type_SV11conformanceSV5valuetSVF
                                        # -- End function
	.protected	swift_deallocError      # -- Begin function swift_deallocError
	.weak	swift_deallocError
	.p2align	2
	.type	swift_deallocError,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deallocError
swift_deallocError:                     # @swift_deallocError
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16(free)($gp)
	nop
	.reloc $tmp50, R_MIPS_JALR, free
$tmp50:
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deallocError
$func_end46:
	.size	swift_deallocError, $func_end46-swift_deallocError
                                        # -- End function
	.protected	swift_getErrorValue     # -- Begin function swift_getErrorValue
	.weak	swift_getErrorValue
	.p2align	2
	.type	swift_getErrorValue,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_getErrorValue
swift_getErrorValue:                    # @swift_getErrorValue
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	lw	$1, 8($4)
	nop
	lw	$2, -4($1)
	nop
	lbu	$2, 40($2)
	lw	$3, 12($4)
	nop
	sw	$3, 8($6)
	sw	$1, 4($6)
	not	$1, $2
	addiu	$2, $2, 16
	and	$1, $2, $1
	addu	$1, $4, $1
	sw	$1, 0($6)
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_getErrorValue
$func_end47:
	.size	swift_getErrorValue, $func_end47-swift_getErrorValue
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function swift_intToFloat32
$CPI48_0:
	.8byte	0x4330000000000000              # double 4503599627370496
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
$CPI48_1:
	.4byte	0x4f800000                      # float 4.2949673E+9
	.text
	.protected	swift_intToFloat32
	.weak	swift_intToFloat32
	.p2align	2
	.type	swift_intToFloat32,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_intToFloat32
swift_intToFloat32:                     # @swift_intToFloat32
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addu	$6, $2, $25
	sra	$2, $5, 8
	addiu	$1, $2, -1
	sltiu	$1, $1, 32
	beqz	$1, $BB48_2
	nop
# %bb.1:
	lw	$1, 0($4)
	nop
	mtc1	$1, $f0
	nop
	jr	$ra
	cvt.s.w	$f0, $f0
$BB48_2:
	slti	$1, $2, 33
	bnez	$1, $BB48_8
	nop
# %bb.3:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$1, $2, 31
	srl	$2, $1, 27
	addu	$1, $1, $2
	sra	$7, $1, 5
	addiu	$2, $7, -1
	lui	$3, 17200
	sw	$3, 12($fp)
	lw	$1, 0($4)
	nop
	sw	$1, 8($fp)
	lw	$1, %got($CPI48_0)($6)
	nop
	ldc1	$f2, %lo($CPI48_0)($1)
	ldc1	$f0, 8($fp)
	sub.d	$f0, $f0, $f2
	lw	$5, %got($CPI48_1)($6)
	addiu	$1, $zero, 1
	bne	$2, $1, $BB48_5
	cvt.s.d	$f0, $f0
# %bb.4:
	lwc1	$f4, %lo($CPI48_1)($5)
	b	$BB48_7
	nop
$BB48_5:
	lwc1	$f1, %lo($CPI48_1)($5)
	addiu	$5, $4, 4
	addiu	$6, $7, -2
	mov.s	$f5, $f1
$BB48_6:                                # =>This Inner Loop Header: Depth=1
	sw	$3, 4($fp)
	lw	$1, 0($5)
	nop
	sw	$1, 0($fp)
	ldc1	$f6, 0($fp)
	sub.d	$f6, $f6, $f2
	cvt.s.d	$f6, $f6
	mul.s	$f4, $f5, $f1
	mul.s	$f5, $f5, $f6
	add.s	$f0, $f0, $f5
	addiu	$5, $5, 4
	addiu	$6, $6, -1
	bnez	$6, $BB48_6
	mov.s	$f5, $f4
$BB48_7:
	sll	$1, $2, 2
	addu	$1, $4, $1
	lw	$1, 0($1)
	nop
	mtc1	$1, $f1
	nop
	cvt.s.w	$f1, $f1
	mul.s	$f1, $f4, $f1
	add.s	$f0, $f0, $f1
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
$BB48_8:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_intToFloat32
$func_end48:
	.size	swift_intToFloat32, $func_end48-swift_intToFloat32
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0                          # -- Begin function swift_intToFloat64
$CPI49_0:
	.8byte	0x4330000000000000              # double 4503599627370496
$CPI49_1:
	.8byte	0x41f0000000000000              # double 4294967296
	.text
	.protected	swift_intToFloat64
	.weak	swift_intToFloat64
	.p2align	2
	.type	swift_intToFloat64,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_intToFloat64
swift_intToFloat64:                     # @swift_intToFloat64
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addu	$6, $2, $25
	sra	$2, $5, 8
	addiu	$1, $2, -1
	sltiu	$1, $1, 32
	beqz	$1, $BB49_2
	nop
# %bb.1:
	lw	$1, 0($4)
	nop
	mtc1	$1, $f0
	jr	$ra
	cvt.d.w	$f0, $f0
$BB49_2:
	slti	$1, $2, 33
	bnez	$1, $BB49_8
	nop
# %bb.3:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addiu	$1, $2, 31
	srl	$2, $1, 27
	addu	$1, $1, $2
	sra	$7, $1, 5
	addiu	$2, $7, -1
	lui	$3, 17200
	sw	$3, 12($fp)
	lw	$1, 0($4)
	nop
	sw	$1, 8($fp)
	lw	$1, %got($CPI49_0)($6)
	nop
	ldc1	$f2, %lo($CPI49_0)($1)
	ldc1	$f0, 8($fp)
	lw	$5, %got($CPI49_1)($6)
	addiu	$1, $zero, 1
	bne	$2, $1, $BB49_5
	sub.d	$f0, $f0, $f2
# %bb.4:
	ldc1	$f6, %lo($CPI49_1)($5)
	b	$BB49_7
	nop
$BB49_5:
	ldc1	$f4, %lo($CPI49_1)($5)
	addiu	$5, $4, 4
	addiu	$6, $7, -2
	mov.d	$f8, $f4
$BB49_6:                                # =>This Inner Loop Header: Depth=1
	sw	$3, 4($fp)
	lw	$1, 0($5)
	nop
	sw	$1, 0($fp)
	ldc1	$f6, 0($fp)
	sub.d	$f10, $f6, $f2
	mul.d	$f6, $f8, $f4
	mul.d	$f8, $f8, $f10
	add.d	$f0, $f0, $f8
	addiu	$5, $5, 4
	addiu	$6, $6, -1
	bnez	$6, $BB49_6
	mov.d	$f8, $f6
$BB49_7:
	sll	$1, $2, 2
	addu	$1, $4, $1
	lw	$1, 0($1)
	nop
	mtc1	$1, $f2
	nop
	cvt.d.w	$f2, $f2
	mul.d	$f2, $f6, $f2
	add.d	$f0, $f0, $f2
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
$BB49_8:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_intToFloat64
$func_end49:
	.size	swift_intToFloat64, $func_end49-swift_intToFloat64
                                        # -- End function
	.section	.text._swift_exceptionPersonality,"axR",@progbits
	.protected	_swift_exceptionPersonality # -- Begin function _swift_exceptionPersonality
	.weak	_swift_exceptionPersonality
	.p2align	2
	.type	_swift_exceptionPersonality,@function
	.set	nomicromips
	.set	nomips16
	.ent	_swift_exceptionPersonality
_swift_exceptionPersonality:            # @_swift_exceptionPersonality
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	break
	.set	at
	.set	macro
	.set	reorder
	.end	_swift_exceptionPersonality
$func_end50:
	.size	_swift_exceptionPersonality, $func_end50-_swift_exceptionPersonality
                                        # -- End function
	.text
	.protected	swift_clearSensitive    # -- Begin function swift_clearSensitive
	.weak	swift_clearSensitive
	.p2align	2
	.type	swift_clearSensitive,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_clearSensitive
swift_clearSensitive:                   # @swift_clearSensitive
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	bltz	$5, $BB51_4
	addu	$gp, $2, $25
# %bb.1:
	beqz	$5, $BB51_3
	move	$6, $5
# %bb.2:
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	lw	$25, %call16(memset)($gp)
	nop
	.reloc $tmp51, R_MIPS_JALR, memset
$tmp51:
	jalr	$25
	addiu	$5, $zero, 0
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	addiu	$sp, $sp, 24
$BB51_3:
	jr	$ra
	nop
$BB51_4:
	break
	.set	at
	.set	macro
	.set	reorder
	.end	swift_clearSensitive
$func_end51:
	.size	swift_clearSensitive, $func_end51-swift_clearSensitive
                                        # -- End function
	.protected	swift_retainCount       # -- Begin function swift_retainCount
	.weak	swift_retainCount
	.p2align	2
	.type	swift_retainCount,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_retainCount
swift_retainCount:                      # @swift_retainCount
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	beqz	$4, $BB52_2
	nop
# %bb.1:
	lui	$1, 32767
	ori	$1, $1, 65535
	lw	$2, 4($4)
	b	$BB52_3
	and	$2, $2, $1
$BB52_2:
	addiu	$2, $zero, 0
$BB52_3:
	move	$sp, $fp
	lw	$fp, 0($sp)                     # 4-byte Folded Reload
	lw	$ra, 4($sp)                     # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 8
	.set	at
	.set	macro
	.set	reorder
	.end	swift_retainCount
$func_end52:
	.size	swift_retainCount, $func_end52-swift_retainCount
                                        # -- End function
	.p2align	2                               # -- Begin function 
	.type	$__unnamed_6,@function
	.set	nomicromips
	.set	nomips16
	.ent	$__unnamed_6
$__unnamed_6:                           # @5
	.frame	$fp,8,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	addiu	$sp, $sp, -8
	sw	$ra, 4($sp)                     # 4-byte Folded Spill
	sw	$fp, 0($sp)                     # 4-byte Folded Spill
	move	$fp, $sp
	break
	.set	at
	.set	macro
	.set	reorder
	.end	$__unnamed_6
$func_end53:
	.size	$__unnamed_6, $func_end53-$__unnamed_6
                                        # -- End function
	.p2align	2                               # -- Begin function _swift_embedded_error_box_destroy
	.type	_swift_embedded_error_box_destroy,@function
	.set	nomicromips
	.set	nomips16
	.ent	_swift_embedded_error_box_destroy
_swift_embedded_error_box_destroy:      # @_swift_embedded_error_box_destroy
	.frame	$fp,32,$ra
	.mask 	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -32
	sw	$ra, 28($sp)                    # 4-byte Folded Spill
	sw	$fp, 24($sp)                    # 4-byte Folded Spill
	sw	$17, 20($sp)                    # 4-byte Folded Spill
	sw	$16, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$16, $2, $25
	move	$17, $4
	lw	$5, 8($4)
	nop
	lw	$1, -4($5)
	nop
	lbu	$2, 40($1)
	nop
	not	$3, $2
	addiu	$2, $2, 16
	and	$2, $2, $3
	lw	$25, 4($1)
	nop
	jalr	$25
	addu	$4, $4, $2
	lw	$25, %call16(free)($16)
	move	$4, $17
	.reloc $tmp52, R_MIPS_JALR, free
$tmp52:
	jalr	$25
	move	$gp, $16
	move	$sp, $fp
	lw	$16, 16($sp)                    # 4-byte Folded Reload
	lw	$17, 20($sp)                    # 4-byte Folded Reload
	lw	$fp, 24($sp)                    # 4-byte Folded Reload
	lw	$ra, 28($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 32
	.set	at
	.set	macro
	.set	reorder
	.end	_swift_embedded_error_box_destroy
$func_end54:
	.size	_swift_embedded_error_box_destroy, $func_end54-_swift_embedded_error_box_destroy
                                        # -- End function
	.protected	swift_retain            # -- Begin function swift_retain
	.weak	swift_retain
	.p2align	2
	.type	swift_retain,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_retain
swift_retain:                           # @swift_retain
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_4)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_retain
$func_end55:
	.size	swift_retain, $func_end55-swift_retain
                                        # -- End function
	.protected	swift_nonatomic_retain  # -- Begin function swift_nonatomic_retain
	.weak	swift_nonatomic_retain
	.p2align	2
	.type	swift_nonatomic_retain,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_nonatomic_retain
swift_nonatomic_retain:                 # @swift_nonatomic_retain
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_4)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_nonatomic_retain
$func_end56:
	.size	swift_nonatomic_retain, $func_end56-swift_nonatomic_retain
                                        # -- End function
	.protected	swift_bridgeObjectRetain # -- Begin function swift_bridgeObjectRetain
	.weak	swift_bridgeObjectRetain
	.p2align	2
	.type	swift_bridgeObjectRetain,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_bridgeObjectRetain
swift_bridgeObjectRetain:               # @swift_bridgeObjectRetain
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_4)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_bridgeObjectRetain
$func_end57:
	.size	swift_bridgeObjectRetain, $func_end57-swift_bridgeObjectRetain
                                        # -- End function
	.protected	swift_errorRetain       # -- Begin function swift_errorRetain
	.weak	swift_errorRetain
	.p2align	2
	.type	swift_errorRetain,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_errorRetain
swift_errorRetain:                      # @swift_errorRetain
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_4)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_errorRetain
$func_end58:
	.size	swift_errorRetain, $func_end58-swift_errorRetain
                                        # -- End function
	.protected	swift_retain_n          # -- Begin function swift_retain_n
	.weak	swift_retain_n
	.p2align	2
	.type	swift_retain_n,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_retain_n
swift_retain_n:                         # @swift_retain_n
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_2)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_retain_n
$func_end59:
	.size	swift_retain_n, $func_end59-swift_retain_n
                                        # -- End function
	.protected	swift_nonatomic_retain_n # -- Begin function swift_nonatomic_retain_n
	.weak	swift_nonatomic_retain_n
	.p2align	2
	.type	swift_nonatomic_retain_n,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_nonatomic_retain_n
swift_nonatomic_retain_n:               # @swift_nonatomic_retain_n
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_2)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_nonatomic_retain_n
$func_end60:
	.size	swift_nonatomic_retain_n, $func_end60-swift_nonatomic_retain_n
                                        # -- End function
	.protected	swift_bridgeObjectRetain_n # -- Begin function swift_bridgeObjectRetain_n
	.weak	swift_bridgeObjectRetain_n
	.p2align	2
	.type	swift_bridgeObjectRetain_n,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_bridgeObjectRetain_n
swift_bridgeObjectRetain_n:             # @swift_bridgeObjectRetain_n
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_2)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_bridgeObjectRetain_n
$func_end61:
	.size	swift_bridgeObjectRetain_n, $func_end61-swift_bridgeObjectRetain_n
                                        # -- End function
	.protected	swift_nonatomic_release_n # -- Begin function swift_nonatomic_release_n
	.weak	swift_nonatomic_release_n
	.p2align	2
	.type	swift_nonatomic_release_n,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_nonatomic_release_n
swift_nonatomic_release_n:              # @swift_nonatomic_release_n
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_3)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_nonatomic_release_n
$func_end62:
	.size	swift_nonatomic_release_n, $func_end62-swift_nonatomic_release_n
                                        # -- End function
	.protected	swift_bridgeObjectRelease_n # -- Begin function swift_bridgeObjectRelease_n
	.weak	swift_bridgeObjectRelease_n
	.p2align	2
	.type	swift_bridgeObjectRelease_n,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_bridgeObjectRelease_n
swift_bridgeObjectRelease_n:            # @swift_bridgeObjectRelease_n
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_3)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_bridgeObjectRelease_n
$func_end63:
	.size	swift_bridgeObjectRelease_n, $func_end63-swift_bridgeObjectRelease_n
                                        # -- End function
	.protected	swift_errorInMain       # -- Begin function swift_errorInMain
	.weak	swift_errorInMain
	.p2align	2
	.type	swift_errorInMain,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_errorInMain
swift_errorInMain:                      # @swift_errorInMain
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_6)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_errorInMain
$func_end64:
	.size	swift_errorInMain, $func_end64-swift_errorInMain
                                        # -- End function
	.section	.text._swift_fatalError,"axR",@progbits
	.protected	_swift_fatalError       # -- Begin function _swift_fatalError
	.weak	_swift_fatalError
	.p2align	2
	.type	_swift_fatalError,@function
	.set	nomicromips
	.set	nomips16
	.ent	_swift_fatalError
_swift_fatalError:                      # @_swift_fatalError
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_6)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	_swift_fatalError
$func_end65:
	.size	_swift_fatalError, $func_end65-_swift_fatalError
                                        # -- End function
	.text
	.protected	swift_deallocUninitializedObject # -- Begin function swift_deallocUninitializedObject
	.weak	swift_deallocUninitializedObject
	.p2align	2
	.type	swift_deallocUninitializedObject,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deallocUninitializedObject
swift_deallocUninitializedObject:       # @swift_deallocUninitializedObject
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_1)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deallocUninitializedObject
$func_end66:
	.size	swift_deallocUninitializedObject, $func_end66-swift_deallocUninitializedObject
                                        # -- End function
	.protected	swift_deallocObject     # -- Begin function swift_deallocObject
	.weak	swift_deallocObject
	.p2align	2
	.type	swift_deallocObject,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_deallocObject
swift_deallocObject:                    # @swift_deallocObject
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_1)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_deallocObject
$func_end67:
	.size	swift_deallocObject, $func_end67-swift_deallocObject
                                        # -- End function
	.protected	swift_slowDealloc       # -- Begin function swift_slowDealloc
	.weak	swift_slowDealloc
	.p2align	2
	.type	swift_slowDealloc,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_slowDealloc
swift_slowDealloc:                      # @swift_slowDealloc
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_1)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_slowDealloc
$func_end68:
	.size	swift_slowDealloc, $func_end68-swift_slowDealloc
                                        # -- End function
	.protected	swift_release           # -- Begin function swift_release
	.weak	swift_release
	.p2align	2
	.type	swift_release,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_release
swift_release:                          # @swift_release
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_5)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_release
$func_end69:
	.size	swift_release, $func_end69-swift_release
                                        # -- End function
	.protected	swift_nonatomic_release # -- Begin function swift_nonatomic_release
	.weak	swift_nonatomic_release
	.p2align	2
	.type	swift_nonatomic_release,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_nonatomic_release
swift_nonatomic_release:                # @swift_nonatomic_release
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_5)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_nonatomic_release
$func_end70:
	.size	swift_nonatomic_release, $func_end70-swift_nonatomic_release
                                        # -- End function
	.protected	swift_errorRelease      # -- Begin function swift_errorRelease
	.weak	swift_errorRelease
	.p2align	2
	.type	swift_errorRelease,@function
	.set	nomicromips
	.set	nomips16
	.ent	swift_errorRelease
swift_errorRelease:                     # @swift_errorRelease
	.frame	$fp,24,$ra
	.mask 	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# %bb.0:
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -24
	sw	$ra, 20($sp)                    # 4-byte Folded Spill
	sw	$fp, 16($sp)                    # 4-byte Folded Spill
	move	$fp, $sp
	addu	$gp, $2, $25
	lw	$25, %call16($__unnamed_5)($gp)
	nop
	jalr	$25
	nop
	move	$sp, $fp
	lw	$fp, 16($sp)                    # 4-byte Folded Reload
	lw	$ra, 20($sp)                    # 4-byte Folded Reload
	nop
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	swift_errorRelease
$func_end71:
	.size	swift_errorRelease, $func_end71-swift_errorRelease
                                        # -- End function
	.protected	$e8HelloPS14dispSo7DISPENVV_ADtvp # @"$e8HelloPS14dispSo7DISPENVV_ADtvp"
	.type	$e8HelloPS14dispSo7DISPENVV_ADtvp,@object
	.bss
	.globl	$e8HelloPS14dispSo7DISPENVV_ADtvp
	.p2align	1, 0x0
$e8HelloPS14dispSo7DISPENVV_ADtvp:
	.space	40
	.size	$e8HelloPS14dispSo7DISPENVV_ADtvp, 40

	.protected	$e8HelloPS14drawSo7DRAWENVV_ADtvp # @"$e8HelloPS14drawSo7DRAWENVV_ADtvp"
	.type	$e8HelloPS14drawSo7DRAWENVV_ADtvp,@object
	.globl	$e8HelloPS14drawSo7DRAWENVV_ADtvp
	.p2align	2, 0x0
$e8HelloPS14drawSo7DRAWENVV_ADtvp:
	.space	184
	.size	$e8HelloPS14drawSo7DRAWENVV_ADtvp, 184

	.protected	$e8HelloPS12dbs5Int32Vvp # @"$e8HelloPS12dbs5Int32Vvp"
	.type	$e8HelloPS12dbs5Int32Vvp,@object
	.globl	$e8HelloPS12dbs5Int32Vvp
	.p2align	2, 0x0
$e8HelloPS12dbs5Int32Vvp:
	.space	4
	.size	$e8HelloPS12dbs5Int32Vvp, 4

	.protected	$es16_emptyBoxStorageSi_Sitvp # @"$es16_emptyBoxStorageSi_Sitvp"
	.type	$es16_emptyBoxStorageSi_Sitvp,@object
	.data
	.weak	$es16_emptyBoxStorageSi_Sitvp
	.p2align	2, 0x0
$es16_emptyBoxStorageSi_Sitvp:
	.space	4
	.4byte	4294967295                      # 0xffffffff
	.size	$es16_emptyBoxStorageSi_Sitvp, 8

	.protected	_swift_embedded_error_metadata_storage # @_swift_embedded_error_metadata_storage
	.type	_swift_embedded_error_metadata_storage,@object
	.bss
	.weak	_swift_embedded_error_metadata_storage
	.p2align	2, 0x0
_swift_embedded_error_metadata_storage:
	.space	12
	.size	_swift_embedded_error_metadata_storage, 12

	.protected	$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp # @"$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp"
	.type	$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp,@object
	.weak	$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp
$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp:
	.space	1
	.size	$es25_errorMetadataInitialized33_21ED9D60359C2E63A6128CFAED697BD0LLSbvp, 1

	.protected	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp # @"$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp"
	.type	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp,@object
	.data
	.weak	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp
	.p2align	2, 0x0
$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp:
	.4byte	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvpfiyBpcfU_
	.4byte	0
	.size	$es23_errorBoxDestroyImplRef33_21ED9D60359C2E63A6128CFAED697BD0LLyyBpcvp, 8

	.type	$_swift1_autolink_entries,@object # @_swift1_autolink_entries
	.section	.swift1_autolink_entries,"eR",@progbits,unique,1
	.p2align	2, 0x0
$_swift1_autolink_entries:
	.size	$_swift1_autolink_entries, 0

	.section	".linker-options","e",@llvm_linker_options
	.section	".note.GNU-stack","",@progbits
	.text

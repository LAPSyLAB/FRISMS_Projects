	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"CPUInit.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	CPU_Init
	.type	CPU_Init, %function
CPU_Init:
.LFB0:
	.file 1 "C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\CPUInit.c"
	.loc 1 6 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 15 0
	ldr	r3, .L18
	mvn	r2, #0
	str	r3, [r2, #-991]
.L2:
	.loc 1 17 0 discriminator 1
	ldr	r3, [r2, #-919]
	tst	r3, #1
	mvn	r3, #0
	beq	.L2
	.loc 1 19 0
	mov	r2, #1
	str	r2, [r3, #-975]
	.loc 1 25 0
	ldr	r2, .L18+4
	str	r2, [r3, #-983]
	.loc 1 31 0
	mov	r1, r3
.L3:
	.loc 1 31 0 is_stmt 0 discriminator 1
	ldr	r3, [r1, #-919]
	tst	r3, #2
	mvn	r2, #0
	beq	.L3
	.loc 1 40 0 is_stmt 1
	ldr	r3, .L18+8
	str	r3, [r2, #-975]
.L4:
	.loc 1 42 0 discriminator 1
	ldr	r3, [r2, #-919]
	tst	r3, #8
	beq	.L4
	.loc 1 44 0
	bx	lr
.L19:
	.align	2
.L18:
	.word	2049
	.word	545046284
	.word	258
	.cfi_endproc
.LFE0:
	.size	CPU_Init, .-CPU_Init
.Letext0:
	.file 2 "C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\AT91SAM9260.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x23b
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x1
	.4byte	.LASF31
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF6
	.byte	0x2
	.byte	0x36
	.4byte	0x2c
	.uleb128 0x3
	.4byte	0x31
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	0x21
	.4byte	0x4f
	.uleb128 0x6
	.4byte	0x38
	.byte	0x7
	.byte	0
	.uleb128 0x5
	.4byte	0x21
	.4byte	0x5f
	.uleb128 0x6
	.4byte	0x38
	.byte	0x2
	.byte	0
	.uleb128 0x5
	.4byte	0x21
	.4byte	0x6f
	.uleb128 0x6
	.4byte	0x38
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF8
	.byte	0x10
	.byte	0x2
	.2byte	0x3bc
	.4byte	0xb9
	.uleb128 0x8
	.4byte	.LASF2
	.byte	0x2
	.2byte	0x3bd
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.4byte	.LASF3
	.byte	0x2
	.2byte	0x3be
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.4byte	.LASF4
	.byte	0x2
	.2byte	0x3bf
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.4byte	.LASF5
	.byte	0x2
	.2byte	0x3c0
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x3c1
	.4byte	0xc5
	.uleb128 0xa
	.byte	0x4
	.4byte	0x6f
	.uleb128 0x7
	.4byte	.LASF9
	.byte	0x70
	.byte	0x2
	.2byte	0x3e9
	.4byte	0x1f6
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x3ea
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x3eb
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x2
	.2byte	0x3ec
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x2
	.2byte	0x3ed
	.4byte	0x1f6
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x3ee
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x3ef
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x3f0
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x3f1
	.4byte	0x1fb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x3f2
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x3f3
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x3f4
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x3f5
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x3f6
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x3f7
	.4byte	0x200
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x3f8
	.4byte	0x205
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x3f9
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x3fa
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x3fb
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x3fc
	.4byte	0x21
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x3
	.4byte	0x5f
	.uleb128 0x3
	.4byte	0x5f
	.uleb128 0x3
	.4byte	0x4f
	.uleb128 0x3
	.4byte	0x3f
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x3fd
	.4byte	0x216
	.uleb128 0xa
	.byte	0x4
	.4byte	0xcb
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF32
	.byte	0x1
	.byte	0x5
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.uleb128 0xc
	.4byte	.LASF33
	.byte	0x1
	.byte	0x7
	.4byte	0x20a
	.sleb128 -1024
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF4:
	.ascii	"CKGR_PLLAR\000"
.LASF24:
	.ascii	"PMC_PCKR\000"
.LASF20:
	.ascii	"PMC_PLLAR\000"
.LASF18:
	.ascii	"PMC_MOR\000"
.LASF7:
	.ascii	"AT91PS_CKGR\000"
.LASF2:
	.ascii	"CKGR_MOR\000"
.LASF16:
	.ascii	"PMC_PCSR\000"
.LASF33:
	.ascii	"pPmc\000"
.LASF6:
	.ascii	"AT91_REG\000"
.LASF29:
	.ascii	"AT91PS_PMC\000"
.LASF3:
	.ascii	"CKGR_MCFR\000"
.LASF15:
	.ascii	"PMC_PCDR\000"
.LASF22:
	.ascii	"PMC_MCKR\000"
.LASF10:
	.ascii	"PMC_SCER\000"
.LASF25:
	.ascii	"PMC_IER\000"
.LASF5:
	.ascii	"CKGR_PLLBR\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF30:
	.ascii	"GNU C 4.7.4 20130613 (release) [ARM/embedded-4_7-br"
	.ascii	"anch revision 200083]\000"
.LASF13:
	.ascii	"Reserved0\000"
.LASF17:
	.ascii	"Reserved1\000"
.LASF23:
	.ascii	"Reserved2\000"
.LASF21:
	.ascii	"PMC_PLLBR\000"
.LASF1:
	.ascii	"sizetype\000"
.LASF9:
	.ascii	"_AT91S_PMC\000"
.LASF28:
	.ascii	"PMC_IMR\000"
.LASF19:
	.ascii	"PMC_MCFR\000"
.LASF31:
	.ascii	"C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\"
	.ascii	"CPUInit.c\000"
.LASF27:
	.ascii	"PMC_SR\000"
.LASF14:
	.ascii	"PMC_PCER\000"
.LASF8:
	.ascii	"_AT91S_CKGR\000"
.LASF12:
	.ascii	"PMC_SCSR\000"
.LASF32:
	.ascii	"CPU_Init\000"
.LASF11:
	.ascii	"PMC_SCDR\000"
.LASF26:
	.ascii	"PMC_IDR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.7.4 20130613 (release) [ARM/embedded-4_7-branch revision 200083]"

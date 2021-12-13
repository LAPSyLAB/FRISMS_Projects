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
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	initPIO_Port
	.type	initPIO_Port, %function
initPIO_Port:
.LFB0:
	.file 1 "C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\main.c"
	.loc 1 12 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL0:
	.loc 1 13 0
	mov	r3, #2
	str	r3, [r0, #0]
	.loc 1 14 0
	str	r3, [r0, #16]
	bx	lr
	.cfi_endproc
.LFE0:
	.size	initPIO_Port, .-initPIO_Port
	.align	2
	.global	LED_On
	.type	LED_On, %function
LED_On:
.LFB1:
	.loc 1 18 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL1:
	.loc 1 19 0
	mov	r3, #2
	str	r3, [r0, #52]
	bx	lr
	.cfi_endproc
.LFE1:
	.size	LED_On, .-LED_On
	.align	2
	.global	LED_Off
	.type	LED_Off, %function
LED_Off:
.LFB2:
	.loc 1 23 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL2:
	.loc 1 24 0
	mov	r3, #2
	str	r3, [r0, #48]
	bx	lr
	.cfi_endproc
.LFE2:
	.size	LED_Off, .-LED_Off
	.align	2
	.global	Delay
	.type	Delay, %function
Delay:
.LFB3:
	.loc 1 27 0
	.cfi_startproc
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LVL3:
	sub	sp, sp, #16
.LCFI0:
	.cfi_def_cfa_offset 16
	.loc 1 30 0
	mov	r1, #0
	str	r1, [sp, #4]
.LVL4:
	ldr	r3, [sp, #4]
	cmp	r0, r3
	bls	.L4
	.loc 1 31 0
	ldr	r2, .L14
.LVL5:
.L9:
	str	r1, [sp, #8]
	ldr	r3, [sp, #8]
	cmp	r3, r2
	bhi	.L8
.L10:
	.loc 1 32 0
	ldr	r3, [sp, #8]
.LVL6:
	str	r3, [sp, #12]
	.loc 1 31 0
	ldr	r3, [sp, #8]
.LVL7:
	add	r3, r3, #1
.LVL8:
	str	r3, [sp, #8]
.LVL9:
	ldr	r3, [sp, #8]
.LVL10:
	cmp	r3, r2
	bls	.L10
.L8:
	.loc 1 30 0
	ldr	r3, [sp, #4]
	add	r3, r3, #1
.LVL11:
	str	r3, [sp, #4]
.LVL12:
	ldr	r3, [sp, #4]
.LVL13:
	cmp	r3, r0
	bcc	.L9
.L4:
	.loc 1 35 0
	add	sp, sp, #16
	bx	lr
.L15:
	.align	2
.L14:
	.word	47999
	.cfi_endproc
.LFE3:
	.size	Delay, .-Delay
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
.LFB4:
	.loc 1 40 0
	.cfi_startproc
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LVL14:
.LBB8:
.LBB9:
	.loc 1 13 0
	mvn	r5, #0
	mov	r4, #2
.LBE9:
.LBE8:
	.loc 1 40 0
	stmfd	sp!, {r3, lr}
.LCFI1:
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
.LBB11:
.LBB10:
	.loc 1 13 0
	str	r4, [r5, #-2047]
	.loc 1 14 0
	str	r4, [r5, #-2031]
.L17:
.LBE10:
.LBE11:
	.loc 1 45 0 discriminator 1
	mov	r0, #30
	bl	Delay
.LVL15:
	.loc 1 47 0 discriminator 1
	mov	r0, #30
.LBB12:
.LBB13:
	.loc 1 19 0 discriminator 1
	str	r4, [r5, #-1995]
.LBE13:
.LBE12:
	.loc 1 47 0 discriminator 1
	bl	Delay
.LVL16:
.LBB14:
.LBB15:
	.loc 1 24 0 discriminator 1
	str	r4, [r5, #-1999]
	b	.L17
.LBE15:
.LBE14:
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.global	dummy
	.data
	.align	2
	.type	dummy, %object
	.size	dummy, 4
dummy:
	.word	1
	.text
.Letext0:
	.file 2 "C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\AT91SAM9260.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x461
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x1
	.4byte	.LASF45
	.4byte	.Ldebug_ranges0+0x18
	.4byte	0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0x2
	.byte	0x36
	.4byte	0x30
	.uleb128 0x3
	.4byte	0x35
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x4
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x5
	.4byte	0x25
	.4byte	0x53
	.uleb128 0x6
	.4byte	0x3c
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	0x25
	.4byte	0x63
	.uleb128 0x6
	.4byte	0x3c
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.4byte	.LASF46
	.byte	0xac
	.byte	0x2
	.2byte	0x392
	.4byte	0x281
	.uleb128 0x8
	.4byte	.LASF2
	.byte	0x2
	.2byte	0x393
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.4byte	.LASF3
	.byte	0x2
	.2byte	0x394
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.4byte	.LASF4
	.byte	0x2
	.2byte	0x395
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.4byte	.LASF5
	.byte	0x2
	.2byte	0x396
	.4byte	0x281
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.4byte	.LASF6
	.byte	0x2
	.2byte	0x397
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x2
	.2byte	0x398
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x2
	.2byte	0x399
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x2
	.2byte	0x39a
	.4byte	0x286
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x2
	.2byte	0x39b
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.2byte	0x39c
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x2
	.2byte	0x39d
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.4byte	.LASF13
	.byte	0x2
	.2byte	0x39e
	.4byte	0x28b
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x2
	.2byte	0x39f
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x2
	.2byte	0x3a0
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x2
	.2byte	0x3a1
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x2
	.2byte	0x3a2
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.4byte	.LASF18
	.byte	0x2
	.2byte	0x3a3
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x2
	.2byte	0x3a4
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x2
	.2byte	0x3a5
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x2
	.2byte	0x3a6
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x2
	.2byte	0x3a7
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x2
	.2byte	0x3a8
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x2
	.2byte	0x3a9
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x2
	.2byte	0x3aa
	.4byte	0x290
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x2
	.2byte	0x3ab
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x2
	.2byte	0x3ac
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x2
	.2byte	0x3ad
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x8
	.4byte	.LASF29
	.byte	0x2
	.2byte	0x3ae
	.4byte	0x295
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x2
	.2byte	0x3af
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x2
	.2byte	0x3b0
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x2
	.2byte	0x3b1
	.4byte	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x2
	.2byte	0x3b2
	.4byte	0x29a
	.byte	0x2
	.byte	0x23
	.uleb128 0x7c
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x2
	.2byte	0x3b3
	.4byte	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x2
	.2byte	0x3b4
	.4byte	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0xa4
	.uleb128 0x8
	.4byte	.LASF36
	.byte	0x2
	.2byte	0x3b5
	.4byte	0x25
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.byte	0
	.uleb128 0x3
	.4byte	0x43
	.uleb128 0x3
	.4byte	0x43
	.uleb128 0x3
	.4byte	0x43
	.uleb128 0x3
	.4byte	0x43
	.uleb128 0x3
	.4byte	0x43
	.uleb128 0x3
	.4byte	0x53
	.uleb128 0x9
	.4byte	.LASF38
	.byte	0x2
	.2byte	0x3b6
	.4byte	0x63
	.uleb128 0x9
	.4byte	.LASF39
	.byte	0x2
	.2byte	0x3b6
	.4byte	0x2b7
	.uleb128 0xa
	.byte	0x4
	.4byte	0x63
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF40
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.byte	0x1
	.4byte	0x2d7
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x1
	.byte	0xb
	.4byte	0x2d7
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.4byte	0x29f
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF41
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x1
	.4byte	0x2f7
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x1
	.byte	0x11
	.4byte	0x2ab
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF43
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.4byte	0x311
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x1
	.byte	0x16
	.4byte	0x2ab
	.byte	0
	.uleb128 0xd
	.4byte	0x2bd
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0x32e
	.uleb128 0xe
	.4byte	0x2cb
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0xd
	.4byte	0x2dd
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0x34b
	.uleb128 0xe
	.4byte	0x2eb
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0xd
	.4byte	0x2f7
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0x368
	.uleb128 0xe
	.4byte	0x305
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.4byte	.LASF47
	.byte	0x1
	.byte	0x1b
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x3b9
	.uleb128 0x10
	.4byte	.LASF48
	.byte	0x1
	.byte	0x1b
	.4byte	0x35
	.byte	0x1
	.byte	0x50
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x30
	.4byte	.LLST1
	.uleb128 0x11
	.ascii	"j\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x30
	.4byte	.LLST2
	.uleb128 0x11
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x1c
	.4byte	0x30
	.4byte	.LLST3
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF49
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.4byte	0x44b
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LLST4
	.byte	0x1
	.4byte	0x44b
	.uleb128 0x13
	.4byte	0x2bd
	.4byte	.LBB8
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x29
	.4byte	0x3f2
	.uleb128 0x14
	.4byte	0x2cb
	.sleb128 -2048
	.byte	0
	.uleb128 0x15
	.4byte	0x2dd
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0x1
	.byte	0x2e
	.4byte	0x40d
	.uleb128 0x14
	.4byte	0x2eb
	.sleb128 -2048
	.byte	0
	.uleb128 0x15
	.4byte	0x2f7
	.4byte	.LBB14
	.4byte	.LBE14
	.byte	0x1
	.byte	0x30
	.4byte	0x428
	.uleb128 0x14
	.4byte	0x305
	.sleb128 -2048
	.byte	0
	.uleb128 0x16
	.4byte	.LVL15
	.4byte	0x368
	.4byte	0x43b
	.uleb128 0x17
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.byte	0x4e
	.byte	0
	.uleb128 0x18
	.4byte	.LVL16
	.4byte	0x368
	.uleb128 0x17
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.byte	0x4e
	.byte	0
	.byte	0
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x1a
	.4byte	.LASF50
	.byte	0x1
	.byte	0x5
	.4byte	0x44b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	dummy
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
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
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
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB3
	.4byte	.LCFI0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0
	.4byte	.LFE3
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL4
	.4byte	.LVL11
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL13
	.4byte	.LFE3
	.2byte	0x2
	.byte	0x91
	.sleb128 -20
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL5
	.4byte	.LVL8
	.2byte	0x2
	.byte	0x91
	.sleb128 -16
	.4byte	.LVL9
	.4byte	.LVL10
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL10
	.4byte	.LFE3
	.2byte	0x2
	.byte	0x91
	.sleb128 -16
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x91
	.sleb128 -12
	.4byte	.LVL6
	.4byte	.LVL7
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL7
	.4byte	.LFE3
	.2byte	0x2
	.byte	0x91
	.sleb128 -12
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LFB4
	.4byte	.LCFI1
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI1
	.4byte	.LFE4
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LBB8
	.4byte	.LBE8
	.4byte	.LBB11
	.4byte	.LBE11
	.4byte	0
	.4byte	0
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF39:
	.ascii	"AT91PS_PIO\000"
.LASF27:
	.ascii	"PIO_PPUER\000"
.LASF34:
	.ascii	"PIO_OWER\000"
.LASF3:
	.ascii	"PIO_PDR\000"
.LASF17:
	.ascii	"PIO_PDSR\000"
.LASF38:
	.ascii	"AT91S_PIO\000"
.LASF31:
	.ascii	"PIO_BSR\000"
.LASF20:
	.ascii	"PIO_IMR\000"
.LASF18:
	.ascii	"PIO_IER\000"
.LASF40:
	.ascii	"initPIO_Port\000"
.LASF32:
	.ascii	"PIO_ABSR\000"
.LASF15:
	.ascii	"PIO_CODR\000"
.LASF6:
	.ascii	"PIO_OER\000"
.LASF29:
	.ascii	"Reserved4\000"
.LASF33:
	.ascii	"Reserved5\000"
.LASF37:
	.ascii	"AT91_REG\000"
.LASF12:
	.ascii	"PIO_IFSR\000"
.LASF30:
	.ascii	"PIO_ASR\000"
.LASF50:
	.ascii	"dummy\000"
.LASF11:
	.ascii	"PIO_IFDR\000"
.LASF28:
	.ascii	"PIO_PPUSR\000"
.LASF24:
	.ascii	"PIO_MDSR\000"
.LASF36:
	.ascii	"PIO_OWSR\000"
.LASF47:
	.ascii	"Delay\000"
.LASF26:
	.ascii	"PIO_PPUDR\000"
.LASF22:
	.ascii	"PIO_MDER\000"
.LASF48:
	.ascii	"Counter\000"
.LASF23:
	.ascii	"PIO_MDDR\000"
.LASF21:
	.ascii	"PIO_ISR\000"
.LASF46:
	.ascii	"_AT91S_PIO\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF44:
	.ascii	"GNU C 4.7.4 20130613 (release) [ARM/embedded-4_7-br"
	.ascii	"anch revision 200083]\000"
.LASF2:
	.ascii	"PIO_PER\000"
.LASF5:
	.ascii	"Reserved0\000"
.LASF9:
	.ascii	"Reserved1\000"
.LASF13:
	.ascii	"Reserved2\000"
.LASF25:
	.ascii	"Reserved3\000"
.LASF8:
	.ascii	"PIO_OSR\000"
.LASF19:
	.ascii	"PIO_IDR\000"
.LASF49:
	.ascii	"main\000"
.LASF43:
	.ascii	"LED_Off\000"
.LASF1:
	.ascii	"sizetype\000"
.LASF7:
	.ascii	"PIO_ODR\000"
.LASF45:
	.ascii	"C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\"
	.ascii	"main.c\000"
.LASF14:
	.ascii	"PIO_SODR\000"
.LASF42:
	.ascii	"port\000"
.LASF16:
	.ascii	"PIO_ODSR\000"
.LASF41:
	.ascii	"LED_On\000"
.LASF10:
	.ascii	"PIO_IFER\000"
.LASF4:
	.ascii	"PIO_PSR\000"
.LASF35:
	.ascii	"PIO_OWDR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 4.7.4 20130613 (release) [ARM/embedded-4_7-branch revision 200083]"

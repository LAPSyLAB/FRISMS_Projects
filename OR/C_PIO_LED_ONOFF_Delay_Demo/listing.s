   1              		.cpu arm7tdmi
   2              		.fpu softvfp
   3              		.eabi_attribute 20, 1
   4              		.eabi_attribute 21, 1
   5              		.eabi_attribute 23, 3
   6              		.eabi_attribute 24, 1
   7              		.eabi_attribute 25, 1
   8              		.eabi_attribute 26, 1
   9              		.eabi_attribute 30, 2
  10              		.eabi_attribute 34, 0
  11              		.eabi_attribute 18, 4
  12              		.file	"main.c"
  13              		.text
  14              	.Ltext0:
  15              		.cfi_sections	.debug_frame
  16              		.align	2
  17              		.global	initPIO_Port
  19              	initPIO_Port:
  20              	.LFB0:
  21              		.file 1 "C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\main.c"
   1:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** #include "Main.h"
   2:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** #include "AT91SAM9260.h"        
   3:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
   4:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** /* Zaradi napake v prevajalniku mora biti definirana ta spremenljivka */
   5:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** int dummy = 1;
   6:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
   7:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** #define PORT  AT91C_BASE_PIOC           // PIN PORTC1
   8:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** #define PIN   1                         // PIN PORTC1
   9:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  10:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** //void initPIO_Port(const AT91PS_PIO port)
  11:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** void initPIO_Port(AT91S_PIO *port)
  12:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** {
  22              		.loc 1 12 0
  23              		.cfi_startproc
  24              		@ Function supports interworking.
  25              		@ args = 0, pretend = 0, frame = 0
  26              		@ frame_needed = 0, uses_anonymous_args = 0
  27              		@ link register save eliminated.
  28              	.LVL0:
  13:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_PER=1<<PIN;
  29              		.loc 1 13 0
  30 0000 0230A0E3 		mov	r3, #2
  31 0004 003080E5 		str	r3, [r0, #0]
  14:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_OER=1<<PIN;
  32              		.loc 1 14 0
  33 0008 103080E5 		str	r3, [r0, #16]
  34 000c 1EFF2FE1 		bx	lr
  35              		.cfi_endproc
  36              	.LFE0:
  38              		.align	2
  39              		.global	LED_On
  41              	LED_On:
  42              	.LFB1:
  15:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** }   // initPIO_Port
  16:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  17:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** void LED_On(AT91PS_PIO port)
  18:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** {
  43              		.loc 1 18 0
  44              		.cfi_startproc
  45              		@ Function supports interworking.
  46              		@ args = 0, pretend = 0, frame = 0
  47              		@ frame_needed = 0, uses_anonymous_args = 0
  48              		@ link register save eliminated.
  49              	.LVL1:
  19:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_CODR=1<<PIN;
  50              		.loc 1 19 0
  51 0010 0230A0E3 		mov	r3, #2
  52 0014 343080E5 		str	r3, [r0, #52]
  53 0018 1EFF2FE1 		bx	lr
  54              		.cfi_endproc
  55              	.LFE1:
  57              		.align	2
  58              		.global	LED_Off
  60              	LED_Off:
  61              	.LFB2:
  20:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** }   
  21:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  22:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** void LED_Off(AT91PS_PIO port)
  23:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** {
  62              		.loc 1 23 0
  63              		.cfi_startproc
  64              		@ Function supports interworking.
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 0, uses_anonymous_args = 0
  67              		@ link register save eliminated.
  68              	.LVL2:
  24:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_SODR=1<<PIN;
  69              		.loc 1 24 0
  70 001c 0230A0E3 		mov	r3, #2
  71 0020 303080E5 		str	r3, [r0, #48]
  72 0024 1EFF2FE1 		bx	lr
  73              		.cfi_endproc
  74              	.LFE2:
  76              		.align	2
  77              		.global	Delay
  79              	Delay:
  80              	.LFB3:
  25:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** }   
  26:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  27:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** void Delay(unsigned int Counter) {
  81              		.loc 1 27 0
  82              		.cfi_startproc
  83              		@ Function supports interworking.
  84              		@ args = 0, pretend = 0, frame = 16
  85              		@ frame_needed = 0, uses_anonymous_args = 0
  86              		@ link register save eliminated.
  87              	.LVL3:
  88 0028 10D04DE2 		sub	sp, sp, #16
  89              	.LCFI0:
  90              		.cfi_def_cfa_offset 16
  28:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   volatile unsigned int i,j,tmp;
  29:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  30:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   for (i=0;i<Counter;i++) { 
  91              		.loc 1 30 0
  92 002c 0010A0E3 		mov	r1, #0
  93 0030 04108DE5 		str	r1, [sp, #4]
  94              	.LVL4:
  95 0034 04309DE5 		ldr	r3, [sp, #4]
  96 0038 030050E1 		cmp	r0, r3
  97 003c 1200009A 		bls	.L4
  31:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     for (j=0;j<48000;j++) { 
  98              		.loc 1 31 0
  99 0040 4C209FE5 		ldr	r2, .L14
 100              	.LVL5:
 101              	.L9:
 102 0044 08108DE5 		str	r1, [sp, #8]
 103 0048 08309DE5 		ldr	r3, [sp, #8]
 104 004c 020053E1 		cmp	r3, r2
 105 0050 0700008A 		bhi	.L8
 106              	.L10:
  32:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****       tmp=j ;
 107              		.loc 1 32 0
 108 0054 08309DE5 		ldr	r3, [sp, #8]
 109              	.LVL6:
 110 0058 0C308DE5 		str	r3, [sp, #12]
  31:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     for (j=0;j<48000;j++) { 
 111              		.loc 1 31 0
 112 005c 08309DE5 		ldr	r3, [sp, #8]
 113              	.LVL7:
 114 0060 013083E2 		add	r3, r3, #1
 115              	.LVL8:
 116 0064 08308DE5 		str	r3, [sp, #8]
 117              	.LVL9:
 118 0068 08309DE5 		ldr	r3, [sp, #8]
 119              	.LVL10:
 120 006c 020053E1 		cmp	r3, r2
 121 0070 F7FFFF9A 		bls	.L10
 122              	.L8:
  30:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   for (i=0;i<Counter;i++) { 
 123              		.loc 1 30 0
 124 0074 04309DE5 		ldr	r3, [sp, #4]
 125 0078 013083E2 		add	r3, r3, #1
 126              	.LVL11:
 127 007c 04308DE5 		str	r3, [sp, #4]
 128              	.LVL12:
 129 0080 04309DE5 		ldr	r3, [sp, #4]
 130              	.LVL13:
 131 0084 000053E1 		cmp	r3, r0
 132 0088 EDFFFF3A 		bcc	.L9
 133              	.L4:
  33:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     };
  34:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   };
  35:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** }
 134              		.loc 1 35 0
 135 008c 10D08DE2 		add	sp, sp, #16
 136 0090 1EFF2FE1 		bx	lr
 137              	.L15:
 138              		.align	2
 139              	.L14:
 140 0094 7FBB0000 		.word	47999
 141              		.cfi_endproc
 142              	.LFE3:
 144              		.section	.text.startup,"ax",%progbits
 145              		.align	2
 146              		.global	main
 148              	main:
 149              	.LFB4:
  36:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  37:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  38:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** 
  39:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** int main(void)
  40:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c **** {         
 150              		.loc 1 40 0
 151              		.cfi_startproc
 152              		@ Function supports interworking.
 153              		@ Volatile: function does not return.
 154              		@ args = 0, pretend = 0, frame = 0
 155              		@ frame_needed = 0, uses_anonymous_args = 0
 156              	.LVL14:
 157              	.LBB8:
 158              	.LBB9:
  13:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_PER=1<<PIN;
 159              		.loc 1 13 0
 160 0000 0050E0E3 		mvn	r5, #0
 161 0004 0240A0E3 		mov	r4, #2
 162              	.LBE9:
 163              	.LBE8:
 164              		.loc 1 40 0
 165 0008 08402DE9 		stmfd	sp!, {r3, lr}
 166              	.LCFI1:
 167              		.cfi_def_cfa_offset 8
 168              		.cfi_offset 3, -8
 169              		.cfi_offset 14, -4
 170              	.LBB11:
 171              	.LBB10:
  13:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_PER=1<<PIN;
 172              		.loc 1 13 0
 173 000c FF4705E5 		str	r4, [r5, #-2047]
  14:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_OER=1<<PIN;
 174              		.loc 1 14 0
 175 0010 EF4705E5 		str	r4, [r5, #-2031]
 176              	.L17:
 177              	.LBE10:
 178              	.LBE11:
  41:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   initPIO_Port(PORT);
  42:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   
  43:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   /* Loop for ever */
  44:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****   while (1) {
  45:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****       Delay(30);
 179              		.loc 1 45 0 discriminator 1
 180 0014 1E00A0E3 		mov	r0, #30
 181 0018 FEFFFFEB 		bl	Delay
 182              	.LVL15:
  46:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****       LED_On(PORT);
  47:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****       Delay(30);
 183              		.loc 1 47 0 discriminator 1
 184 001c 1E00A0E3 		mov	r0, #30
 185              	.LBB12:
 186              	.LBB13:
  19:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_CODR=1<<PIN;
 187              		.loc 1 19 0 discriminator 1
 188 0020 CB4705E5 		str	r4, [r5, #-1995]
 189              	.LBE13:
 190              	.LBE12:
 191              		.loc 1 47 0 discriminator 1
 192 0024 FEFFFFEB 		bl	Delay
 193              	.LVL16:
 194              	.LBB14:
 195              	.LBB15:
  24:C:\winIDEA\Projekti\C_PIO_LED_ONOFF_Delay_Demo\main.c ****     port->PIO_SODR=1<<PIN;
 196              		.loc 1 24 0 discriminator 1
 197 0028 CF4705E5 		str	r4, [r5, #-1999]
 198 002c F8FFFFEA 		b	.L17
 199              	.LBE15:
 200              	.LBE14:
 201              		.cfi_endproc
 202              	.LFE4:
 204              		.global	dummy
 205              		.data
 206              		.align	2
 209              	dummy:
 210 0000 01000000 		.word	1
 211              		.text
 212              	.Letext0:
 213              		.file 2 "C:\\winIDEA\\Projekti\\C_PIO_LED_ONOFF_Delay_Demo\\AT91SAM9260.h"

.equ PMC_BASE,  0xFFFFFC00  /* (PMC) Base Address */
.equ CKGR_MOR,	0x20        /* (CKGR) Main Oscillator Register */
.equ CKGR_PLLAR,0x28        /* (CKGR) PLL A Register */
.equ PMC_MCKR,  0x30        /* (PMC) Master Clock Register */
.equ PMC_SR,	  0x68        /* (PMC) Status Register */

.text
.code 32

.global _error
_error:
  b _error

.global	_start
_start:

/* select system mode 
  CPSR[4:0]	Mode
  --------------
   10000	  User
   10001	  FIQ
   10010	  IRQ
   10011	  SVC
   10111	  Abort
   11011	  Undef
   11111	  System   
*/

  mrs r0, cpsr
  bic r0, r0, #0x1F   /* clear mode flags */  
  orr r0, r0, #0xDF   /* set supervisor mode + DISABLE IRQ, FIQ*/
  msr cpsr, r0     
  
  /* init stack */
  ldr sp,_Lstack_end
                                   
  /* setup system clocks */
  ldr r1, =PMC_BASE

  ldr r0, = 0x0F01
  str r0, [r1,#CKGR_MOR]

osc_lp:
  ldr r0, [r1,#PMC_SR]
  tst r0, #0x01
  beq osc_lp
  
  mov r0, #0x01
  str r0, [r1,#PMC_MCKR]

  ldr r0, =0x2000bf00 | ( 124 << 16) | 12  /* 18,432 MHz * 125 / 12 */
  str r0, [r1,#CKGR_PLLAR]

pll_lp:
  ldr r0, [r1,#PMC_SR]
  tst r0, #0x02
  beq pll_lp

  /* MCK = PCK/4 */
  ldr r0, =0x0202
  str r0, [r1,#PMC_MCKR]

mck_lp:
  ldr r0, [r1,#PMC_SR]
  tst r0, #0x08
  beq mck_lp

  /* Enable caches */
  mrc p15, 0, r0, c1, c0, 0 
  orr r0, r0, #(0x1 <<12) 
  orr r0, r0, #(0x1 <<2)
  mcr p15, 0, r0, c1, c0, 0 

.global _main
/* main program */

/* TIOA for TC0 is on PA26 pin */

  .equ PMC_BASE, 0xFFFFFC00      /* Power Manag. Controller Base Addr.*/
  .equ PMC_PCER, 0x10                  /* Peripheral Clock Enable Register */
  .equ PIOA_BASE, 0xFFFFF400
  .equ PIOC_BASE, 0xFFFFF800
  .equ PIO_PER, 0x00
  .equ PIO_OER, 0x10
  .equ PIO_SODR, 0x30
  .equ PIO_CODR, 0x34
  .equ PIO_ASR,  0x70  @ Peripheral A select register
  .equ PIO_PDR,  0x04  @ PIO Disable Register
  .equ PIO_MDRR, 0x54  @ Multi-driver Disable Register




  .equ TC0_BASE, 0xFFFA0000 /* TC0 Channel Registers */
  .equ TC_IMR, 0x02C                /* TC0 Interrupt Mask Register */
  .equ TC_IER, 0x24                    /* TC0 Interrupt Enable Register*/
  .equ TC_RC, 0x1C                    /* TC0 Register C */
  .equ TC_RA, 0x14                    /* TC0 Register A */
  .equ TC_CMR, 0x04                /* TC0 Channel Mode Register (Capture Mode / Waveform Mode */
  .equ TC_IDR, 0x28                  /* TC0 Interrupt Disable Register */
  .equ TC_SR, 0x20                    /* TC0 Status Register */
  .equ TC_RB, 0x18                    /* TC0 Register B */
  .equ TC_CV, 0x10                    /* TC0 Counter Value */
  .equ TC_CCR, 0x00                  /* TC0 Channel Control Register */

  .equ DELAY_MSEC, 48000             /* 1ms countdown */
  .equ TC0RC, 6                     /* TC0 interval 6=1us */

_main:

/* user code here */
  bl INIT_IO
  bl INIT_TC0

/* user code here */
       adr r0,TABLECNT  @ TABLE elements count
       ldrh r5,[r0]
       
       adr r6,TABLE     @ TABLE address
     

PLAYCYCLE:                                   
       ldrh r7,[r6]     @ Read TABLE element & multiply by 6 (1usec)
       mov r10,r7,lsl #2 @  *4
       add r7,r7,r7      @  *2
       add r7,r10,r7     @  *6 = *4 + *2
       

       ldr r8,=WAIT_MS       @ repeat  cycles

REPEAT_CYCLE:

         ldr r2, =TC0_BASE
         str r7, [r2, #TC_RC]
         mov r0, #0b0101      /*TC_CLKEN,TC_SWTRG*/
         str r0, [r2, #TC_CCR]

     
       mov r0,r8
ZAN1:  ldr r1, =DELAY_MSEC
ZAN1n: subs r1, r1,#1
       bne ZAN1n
       subs r0,r0,#1
       bne ZAN1
       
       mov r0, #0b0010      /*TC_CLKDIS*/
       str r0, [r2, #TC_CCR]
        
      ldr r9,=PAUSE		@ short pause
DELAY: subs r9,r9,#1
      bne DELAY
      
      add  r6,r6,#2
      subs r5,r5,#1
      bne PLAYCYCLE
      
/* end user code */

_wait_for_ever:
  b _wait_for_ever
  
INIT_IO:
  stmfd r13!, {r0, r2, r14}
  ldr r2, =PIOA_BASE
  mov r0, #1 << 26
  str r0, [r2, #PIO_ASR]  @ Device A (TIOA) on PIN
  str r0, [r2, #PIO_PDR]  @ no PIO control on pin 26
@  str r0, [r2, #PIO_MDRR] @ onemogoèimo multi drive na pinu 26. 
@  str r0, [r2, #PIO_PER]
@  str r0, [r2, #PIO_OER]
  
  ldmfd r13!, {r0, r2, pc}


INIT_TC0:
  stmfd r13!, {r0, r2, r14}
  ldr r2, =PMC_BASE    /*Enable PMC for TC0 */
  mov r0, #(1 << 17)
  str r0, [r2,#PMC_PCER]

  /*Initialize TC0 MCK/128, RC=24 (1us) */
  ldr r2, =TC0_BASE
  mov r0, #0b1100110 << 13 /*ACPC=11, WAVE=1, WAVSEL= 10*/
  add r0, r0, #0b001            /* MCK/8 = 6MHz */
  str r0, [r2, #TC_CMR]
  ldr r0, =TC0RC                     /* 6 is 1 us at 48/8 Mhz */
  str r0, [r2, #TC_RC]
@  mov r0, #0b0101      /*TC_CLKEN,TC_SWTRG*/
@  str r0, [r2, #TC_CCR]
  ldmfd r13!, {r0, r2, r15}


/* constants */
@ Kuza Pazi Melody on buzzer demo
TABLECNT:  .hword 15
@ Kuza pazi c-d-e-d-c  (C=262Hz, D=290Hz, E=330Hz)
@ half note period in microsecs
TABLE:  .hword  1908,1908,1908,1908,1700,1700,1700,1700,1515,1515,1700,1700,1908,1908,1908
.equ WAIT_MS,500 
.equ PAUSE,48000*100

@ first&second cycle counter is from TABLE, only period is varied at 50% duty cycle



  .align
  
  
  
_Lstack_end:
  .long __STACK_END__

.end


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
_main:
        .equ DBGU_BASE, 0xFFFFF200	/* Debug Unit Base Address */
        .equ DBGU_CR, 0x00  		/* DBGU Control Register */
        .equ DBGU_MR, 0x04	  	/* DBGU Mode Register*/
        .equ DBGU_IER, 0x08		/* DBGU Interrupt Enable Register*/
        .equ DBGU_IDR, 0x0C		/* DBGU Interrupt Disable Register */
        .equ DBGU_IMR, 0x10		/* DBGU Interrupt Mask Register */
        .equ DBGU_SR,   0x14		/* DBGU Status Register */
        .equ DBGU_RHR, 0x18		/* DBGU Receive Holding Register */
        .equ DBGU_THR, 0x1C		/* DBGU Transmit Holding Register */
        .equ DBGU_BRGR, 0x20		/* DBGU Baud Rate Generator Register */

/* user code here */
      bl DEBUG_INIT
     
@ send test
@send1:  mov r0,#'a'
@        bl SND_DEBUG
@       b send1      

@ echo test
@ test2:  bl RCV_DEBUG
@       bl SND_DEBUG
@       b test2
            
@ loopback test
        mov r0,#'a'
test3:  bl SND_DEBUG
        bl RCV_DEBUG
        add r0,r0,#1
        b test3
 
@ LOOP: bl RCV_DEBUG
@      bl SND_DEBUG
@      b LOOP


/* end user code */

_wait_for_ever:
  b _wait_for_ever
DEBUG_INIT:
      stmfd r13!, {r0, r1, r14}
      ldr r0, =DBGU_BASE
@      mov r1, #26        @  BR=115200
      mov r1, #156        @  BR=19200
      str r1, [r0, #DBGU_BRGR]
      mov r1, #(1 << 11)
      add r1, r1, #(0b10 << 14)   @ Local Loopback Mode (instead of Normal)
      str r1, [r0, #DBGU_MR]
      mov r1, #0b1010000
      str r1, [r0, #DBGU_CR]
      ldmfd r13!, {r0, r1, pc}

RCV_DEBUG:
      stmfd r13!, {r1, r14}
      ldr r1, =DBGU_BASE
RCVD_LP:
      ldr r0, [r1, #DBGU_SR]
      tst r0, #1
      beq RCVD_LP
      ldr r0, [r1, #DBGU_RHR]
      ldmfd r13!, {r1, pc}

SND_DEBUG:
      stmfd r13!, {r1, r2, r14}
      ldr r1, =DBGU_BASE
SNDD_LP:
      ldr r2, [r1, #DBGU_SR]
      tst r2, #(1 << 1) @2
      beq SNDD_LP
      str r0, [r1, #DBGU_THR]
      ldmfd r13!, {r1, r2, pc}

      .align
/* constants */

_Lstack_end:
  .long __STACK_END__

.end


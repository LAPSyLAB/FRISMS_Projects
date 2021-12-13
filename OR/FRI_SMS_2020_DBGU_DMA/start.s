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
        
        .equ DBGU_RPR,  0x100 	/* Receive Pointer Register */
        .equ DBGU_RCR,  0x104 	/* Receive Counter Register */
        .equ DBGU_TPR,  0x108 	/* Transmit Pointer Register */
        .equ DBGU_TCR,  0x10C 	/* Transmit Counter Register */
        .equ DBGU_RNPR, 0x110 	/* Receive Next Pointer Register */
        .equ DBGU_RNCR, 0x114 	/* Receive Next Counter Register */
        .equ DBGU_TNPR, 0x118 	/* Transmit Next Pointer Register */
        .equ DBGU_TNCR, 0x11C 	/* Transmit Next Counter Register */
        .equ DBGU_PTCR, 0x120 	/* Periph. Transfer Control Register */
        .equ DBGU_PTSR, 0x124 	/* Periph. Transfer Status Register */
/* user code here */
/* inicializacija debug unit-a */
    bl DEBUG_INIT

zanka:
  

/* sproži sprejemanje preko DMA */
    ldr r0, =niz1
    ldr r1, =STRING_LENGTH
    bl RCV_DMA  
    

/* sproži oddajanje preko DMA */
    ldr r0, =niz2
    ldr r1, =STRING_LENGTH
    bl SND_DMA    
   
/* pocakaj na zastavico ENDTX */
    ldr r0, =DBGU_BASE
z1: ldr r1, [r0, #DBGU_SR]
    tst r1, #1 << 4
    beq z1
    
/* pocakaj na zastavico ENDRX */
z2: ldr r1, [r0, #DBGU_SR]
    tst r1, #1 << 3
    beq z2
    
/* zamenjaj velikost crk */
    ldr r0, =niz1
    ldr r1, =niz2
    ldr r2, =STRING_LENGTH
    bl CHANGE  
 
    b zanka

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

RCV_DMA:
    stmfd r13!, {r2-r3,r14}
    ldr r2,=DBGU_BASE
    add r0,r0,#0x200000
    str r0,[r2,#DBGU_RPR]    /* kazalec na niz1*/
    cmp r1, #1
    movlo r1, #1
    cmp r1, #80
    movhi r1, #80
    str r1,[r2,#DBGU_RCR]
    mov r3,#1                /* omogoci sprejemanje - RXTEN*/
    str r3,[r2,#DBGU_PTCR]

    ldmfd r13!, {r2-r3,pc}
   
   
SND_DMA:
    stmfd r13!, {r2-r3,r14}
    ldr r2,=DBGU_BASE
    add r0,r0,#0x200000
    str r0,[r2,#DBGU_TPR]    /* kazalec na niz1*/
    str r1,[r2,#DBGU_TCR]
    mov r3,#1<<8             /*omogoci oddajanje - TXTEN*/
    str r3,[r2,#DBGU_PTCR]
  
    ldmfd r13!, {r2-r3,pc}
   
  
CHANGE:   
    stmfd r13!, {r1-r4,r14}
   
ch_zanka:    
    ldrb r4, [r0], #1      
 
    bic r3, r4, #0b100000
    
    cmp r3, #'A'
    blo pisi
    cmp r3, #'Z'
    bhi pisi
    eor r4, r4, #0b100000     /*veliko crko spremeni v majhno*/

pisi: 
    strb r4, [r1], #1  /* shranimo v niz2*/  
       
    subs r2, r2, #1
    bne ch_zanka      
      
    ldmfd r13!, {r1-r4,pc}
  
 
/* end user code */

/* variables here */
  .equ STRING_LENGTH, 10
  .global niz1
  .global niz2
  
niz1: .asciz "__________"
niz2: .asciz "abcdefghij" 


      .align
/* constants */

_Lstack_end:
  .long __STACK_END__

.end


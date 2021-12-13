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

/* izberi irq naèin */
  mrs r0, cpsr
  bic r0, r0, #0x1F   /* pobriši zastavice naèina delovanja */  
  orr r0, r0, #0x12   /* nastavi irq naèin */
  msr cpsr, r0     
  
/* nastavi irq kazalec na sklad */
  ldr sp,_Lirqstack_end


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

  ldr r0, =0x2000bf00 | ( 124 << 16) | 12  /* 18,432 MHz * 125 / 12 = 192 MHz*/
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

  .equ PMC_BASE, 0xFFFFFC00	/* Power Management Controller Base Address */
  .equ PMC_PCER, 0x10  		/* Peripheral Clock Enable Register */

  .equ PIOB_BASE, 0xFFFFF600
  .equ PIOC_BASE, 0xFFFFF800
  .equ PIO_PER, 0x00
  .equ PIO_OER, 0x10
  .equ PIO_SODR, 0x30
  .equ PIO_CODR, 0x34
  

.global _main
/* main program */
_main:

       bl INIT_IO
      
/* user code here */
       
       adr r3,LED
       adr r4,BUZZ
       
VECNA: mov r2,#1         @ LED,BUZZ 1  
       str r2,[r3]
       str r2,[r4]
       bl  WRITEOUT
       
       
       mov r0,#500
ZAN1:  ldr r1, =48000
ZAN1n: subs r1, r1,#1
       bne ZAN1n
       subs r0,r0,#1
       bne ZAN1
       
       mov r2,#0         @ LED,BUZZ 0       
       str r2,[r3]
       str r2,[r4]
       bl  WRITEOUT
       
       mov r0,#500
ZAN2:  ldr r1, =48000
ZAN2n: subs r1, r1,#1
       bne ZAN2n
       subs r0,r0,#1
       bne ZAN2
        
       b VECNA
  

      
/* end user code */

_wait_for_ever:
  b _wait_for_ever

WRITEOUT :
  stmfd r13!, {r0-r2, r14}
  ldr r1, LED
  cmp r1, #0
  ldr r2, =PIOC_BASE
  mov r0, #1 << 1
  strne r0, [r2, #PIO_CODR]
  streq r0, [r2, #PIO_SODR]

  ldr r1, BUZZ
  cmp r1, #0
  ldr r2, =PIOB_BASE
  mov r0, #1
  strne r0, [r2, #PIO_CODR]
  streq r0, [r2, #PIO_SODR]
  ldmfd r13!, {r0-r2, pc}

  
INIT_IO:
  stmfd r13!, {r0, r2, r14}
  ldr r2, =PIOC_BASE        @ Initialize PC1 (LED)
  mov r0, #1 << 1
  str r0, [r2, #PIO_PER]
  str r0, [r2, #PIO_OER]
  ldr r2, =PIOB_BASE        @ Initialize PB0 (Buzzer)
  mov r0, #1
  str r0, [r2, #PIO_PER]
  str r0, [r2, #PIO_OER]

  ldmfd r13!, {r0, r2, pc} 


/* constants */
LED:   .word     1
BUZZ:   .word     1

  .align
_Lstack_end:
  .long __STACK_END__- 2*13*4  @ space for 26 registers on IRQ stack
_Lirqstack_end:
  .long __STACK_END__
 
 
.end













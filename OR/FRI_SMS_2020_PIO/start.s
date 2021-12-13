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

/* user code here */
	.equ PIOC_BASE, 0xFFFFF800 /* Zacetni naslov registrov za PIOC */
  .equ PIO_PER, 0x00	/* Odmiki... */
  .equ PIO_OER, 0x10
  .equ PIO_SODR, 0x30
  .equ PIO_CODR, 0x34
	
	ldr r0, =PIOC_BASE
	
	mov r1, #1 << 1
  
  str r1, [r0, #PIO_PER]	          /* Prikljucek PC1 krmili PIO */
  str r1, [r0, #PIO_OER]	          /* Omogoci izhod na PC1 */
	
  str r1, [r0, #PIO_SODR]	/* LED OFF Na prikljucek PC1 zapisi stanje 1 */
  str r1, [r0, #PIO_CODR]	/* LED ON  Na prikljucek PC1 zapisi stanje 0 */
  str r1, [r0, #PIO_SODR]	/* LED OFF Na prikljucek PC1 zapisi stanje 1 */
  

/* end user code */

_wait_for_ever:
  b _wait_for_ever

/* constants */

_Lstack_end:
  .long __STACK_END__

.end


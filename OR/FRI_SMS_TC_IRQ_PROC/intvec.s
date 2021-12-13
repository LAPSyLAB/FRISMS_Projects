.text
.code 32

.global _start
  B	_start                /* RESET INTERRUPT */
  B	_error                /* UNDEFINED INSTRUCTION INTERRUPT */
  B	_error                /* SOFTWARE INTERRUPT */
  B	_error                /* ABORT (PREFETCH) INTERRUPT */
  B	_error                /* ABORT (DATA) INTERRUPT */
  B	_error                /* RESERVED */
  ldr pc, [pc, #-0x0F20]  /* IRQ INTERRUPT */
  ldr pc, [pc, #-0x0F20]  /* FIQ INTERRUPT */
              
.end



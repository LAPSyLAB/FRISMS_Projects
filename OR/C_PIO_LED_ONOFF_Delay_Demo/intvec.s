.section .intvect, "a" @progbits
.code 32


.global _start

.global _vectors
.global vectors
_vectors:
vectors:
  ldr     pc, [pc, #24]   /* Reset */
  ldr     pc, [pc, #24]   /* Undefined instruction */
  ldr     pc, [pc, #24]   /* Software interrupt */

  ldr     pc, [pc, #24]   /* Prefetch abort */
  ldr     pc, [pc, #24]   /* Data abort */
  ldr     pc, [pc, #24]   /* Reserved */
  ldr     pc, [pc, #-0xF20]   /* Interrupt request, auto vectoring. */
  ldr     pc, [pc, #-0xF20]   /* Fast interrupt request, auto vectoring. */

  .word   _start
  .word   _undef
  .word   _swi
  .word   _prefetch_abort
  .word   _data_abort


_undef:
  b _undef                         

_swi:
  b _swi                         

_prefetch_abort:
  b _prefetch_abort
                           
_data_abort:
  b _data_abort                         
              
.end


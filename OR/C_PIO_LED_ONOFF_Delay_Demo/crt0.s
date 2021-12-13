.text
.code 32

.global	_start
.global	start
start:
_start:

  /* enable I-cache and D-cache */
  mrc p15, 0, r0, c1, c0, 0 
  orr r0, r0, #(0x1 <<12)  /* set I-cache bit */
  orr r0, r0, #(0x1 <<2)   /* set D-cache bit */
  mcr p15, 0, r0, c1, c0, 0

  /* select user mode */
  mrs r0, cpsr
  bic r0, r0, #0x1F   /* clear mode flags */  
  orr r0, r0, #0x10   /* set user mode */
  msr cpsr, r0     
  
  /* init stack */
  ldr sp,_Lstack_end

  /* low level HW init */
  bl CPU_Init  

  /* copy data */
_Lcopy_data:  
  ldr r0, _Linit_data_start
  ldr r1, _Ldata_start
  ldr r2, _Ldata_end
  cmp r1,r2
  beq _Lzero_bss
  /* copy byte by byte if not aligned */
  tst r0, #0x3
  bne _Lcopy_bytes
  tst r1, #0x3
  bne _Lcopy_bytes
  tst r2, #0x3
  bne _Lcopy_bytes
_Lcopy_words:
  ldr r3, [r0], #0x4
	str r3, [r1], #0x4
  cmp r1,r2
  bne _Lcopy_words
  b _Lzero_bss
_Lcopy_bytes:
  ldr r3, [r0], #0x1
	str r3, [r1], #0x1
  cmp r1,r2
  bne _Lcopy_bytes
   
  /* zero bss */
_Lzero_bss:
  ldr r0, _Lbss_start
  ldr r1, _Lbss_end
  cmp r0,r1
  beq L2            
  sub r2,r2,r2
  /* copy byte by byte if not aligned */
  tst r0, #0x3
  bne _Lzero_bytes
  tst r1, #0x3
  bne _Lzero_bytes
_Lzero_words:
	str r2, [r0], #0x4
  cmp r0,r1
  bne _Lzero_words
  b L2
_Lzero_bytes:
	str r2, [r0], #0x4
  cmp r0,r1
  bne _Lzero_bytes
  
/* call main */
L2:
  bl main
_Lforever:
  b _Lforever

  /* constants */
_Ldata_start:
  .long __DATA_START__ 
_Ldata_end:
  .long __DATA_END__
_Linit_data_start:
  .long __INIT_DATA_START__  
_Lstack_end:
  .long __STACK_END__
_Lbss_start:
  .long __bss_start__
_Lbss_end:
  .long __bss_end__

.end


#ifndef __Main_c__
#define __Main_c__

#define AT91B_MAIN_OSC         (18432000)                // Exetrnal Main Oscillator MAINCK
#define AT91B_PROCESSOR_CLOCK  ((AT91B_MAIN_OSC/12)*125) // Output PLL Clock (192 MHz)
#define AT91B_MASTER_CLOCK     (AT91B_PROCESSOR_CLOCK/2) // Output PLL Clock (96 MHz)
#define AT91B_DBGU_BAUD_RATE    115200

#define AT91C_US_ASYNC_MODE ( AT91C_US_USMODE_NORMAL + \
                        AT91C_US_NBSTOP_1_BIT + \
                        AT91C_US_PAR_NONE + \
                        AT91C_US_CHRL_8_BITS + \
                        AT91C_US_CLKS_CLOCK )

#endif


#include "main.h"
#include "AT91SAM9260.h"        


void CPU_Init()
	{
    AT91PS_PMC pPmc = AT91C_BASE_PMC;

    ///////////////////////////////////////////////////////////////////////////
    // Init PMC Step 1. Enable Main Oscillator
    // Main Oscillator startup time is board specific:
    // Main Oscillator Startup Time worst case (18MHz) corresponds to 1,4ms
    // (0x08 for AT91C_CKGR_OSCOUNT field)
    ///////////////////////////////////////////////////////////////////////////
    pPmc->PMC_MOR = (( AT91C_CKGR_OSCOUNT & (0x8 <<8) | AT91C_CKGR_MOSCEN ));
    // Wait Main Oscillator stabilization
    while(!(pPmc->PMC_SR & AT91C_PMC_MOSCS));
    // Switch to main ocilator
    AT91C_BASE_PMC->PMC_MCKR = AT91C_PMC_CSS_MAIN_CLK;

    ///////////////////////////////////////////////////////////////////////////
    // Init PMC Step 2.
    // Set PLL to 192 MHz 
        /* -Setup the PLL A */
    AT91C_BASE_CKGR->CKGR_PLLAR = (AT91C_CKGR_SRCA)               |
                                  ((124 << 16) & AT91C_CKGR_MULA) |
                                  (AT91C_CKGR_PLLACOUNT)          |
                                  (AT91C_CKGR_OUTA_2)             |
                                  (12);

    while (!(pPmc->PMC_SR  & AT91C_PMC_LOCKA));
    // Wait until the master clock is established for the case we already
    // turn on the PLL

    ///////////////////////////////////////////////////////////////////////////
    // Init PMC Step 3.
    // Selection of Master Clock MCK equal to (Processor Clock PCK) PLL/2=96MHz
    ///////////////////////////////////////////////////////////////////////////

    AT91C_BASE_PMC->PMC_MCKR =  AT91C_PMC_CSS_PLLA_CLK | AT91C_PMC_PRES_CLK | AT91C_PMC_MDIV_2;
    // Wait until the master clock is established
    while( !(AT91C_BASE_PMC->PMC_SR & AT91C_PMC_MCKRDY) );
    
}



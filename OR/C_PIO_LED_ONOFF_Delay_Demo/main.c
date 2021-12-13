#include "Main.h"
#include "AT91SAM9260.h"        

/* Zaradi napake v prevajalniku mora biti definirana ta spremenljivka */
int dummy = 1;

#define PORT  AT91C_BASE_PIOC           // PIN PORTC1
#define PIN   1                         // PIN PORTC1

//void initPIO_Port(const AT91PS_PIO port)
void initPIO_Port(AT91S_PIO *port)
{
    port->PIO_PER=1<<PIN;
    port->PIO_OER=1<<PIN;
}   // initPIO_Port

void LED_On(AT91PS_PIO port)
{
    port->PIO_CODR=1<<PIN;
}   

void LED_Off(AT91PS_PIO port)
{
    port->PIO_SODR=1<<PIN;
}   

void Delay(unsigned int Counter) {
  volatile unsigned int i,j,tmp;

  for (i=0;i<Counter;i++) { 
    for (j=0;j<48000;j++) { 
      tmp=j ;
    };
  };
}



int main(void)
{         
  initPIO_Port(PORT);
  
  /* Loop for ever */
  while (1) {
      Delay(30);
      LED_On(PORT);
      Delay(30);
      LED_Off(PORT);
  };      
}



















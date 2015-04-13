#define __16f690

#include <pic16f690.h>

typedef unsigned int config;
config __at(0x2007) __CONFIG = 
  _INTRC_OSC_NOCLKOUT & 
  _WDT_OFF & 
  _PWRTE_OFF & 
  _MCLRE_OFF & 
  _CP_OFF & 
  _BOR_OFF & 
  _IESO_OFF & 
  _FCMEN_OFF;

#define FOSC 1000000L

#define ROWA RC2
#define ROWB RB4
#define ROWC RC1
#define ROWD RC0

#define CLM1 RA0
#define CLM2 RA1
#define CLM3 RA2
  
unsigned int count = 0b10101010;
unsigned int timer_running = 0;
unsigned int keypad_map[4][3] = {
  {1,  2,  3},
  {4,  5,  6},
  {7,  8,  9},
  {10, 0,  11},
};

void delay() {
  int i = 0;
  int k = 0;
  for (i=0;i<8000;i++) k=i*2.1;
}

int find_keypad_row() {
  ROWA = 1;
  if (CLM1 && CLM2 && CLM3) {
  	return 0;
  }

  ROWB = 1;
  if (CLM1 && CLM2 && CLM3) {
  	return 1;
  }

  ROWC = 1;
  if (CLM1 && CLM2 && CLM3) {
  	return 2;
  }

  ROWD = 1;
  if (CLM1 && CLM2 && CLM3) {
	return 3;
  }

  return -1;
}

int find_keypad_column() {
  if(!CLM1) return 0;
  if(!CLM2) return 1;
  if(!CLM3) return 2;

  return -1;
}

void isr (void) __interrupt(0) {
  if(RABIE && RABIF) {
	unsigned int row = 0, column = 0, result = 0;
	if ((column = find_keypad_column()) == -1) {
	  RABIF = 0;
	  return;
	}

	if ((row = find_keypad_row()) == -1) {
	  ROWA = ROWB = ROWC = ROWD = 0;
	  RABIF = 0;
	  return;
	}

	ROWA = ROWB = ROWC = ROWD = 0;

	result = keypad_map[row][column];

	RC3 = result & 0b00001000;
    RC6 = result & 0b00000100;
    RC7 = result & 0b00000010;
    RB7 = result & 0b00000001;

	while (!CLM1 || !CLM2 || !CLM3);

  	RABIF  = 0;
  }

  if (TMR1IE && TMR1IF) {
	TMR1H  = 0b00001011;
	TMR1L  = 0b11011100;
	TMR1IF = 0;
	RB6 ^= 1;
  }
}

int main () {
  OPTION_REG = 0b00000000;
  TRISA      = 0b00000111;
  TRISB      = 0b00000000;
  TRISC      = 0b00000000;
  PORTB      = 0b00000000;
  PORTC      = 0b00000000;

  CM1CON0    = 0b00000000;
  CM2CON0    = 0b00000000;

  OSCCON     = 0b01010000;

  INTCON     = 0b11001000;
  PIE1       = 0b00000001;
  PIE2       = 0b00000000;
  
  ANSEL      = 0b00000000;
  ANSELH     = 0b00000000;
  IOCA       = 0b00000111;
  WPUA       = 0b00000111;

  T1CON  = 0b00111000;
  TMR1H  = 0b00001011;
  TMR1L  = 0b11011100;

  delay();

  TMR1ON = 1;

  while(1) {
	count = count;
  }	

  return 0;
}

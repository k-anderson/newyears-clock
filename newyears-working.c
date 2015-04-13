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

#define FOSC 2000000L

#define ROWA RC2
#define ROWB RB4
#define ROWC RC1
#define ROWD RC0

#define CLM1 RA0
#define CLM2 RA1
#define CLM3 RA2
  
unsigned int timer_running = 0;
unsigned int digit = 0;
unsigned int scan = 0;

unsigned int keypad_map[4][3] = {
  {1,  2,  3},
  {4,  5,  6},
  {7,  8,  9},
  {10, 0,  11},
};

unsigned int display_map[11] = {
  0b00000000, //0
  0b00101000, //1
  0b10100111, //2
  0b10101101, //3
  0b01101001, //4
  0b11001101, //5
  0b01001111, //6
  0b10101000, //7
  0b11101111, //8
  0b11101001, //9
  0b00010000, //*
  0b11111111  //#
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

void shift_out(unsigned int value) {
  unsigned int i = 0;

  while(!TRMT);
  
  TXREG = value;

  while(!TRMT);

  RB6 = 1;
  for (i=0; i<100; i++);
  RB6 = 0;
}

void isr (void) __interrupt(0) {
  if(RABIE && RABIF) {
	unsigned int row = 0, column = 0;
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

	while (!CLM1 || !CLM2 || !CLM3);

	digit = keypad_map[row][column];

  	RABIF  = 0;
  }

  if (TMR1IE && TMR1IF) {
	TMR1H  = 0b00001011;
	TMR1L  = 0b11011100;
	TMR1IF = 0;
  }
}

void main () {
  OPTION_REG = 0b00000000;

  /* PORTS */
  TRISA      = 0b00000111;
  TRISB      = 0b00000000;
  TRISC      = 0b00000000;
  PORTB      = 0b00000000;
  PORTC      = 0b00000000;
  WPUA       = 0b00000111;

  /* OSC */
  OSCCON     = 0b01010000;

  /* INTERUPTS */
  INTCON     = 0b11001000;
  PIE1       = 0b00000001;
  PIE2       = 0b00000000;
  IOCA       = 0b00000111;

  /* EUSART */
//  SPBRGH     = 0b00000011;
//  SPBRG      = 0b00001110;
  SPBRGH     = 0b00000000;
  SPBRG      = 0b00110101;
  BAUDCTL    = 0b01010000;
  RCSTA      = 0b10000000;
  TXSTA      = 0b10110000;
  
  /* ADC */
  ANSEL      = 0b00000000;
  ANSELH     = 0b00000000;

  /* TIMER1 */
  T1CON  = 0b00111000;
  TMR1H  = 0b00001011;
  TMR1L  = 0b11011100;

  delay();

  TMR1ON = 1;

  while(1) {
  	if (++scan > 3) {
	  scan = 0;
	}

	if (!scan) {
	  shift_out(display_map[digit]);
	} else {
	  shift_out(0);
	}
  }	
}

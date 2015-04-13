;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.2.0 #8008 (Oct  8 2012) (Linux)
; This file was generated Wed Dec 19 10:52:56 2012
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
	.file	"newyears.c"
	list	p=16f690
	radix dec
	include "p16f690.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x30d4
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	__mulint
	extern	_ADCON0bits
	extern	_ADCON1bits
	extern	_ANSELbits
	extern	_ANSELHbits
	extern	_BAUDCTLbits
	extern	_CCP1CONbits
	extern	_CM1CON0bits
	extern	_CM2CON0bits
	extern	_CM2CON1bits
	extern	_ECCPASbits
	extern	_EECON1bits
	extern	_INTCONbits
	extern	_IOCbits
	extern	_IOCAbits
	extern	_IOCBbits
	extern	_OPTION_REGbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_PCONbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PSTRCONbits
	extern	_PWM1CONbits
	extern	_RCSTAbits
	extern	_SPBRGbits
	extern	_SPBRGHbits
	extern	_SRCONbits
	extern	_SSPCONbits
	extern	_SSPSTATbits
	extern	_STATUSbits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_TXSTAbits
	extern	_VRCONbits
	extern	_WDTCONbits
	extern	_WPUAbits
	extern	_WPUBbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_PWM1CON
	extern	_ECCPAS
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_PR2
	extern	_SSPADD
	extern	_MSK
	extern	_SSPMSK
	extern	_SSPSTAT
	extern	_WPU
	extern	_WPUA
	extern	_IOC
	extern	_IOCA
	extern	_WDTCON
	extern	_TXSTA
	extern	_SPBRG
	extern	_SPBRGH
	extern	_BAUDCTL
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDAT
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_WPUB
	extern	_IOCB
	extern	_VRCON
	extern	_CM1CON0
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_ANSEL
	extern	_ANSELH
	extern	_EECON1
	extern	_EECON2
	extern	_PSTRCON
	extern	_SRCON
	extern	___sdcc_saved_fsr
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_delay
	global	_find_keypad_row
	global	_find_keypad_column
	global	_shift_out
	global	_isr
	global	_main
	global	_timer_running
	global	_digits
	global	_finished
	global	_keypad_map
	global	_display_map

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_newyears_0	udata
r0x103B	res	1
r0x103C	res	1
r0x1046	res	1
r0x1045	res	1
r0x1047	res	1
r0x1048	res	1
r0x1049	res	1
r0x104A	res	1
r0x103D	res	1
r0x103E	res	1
r0x103F	res	1
r0x1040	res	1
r0x1041	res	1
r0x1042	res	1
r0x1043	res	1
r0x1044	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_newyears_0	idata
_timer_running
	db	0x00, 0x00


ID_newyears_1	idata
_digits
	db	0x00, 0x00
	db	0x00, 0x00
	db	0x00, 0x00
	db	0x00, 0x00


ID_newyears_2	idata
_finished
	db	0x00, 0x00


ID_newyears_3	idata
_keypad_map
	db	0x01, 0x00
	db	0x02, 0x00
	db	0x03, 0x00
	db	0x04, 0x00
	db	0x05, 0x00
	db	0x06, 0x00
	db	0x07, 0x00
	db	0x08, 0x00
	db	0x09, 0x00
	db	0x0a, 0x00
	db	0x00, 0x00
	db	0x0b, 0x00


ID_newyears_4	idata
_display_map
	db	0xee, 0x00
	db	0x28, 0x00
	db	0xa7, 0x00
	db	0xad, 0x00
	db	0x69, 0x00
	db	0xcd, 0x00
	db	0x4f, 0x00
	db	0xa8, 0x00
	db	0xef, 0x00
	db	0xe9, 0x00
	db	0x10, 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x4
__sdcc_interrupt
;***
;  pBlock Stats: dbName = I
;***
;entry:  _isr	;Function start
; 0 exit points
;functions called:
;   _find_keypad_column
;   _find_keypad_row
;   __mulint
;   __mulint
;   _find_keypad_column
;   _find_keypad_row
;   __mulint
;   __mulint
;9 compiler assigned registers:
;   r0x1045
;   STK00
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;   STK02
;   STK01
;; Starting pCode block
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2339:genFunction *{*
;; ***	genFunction  2341 curr label offset=52previous max_key=4 
_isr	;Function start
; 0 exit points
;; >>> gen.c:2402:genFunction
	.line	99; "newyears.c"	void isr (void) __interrupt(0) {
	MOVWF	WSAVE
;; >>> gen.c:2403:genFunction
	SWAPF	STATUS,W
;; >>> gen.c:2408:genFunction
	CLRF	STATUS
;; >>> gen.c:2409:genFunction
	MOVWF	SSAVE
;; >>> gen.c:2411:genFunction
	MOVF	PCLATH,W
;; >>> gen.c:2413:genFunction
	CLRF	PCLATH
;; >>> gen.c:2414:genFunction
	MOVWF	PSAVE
;; >>> gen.c:2416:genFunction
	MOVF	FSR,W
;; >>> gen.c:2417:genFunction
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> gen.c:5764:genUnpackBits
	.line	100; "newyears.c"	if(RABIE && RABIF) {
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,3
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=22, label offset 60
	GOTO	_00182_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_INTCONbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=22, label offset 60
	GOTO	_00182_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2085:genCall *{*
;; ***	genCall  2087
;;; gen.c:1800:saveRegisters *{*
;; ***	saveRegisters  1802
;; >>> gen.c:2172:genCall
	.line	102; "newyears.c"	if ((column = find_keypad_column()) == -1) {
	PAGESEL	_find_keypad_column
;; >>> gen.c:2174:genCall
	CALL	_find_keypad_column
;; >>> gen.c:2180:genCall
	PAGESEL	$
;;	694 register type nRegs=2
;;; gen.c:1906:assignResultValue *{*
;; ***	assignResultValue  1908
;; 	line = 1910 result -=-, size=0, left AOP_REG=r0x1051, size=2, right -=-, size=0
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1048
	MOVWF	r0x1048
	MOVWF	r0x1045
;; >>> gen.c:1422:get_returnvalue
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVF	STK00,W
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1051 
	MOVWF	r0x1046
	MOVWF	r0x1047
;; ***	genAssign  7004
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1052 
;;100	MOVF	r0x1045,W
;; >>> gen.c:7031:genAssign
;;	1108 rIdx = r0x1054 
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3616:genCmpEq *{*
;; ***	genCmpEq  3617
;; ifx is non-null
;;	694 register type nRegs=2
;; 	line = 3628 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1051, size=2, right AOP_LIT=0xff, size=2
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0xff
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=2, label offset 60
	GOTO	_00162_DS_
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1052 
	MOVF	r0x1045,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0xff
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=2, label offset 60
	GOTO	_00162_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6504 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> gen.c:6238:genPackBits
	.line	103; "newyears.c"	RABIF = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=42, label offset 60
	.line	104; "newyears.c"	return;
	GOTO	_00202_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2085:genCall *{*
;; ***	genCall  2087
;;; gen.c:1800:saveRegisters *{*
;; ***	saveRegisters  1802
;; >>> gen.c:2172:genCall
_00162_DS_
	.line	107; "newyears.c"	if ((row = find_keypad_row()) == -1) {
	PAGESEL	_find_keypad_row
;; >>> gen.c:2174:genCall
	CALL	_find_keypad_row
;; >>> gen.c:2180:genCall
	PAGESEL	$
;;	694 register type nRegs=2
;;; gen.c:1906:assignResultValue *{*
;; ***	assignResultValue  1908
;; 	line = 1910 result -=-, size=0, left AOP_REG=r0x1051, size=2, right -=-, size=0
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x104A
	MOVWF	r0x104A
	MOVWF	r0x1045
;; >>> gen.c:1422:get_returnvalue
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVF	STK00,W
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1051 
	MOVWF	r0x1046
	MOVWF	r0x1049
;; ***	genAssign  7004
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1052 
;;99	MOVF	r0x1045,W
;; >>> gen.c:7031:genAssign
;;	1108 rIdx = r0x1056 
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3616:genCmpEq *{*
;; ***	genCmpEq  3617
;; ifx is non-null
;;	694 register type nRegs=2
;; 	line = 3628 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1051, size=2, right AOP_LIT=0xff, size=2
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0xff
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=4, label offset 60
	GOTO	_00164_DS_
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1052 
	MOVF	r0x1045,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0xff
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=4, label offset 60
	GOTO	_00164_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; >>> gen.c:6238:genPackBits
	.line	108; "newyears.c"	ROWA = ROWB = ROWC = ROWD = 0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;; >>> gen.c:5774:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	CLRF	r0x1046
;; >>> gen.c:5779:genUnpackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BTFSS	_PORTCbits,0
	GOTO	_00002_DS_
;; >>> gen.c:5799:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	INCF	r0x1046,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=1
;;	694 register type nRegs=1
;; 	line = 7110 result AOP_REG=r0x1052, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x1051 
_00002_DS_
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:7259:genCast
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	694 register type nRegs=1
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_REG=r0x1052, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;; >>> gen.c:6317:genPackBits
;;	1108 rIdx = r0x1052 
	RRF	r0x1045,W
;; >>> gen.c:6318:genPackBits
	BTFSC	STATUS,0
	GOTO	_00003_DS_
;; >>> gen.c:6319:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,1
;; >>> gen.c:6320:genPackBits
_00003_DS_
	BTFSS	STATUS,0
	GOTO	_00004_DS_
;; >>> gen.c:6321:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,1
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;; >>> gen.c:5774:genUnpackBits
;;	1108 rIdx = r0x1051 
_00004_DS_
	BANKSEL	r0x1046
	CLRF	r0x1046
;; >>> gen.c:5779:genUnpackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BTFSS	_PORTCbits,1
	GOTO	_00005_DS_
;; >>> gen.c:5799:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	INCF	r0x1046,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=1
;;	694 register type nRegs=1
;; 	line = 7110 result AOP_REG=r0x1052, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x1051 
_00005_DS_
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:7259:genCast
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTBbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	694 register type nRegs=1
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; 	line = 6504 result AOP_PCODE=_PORTBbits, size=2, left -=-, size=0, right AOP_REG=r0x1052, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;; >>> gen.c:6317:genPackBits
;;	1108 rIdx = r0x1052 
	RRF	r0x1045,W
;; >>> gen.c:6318:genPackBits
	BTFSC	STATUS,0
	GOTO	_00006_DS_
;; >>> gen.c:6319:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,4
;; >>> gen.c:6320:genPackBits
_00006_DS_
	BTFSS	STATUS,0
	GOTO	_00007_DS_
;; >>> gen.c:6321:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,4
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;; >>> gen.c:5774:genUnpackBits
;;	1108 rIdx = r0x1051 
_00007_DS_
	BANKSEL	r0x1046
	CLRF	r0x1046
;; >>> gen.c:5779:genUnpackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
	BANKSEL	_PORTBbits
	BTFSS	_PORTBbits,4
	GOTO	_00008_DS_
;; >>> gen.c:5799:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	INCF	r0x1046,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=1
;;	694 register type nRegs=1
;; 	line = 7110 result AOP_REG=r0x1052, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x1051 
_00008_DS_
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:7259:genCast
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	694 register type nRegs=1
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_REG=r0x1052, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;; >>> gen.c:6317:genPackBits
;;	1108 rIdx = r0x1052 
	RRF	r0x1045,W
;; >>> gen.c:6318:genPackBits
	BTFSC	STATUS,0
	GOTO	_00009_DS_
;; >>> gen.c:6319:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,2
;; >>> gen.c:6320:genPackBits
_00009_DS_
	BTFSS	STATUS,0
	GOTO	_00010_DS_
;; >>> gen.c:6321:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,2
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6504 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> gen.c:6238:genPackBits
_00010_DS_
	.line	109; "newyears.c"	RABIF = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=42, label offset 60
	.line	110; "newyears.c"	return;
	GOTO	_00202_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; >>> gen.c:6238:genPackBits
_00164_DS_
	.line	113; "newyears.c"	ROWA = ROWB = ROWC = ROWD = 0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;; >>> gen.c:5774:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	CLRF	r0x1046
;; >>> gen.c:5779:genUnpackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BTFSS	_PORTCbits,0
	GOTO	_00011_DS_
;; >>> gen.c:5799:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	INCF	r0x1046,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=1
;;	694 register type nRegs=1
;; 	line = 7110 result AOP_REG=r0x1052, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x1051 
_00011_DS_
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:7259:genCast
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	694 register type nRegs=1
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_REG=r0x1052, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;; >>> gen.c:6317:genPackBits
;;	1108 rIdx = r0x1052 
	RRF	r0x1045,W
;; >>> gen.c:6318:genPackBits
	BTFSC	STATUS,0
	GOTO	_00012_DS_
;; >>> gen.c:6319:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,1
;; >>> gen.c:6320:genPackBits
_00012_DS_
	BTFSS	STATUS,0
	GOTO	_00013_DS_
;; >>> gen.c:6321:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,1
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;; >>> gen.c:5774:genUnpackBits
;;	1108 rIdx = r0x1051 
_00013_DS_
	BANKSEL	r0x1046
	CLRF	r0x1046
;; >>> gen.c:5779:genUnpackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BTFSS	_PORTCbits,1
	GOTO	_00014_DS_
;; >>> gen.c:5799:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	INCF	r0x1046,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=1
;;	694 register type nRegs=1
;; 	line = 7110 result AOP_REG=r0x1052, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x1051 
_00014_DS_
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:7259:genCast
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTBbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	694 register type nRegs=1
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; 	line = 6504 result AOP_PCODE=_PORTBbits, size=2, left -=-, size=0, right AOP_REG=r0x1052, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;; >>> gen.c:6317:genPackBits
;;	1108 rIdx = r0x1052 
	RRF	r0x1045,W
;; >>> gen.c:6318:genPackBits
	BTFSC	STATUS,0
	GOTO	_00015_DS_
;; >>> gen.c:6319:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,4
;; >>> gen.c:6320:genPackBits
_00015_DS_
	BTFSS	STATUS,0
	GOTO	_00016_DS_
;; >>> gen.c:6321:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,4
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;; >>> gen.c:5774:genUnpackBits
;;	1108 rIdx = r0x1051 
_00016_DS_
	BANKSEL	r0x1046
	CLRF	r0x1046
;; >>> gen.c:5779:genUnpackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
	BANKSEL	_PORTBbits
	BTFSS	_PORTBbits,4
	GOTO	_00017_DS_
;; >>> gen.c:5799:genUnpackBits
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	INCF	r0x1046,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=1
;;	694 register type nRegs=1
;; 	line = 7110 result AOP_REG=r0x1052, size=1, left -=-, size=0, right AOP_REG=r0x1051, size=1
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x1051 
_00017_DS_
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:7259:genCast
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	694 register type nRegs=1
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_REG=r0x1052, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;; >>> gen.c:6317:genPackBits
;;	1108 rIdx = r0x1052 
	RRF	r0x1045,W
;; >>> gen.c:6318:genPackBits
	BTFSC	STATUS,0
	GOTO	_00018_DS_
;; >>> gen.c:6319:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,2
;; >>> gen.c:6320:genPackBits
_00018_DS_
	BTFSS	STATUS,0
	GOTO	_00019_DS_
;; >>> gen.c:6321:genPackBits
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,2
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
_00019_DS_
	.line	115; "newyears.c"	while (!CLM1 || !CLM2 || !CLM3);
	BANKSEL	_PORTAbits
	BTFSS	_PORTAbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=7, label offset 60
	GOTO	_00019_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=7, label offset 60
	GOTO	_00019_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,2
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=7, label offset 60
	GOTO	_00019_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2085:genCall *{*
;; ***	genCall  2087
;;; gen.c:1800:saveRegisters *{*
;; ***	saveRegisters  1802
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	2134 left AOP_REG
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1055 
	.line	117; "newyears.c"	key = keypad_map[row][column];
	BANKSEL	r0x1049
	MOVF	r0x1049,W
;; 	2134 left AOP_REG
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7d
	MOVWF	STK02
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1056 
	MOVF	r0x104A,W
;; 	2134 left AOP_LIT
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7e
	MOVWF	STK01
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x06
;; 	2134 left AOP_LIT
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2172:genCall
	PAGESEL	__mulint
;; >>> gen.c:2174:genCall
	CALL	__mulint
;; >>> gen.c:2180:genCall
	PAGESEL	$
;;	694 register type nRegs=2
;;; gen.c:1906:assignResultValue *{*
;; ***	assignResultValue  1908
;; 	line = 1910 result -=-, size=0, left AOP_REG=r0x1051, size=2, right -=-, size=0
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;; >>> gen.c:1422:get_returnvalue
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVF	STK00,W
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1051 
	MOVWF	r0x1046
	ADDLW	(_keypad_map + 0)
;; >>> genarith.c:701:genPlus
;;	1108 rIdx = r0x1051 
	MOVWF	r0x1046
;; >>> genarith.c:714:genPlus
;;	1108 rIdx = r0x1052 
	MOVF	r0x1045,W
;; >>> genarith.c:715:genPlus
	BTFSC	STATUS,0
;; >>> genarith.c:716:genPlus
;;	1108 rIdx = r0x1052 
	INCFSZ	r0x1045,W
;; >>> genarith.c:717:genPlus
	ADDLW	high (_keypad_map + 0)
;; >>> genarith.c:718:genPlus
;;	1108 rIdx = r0x1052 
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2085:genCall *{*
;; ***	genCall  2087
;;; gen.c:1800:saveRegisters *{*
;; ***	saveRegisters  1802
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	2134 left AOP_REG
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1053 
	MOVF	r0x1047,W
;; 	2134 left AOP_REG
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7d
	MOVWF	STK02
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1054 
	MOVF	r0x1048,W
;; 	2134 left AOP_LIT
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7e
	MOVWF	STK01
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x02
;; 	2134 left AOP_LIT
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2172:genCall
	PAGESEL	__mulint
;; >>> gen.c:2174:genCall
	CALL	__mulint
;; >>> gen.c:2180:genCall
	PAGESEL	$
;;	694 register type nRegs=2
;;; gen.c:1906:assignResultValue *{*
;; ***	assignResultValue  1908
;; 	line = 1910 result -=-, size=0, left AOP_REG=r0x1053, size=2, right -=-, size=0
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1054 
	BANKSEL	r0x1048
	MOVWF	r0x1048
;; >>> gen.c:1422:get_returnvalue
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVF	STK00,W
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x1053 
	MOVWF	r0x1047
	ADDWF	r0x1046,F
;; >>> genarith.c:739:genPlus
;;	1108 rIdx = r0x1054 
	MOVF	r0x1048,W
;; >>> genarith.c:740:genPlus
	BTFSC	STATUS,0
;; >>> genarith.c:741:genPlus
;;	1108 rIdx = r0x1054 
	INCFSZ	r0x1048,W
;; >>> genarith.c:742:genPlus
;;	1108 rIdx = r0x1052 
	ADDWF	r0x1045,F
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	694 register type nRegs=2
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=2
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:5600:setup_fsr
	BANKSEL	FSR
	MOVWF	FSR
;;; gen.c:5556:SetIrp *{*
;; >>> gen.c:5577:SetIrp
	BCF	STATUS,7
;; >>> gen.c:5580:SetIrp
	BANKSEL	r0x1045
	BTFSC	r0x1045,0
;; >>> gen.c:5581:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  5951
;; >>> gen.c:5958:genNearPointerGet
	BANKSEL	INDF
	MOVF	INDF,W
;; >>> gen.c:5965:genNearPointerGet
;;	1108 rIdx = r0x1053 
	BANKSEL	r0x1047
	MOVWF	r0x1047
;; >>> gen.c:5628:inc_fsr
	BANKSEL	FSR
	INCF	FSR,F
;; >>> gen.c:5958:genNearPointerGet
	MOVF	INDF,W
;; >>> gen.c:5965:genNearPointerGet
;;	1108 rIdx = r0x1054 
	BANKSEL	r0x1048
	MOVWF	r0x1048
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3616:genCmpEq *{*
;; ***	genCmpEq  3617
;; ifx is non-null
;;	694 register type nRegs=2
;; 	line = 3628 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1053, size=2, right AOP_LIT=0x0a, size=2
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1053 
	.line	119; "newyears.c"	if (key == 10) {
	MOVF	r0x1047,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0x0a
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=19, label offset 60
	GOTO	_00179_DS_
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1054 
	MOVF	r0x1048,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0x00
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=19, label offset 60
	GOTO	_00179_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; 	line = 6918 result AOP_DIR=_timer_running, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=0
	.line	120; "newyears.c"	timer_running = 0;
	BANKSEL	_timer_running
	CLRF	_timer_running
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=1
	CLRF	(_timer_running + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _finished, size = 2
;; 	line = 6918 result AOP_DIR=_finished, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _finished   offset=0
	.line	121; "newyears.c"	finished = 0;
	BANKSEL	_finished
	CLRF	_finished
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _finished   offset=1
	CLRF	(_finished + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	122; "newyears.c"	digits[0] = 0;
	BANKSEL	_digits
	CLRF	(_digits + 0)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	123; "newyears.c"	digits[1] = 0;
	CLRF	(_digits + 2)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 3)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	124; "newyears.c"	digits[2] = 0;
	CLRF	(_digits + 4)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 5)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	125; "newyears.c"	digits[3] = 0;
	CLRF	(_digits + 6)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 7)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2775:genGoto *{*
;; >>> gen.c:2777:genGoto
;; ***	popGetLabel  key=20, label offset 60
	GOTO	_00180_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1009
;;	1028  _timer_running   offset=0
_00179_DS_
	.line	126; "newyears.c"	} else if (!timer_running) {
	BANKSEL	_timer_running
	MOVF	_timer_running,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1009
;;	1028  _timer_running   offset=1
	IORWF	(_timer_running + 1),W
;; >>> gen.c:6789:genIfx
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=20, label offset 60
	GOTO	_00180_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1009
;;	1028  _timer_running   offset=0
	.line	127; "newyears.c"	if (!timer_running && finished) {
	MOVF	_timer_running,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1009
;;	1028  _timer_running   offset=1
	IORWF	(_timer_running + 1),W
;; >>> gen.c:6789:genIfx
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=11, label offset 60
	GOTO	_00171_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;; ***	aopForSym 315
;;	327 sym->rname = _finished, size = 2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1009
;;	1028  _finished   offset=0
	BANKSEL	_finished
	MOVF	_finished,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1009
;;	1028  _finished   offset=1
	IORWF	(_finished + 1),W
;; >>> gen.c:6794:genIfx
	BTFSC	STATUS,2
;; >>> gen.c:6795:genIfx
;; ***	popGetLabel  key=11, label offset 60
	GOTO	_00171_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _finished, size = 2
;; 	line = 6918 result AOP_DIR=_finished, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _finished   offset=0
	.line	128; "newyears.c"	finished = 0;
	CLRF	_finished
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _finished   offset=1
	CLRF	(_finished + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	129; "newyears.c"	digits[0] = 0;
	BANKSEL	_digits
	CLRF	(_digits + 0)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	130; "newyears.c"	digits[1] = 0;
	CLRF	(_digits + 2)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 3)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	131; "newyears.c"	digits[2] = 0;
	CLRF	(_digits + 4)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 5)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	132; "newyears.c"	digits[3] = 0;
	CLRF	(_digits + 6)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 7)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3616:genCmpEq *{*
;; ***	genCmpEq  3617
;; ifx is non-null
;;	694 register type nRegs=2
;; 	line = 3628 result AOP_CRY=0x00, size=0, left AOP_REG=r0x1053, size=2, right AOP_LIT=0x0b, size=2
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1053 
_00171_DS_
	.line	135; "newyears.c"	if (key == 11) {
	BANKSEL	r0x1047
	MOVF	r0x1047,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0x0b
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=14, label offset 60
	GOTO	_00174_DS_
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1054 
	MOVF	r0x1048,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0x00
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=14, label offset 60
	GOTO	_00174_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; 	line = 6918 result AOP_DIR=_timer_running, size=2, left -=-, size=0, right AOP_LIT=0x01, size=2
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	136; "newyears.c"	timer_running = 1;	  
	MOVLW	0x01
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _timer_running   offset=0
	BANKSEL	_timer_running
	MOVWF	_timer_running
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=1
	CLRF	(_timer_running + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2775:genGoto *{*
;; >>> gen.c:2777:genGoto
;; ***	popGetLabel  key=20, label offset 60
	GOTO	_00180_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; 	line = 6918 result AOP_DIR=_timer_running, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=0
_00174_DS_
	.line	138; "newyears.c"	timer_running = 0;
	BANKSEL	_timer_running
	CLRF	_timer_running
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=1
	CLRF	(_timer_running + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 4
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+4), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	139; "newyears.c"	digits[3] = digits[2];
	BANKSEL	_digits
	MOVF	(_digits + 4),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 5),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 6)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 7)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 2
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+2), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	140; "newyears.c"	digits[2] = digits[1];
	MOVF	(_digits + 2),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 3),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 4)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 5)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=_digits, size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	141; "newyears.c"	digits[1] = digits[0];
	MOVF	(_digits + 0),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 1),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 2)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 3)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1053 
	.line	142; "newyears.c"	digits[0] = key;
	BANKSEL	r0x1047
	MOVF	r0x1047,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 0)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1054 
	BANKSEL	r0x1048
	MOVF	r0x1048,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _INTCONbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; 	line = 6504 result AOP_PCODE=_INTCONbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_INTCONbits
;; >>> gen.c:6238:genPackBits
_00180_DS_
	.line	146; "newyears.c"	RABIF  = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PIE1bits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIE1bits
;; >>> gen.c:5764:genUnpackBits
_00182_DS_
	.line	149; "newyears.c"	if (TMR1IE && TMR1IF) {
	BANKSEL	_PIE1bits
	BTFSS	_PIE1bits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=42, label offset 60
	GOTO	_00202_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PIR1bits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1bits
;; >>> gen.c:5764:genUnpackBits
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=42, label offset 60
	GOTO	_00202_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TMR1H, size = 1
;; 	line = 6918 result AOP_DIR=_TMR1H, size=1, left -=-, size=0, right AOP_LIT=0x0b, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	150; "newyears.c"	TMR1H  = 0b00001011;
	MOVLW	0x0b
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _TMR1H   offset=0
	MOVWF	_TMR1H
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TMR1L, size = 1
;; 	line = 6918 result AOP_DIR=_TMR1L, size=1, left -=-, size=0, right AOP_LIT=0xdc, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	151; "newyears.c"	TMR1L  = 0b11011100;
	MOVLW	0xdc
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _TMR1L   offset=0
	MOVWF	_TMR1L
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PIR1bits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1bits
;; 	line = 6504 result AOP_PCODE=_PIR1bits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PIR1bits
;; >>> gen.c:6238:genPackBits
	.line	152; "newyears.c"	TMR1IF = 0;
	BCF	_PIR1bits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1009
;;	1028  _timer_running   offset=0
	.line	154; "newyears.c"	if(timer_running) {
	BANKSEL	_timer_running
	MOVF	_timer_running,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1009
;;	1028  _timer_running   offset=1
	IORWF	(_timer_running + 1),W
;; >>> gen.c:6794:genIfx
	BTFSC	STATUS,2
;; >>> gen.c:6795:genIfx
;; ***	popGetLabel  key=42, label offset 60
	GOTO	_00202_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=_digits, size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	155; "newyears.c"	--digits[0];
	BANKSEL	_digits
	MOVF	(_digits + 0),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 1),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7298:genDjnz *{*
;; ***	genDjnz  7299
;;; genarith.c:861:genMinus *{*
;; ***	genMinus  862
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;;; genarith.c:269:genAddLit *{*
;; ***	genAddLit  270
;; hi = ff	genAddLit  371
;; >>> genarith.c:382:genAddLit
	MOVLW	0xff
;; >>> genarith.c:383:genAddLit
;;	1108 rIdx = r0x1051 
	ADDWF	r0x1046,F
;; >>> genarith.c:384:genAddLit
	BTFSS	STATUS,0
;; >>> genarith.c:385:genAddLit
;;	1108 rIdx = r0x1052 
	DECF	r0x1045,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 0)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;;	694 register type nRegs=2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1108 rIdx = r0x1051 
	.line	157; "newyears.c"	if (!digits[0] && !digits[1] && !digits[2] && !digits[3]){
	BANKSEL	r0x1046
	MOVF	r0x1046,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1108 rIdx = r0x1052 
	IORWF	r0x1045,W
;; >>> gen.c:6789:genIfx
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=25, label offset 60
	GOTO	_00185_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 2
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+2), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 2),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 3),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
	IORWF	r0x1046,W
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=25, label offset 60
	GOTO	_00185_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 4
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+4), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 4),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 5),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
	IORWF	r0x1046,W
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=25, label offset 60
	GOTO	_00185_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 6
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+6), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 6),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 7),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
	IORWF	r0x1046,W
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=25, label offset 60
	GOTO	_00185_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	158; "newyears.c"	digits[0] = 3; 
	MOVLW	0x03
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 0)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	159; "newyears.c"	digits[1] = 1; 
	MOVLW	0x01
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	MOVWF	(_digits + 2)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 3)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	160; "newyears.c"	digits[2] = 0; 
	CLRF	(_digits + 4)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 5)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	161; "newyears.c"	digits[3] = 2;
	MOVLW	0x02
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	MOVWF	(_digits + 6)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 7)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _timer_running, size = 2
;; 	line = 6918 result AOP_DIR=_timer_running, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=0
	.line	162; "newyears.c"	timer_running = 0;
	BANKSEL	_timer_running
	CLRF	_timer_running
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _timer_running   offset=1
	CLRF	(_timer_running + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _finished, size = 2
;; 	line = 6918 result AOP_DIR=_finished, size=2, left -=-, size=0, right AOP_LIT=0x01, size=2
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	163; "newyears.c"	finished = 1;
	MOVLW	0x01
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _finished   offset=0
	BANKSEL	_finished
	MOVWF	_finished
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _finished   offset=1
	CLRF	(_finished + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=_digits, size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
_00185_DS_
	.line	166; "newyears.c"	if(digits[0] > 9) {
	BANKSEL	_digits
	MOVF	(_digits + 0),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 1),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3544:genCmpGt *{*
;; ***	genCmpGt  3545
;;	694 register type nRegs=2
;;; gen.c:3291:genCmp *{*
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x00
;; >>> gen.c:3429:genCmp
;;	1108 rIdx = r0x1052 
	SUBWF	r0x1045,W
;; >>> gen.c:3474:genCmp
	BTFSS	STATUS,2
;; >>> gen.c:3475:genCmp
;; ***	popGetLabel  key=92, label offset 60
	GOTO	_00252_DS_
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x0a
;; >>> gen.c:3477:genCmp
;;	1108 rIdx = r0x1051 
	SUBWF	r0x1046,W
;;; gen.c:3234:genSkipc *{*
;; >>> gen.c:3241:genSkipc
_00252_DS_
	BTFSS	STATUS,0
;; >>> gen.c:3243:genSkipc
;; ***	popGetLabel  key=30, label offset 60
	GOTO	_00190_DS_
;;genSkipc:3244: created from rifx:0x7fffd5bc2a80
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	167; "newyears.c"	digits[0] = 9;
	MOVLW	0x09
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 0)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 1)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 2
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+2), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	168; "newyears.c"	--digits[1];
	MOVF	(_digits + 2),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 3),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7298:genDjnz *{*
;; ***	genDjnz  7299
;;; genarith.c:861:genMinus *{*
;; ***	genMinus  862
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;;; genarith.c:269:genAddLit *{*
;; ***	genAddLit  270
;; hi = ff	genAddLit  371
;; >>> genarith.c:382:genAddLit
	MOVLW	0xff
;; >>> genarith.c:383:genAddLit
;;	1108 rIdx = r0x1051 
	ADDWF	r0x1046,F
;; >>> genarith.c:384:genAddLit
	BTFSS	STATUS,0
;; >>> genarith.c:385:genAddLit
;;	1108 rIdx = r0x1052 
	DECF	r0x1045,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 2)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 3)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 2
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+2), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
_00190_DS_
	.line	171; "newyears.c"	if(digits[1] > 5) {
	BANKSEL	_digits
	MOVF	(_digits + 2),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 3),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3544:genCmpGt *{*
;; ***	genCmpGt  3545
;;	694 register type nRegs=2
;;; gen.c:3291:genCmp *{*
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x6=6), size=2
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x00
;; >>> gen.c:3429:genCmp
;;	1108 rIdx = r0x1052 
	SUBWF	r0x1045,W
;; >>> gen.c:3474:genCmp
	BTFSS	STATUS,2
;; >>> gen.c:3475:genCmp
;; ***	popGetLabel  key=93, label offset 60
	GOTO	_00253_DS_
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x06
;; >>> gen.c:3477:genCmp
;;	1108 rIdx = r0x1051 
	SUBWF	r0x1046,W
;;; gen.c:3234:genSkipc *{*
;; >>> gen.c:3241:genSkipc
_00253_DS_
	BTFSS	STATUS,0
;; >>> gen.c:3243:genSkipc
;; ***	popGetLabel  key=32, label offset 60
	GOTO	_00192_DS_
;;genSkipc:3244: created from rifx:0x7fffd5bc2a80
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 2, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	172; "newyears.c"	digits[1] = 5;
	MOVLW	0x05
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 2)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 3)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 4
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+4), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	173; "newyears.c"	--digits[2];
	MOVF	(_digits + 4),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 5),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7298:genDjnz *{*
;; ***	genDjnz  7299
;;; genarith.c:861:genMinus *{*
;; ***	genMinus  862
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;;; genarith.c:269:genAddLit *{*
;; ***	genAddLit  270
;; hi = ff	genAddLit  371
;; >>> genarith.c:382:genAddLit
	MOVLW	0xff
;; >>> genarith.c:383:genAddLit
;;	1108 rIdx = r0x1051 
	ADDWF	r0x1046,F
;; >>> genarith.c:384:genAddLit
	BTFSS	STATUS,0
;; >>> genarith.c:385:genAddLit
;;	1108 rIdx = r0x1052 
	DECF	r0x1045,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 4)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 5)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 4
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+4), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
_00192_DS_
	.line	176; "newyears.c"	if(digits[2] > 9) {
	BANKSEL	_digits
	MOVF	(_digits + 4),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 5),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3544:genCmpGt *{*
;; ***	genCmpGt  3545
;;	694 register type nRegs=2
;;; gen.c:3291:genCmp *{*
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x00
;; >>> gen.c:3429:genCmp
;;	1108 rIdx = r0x1052 
	SUBWF	r0x1045,W
;; >>> gen.c:3474:genCmp
	BTFSS	STATUS,2
;; >>> gen.c:3475:genCmp
;; ***	popGetLabel  key=94, label offset 60
	GOTO	_00254_DS_
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x0a
;; >>> gen.c:3477:genCmp
;;	1108 rIdx = r0x1051 
	SUBWF	r0x1046,W
;;; gen.c:3234:genSkipc *{*
;; >>> gen.c:3241:genSkipc
_00254_DS_
	BTFSS	STATUS,0
;; >>> gen.c:3243:genSkipc
;; ***	popGetLabel  key=34, label offset 60
	GOTO	_00194_DS_
;;genSkipc:3244: created from rifx:0x7fffd5bc2a80
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 4, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	177; "newyears.c"	digits[2] = 9;
	MOVLW	0x09
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 4)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 5)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 6
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+6), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	.line	178; "newyears.c"	--digits[3];
	MOVF	(_digits + 6),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 7),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7298:genDjnz *{*
;; ***	genDjnz  7299
;;; genarith.c:861:genMinus *{*
;; ***	genMinus  862
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;;; genarith.c:269:genAddLit *{*
;; ***	genAddLit  270
;; hi = ff	genAddLit  371
;; >>> genarith.c:382:genAddLit
	MOVLW	0xff
;; >>> genarith.c:383:genAddLit
;;	1108 rIdx = r0x1051 
	ADDWF	r0x1046,F
;; >>> genarith.c:384:genAddLit
	BTFSS	STATUS,0
;; >>> genarith.c:385:genAddLit
;;	1108 rIdx = r0x1052 
	DECF	r0x1045,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;	694 register type nRegs=2
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1051 
	MOVF	r0x1046,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 6)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6462:genDataPointerSet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVF	r0x1045,W
;; >>> gen.c:6463:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 7)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:5861:genDataPointerGet *{*
;; ***	genDataPointerGet  5862
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits offset 6
;; 	line = 5874 result AOP_REG=r0x1051, size=2, left AOP_PCODE=(_digits+6), size=2, right -=-, size=0
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
_00194_DS_
	.line	181; "newyears.c"	if(digits[3] > 9) {
	BANKSEL	_digits
	MOVF	(_digits + 6),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1051 
	BANKSEL	r0x1046
	MOVWF	r0x1046
;; >>> gen.c:5885:genDataPointerGet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	BANKSEL	_digits
	MOVF	(_digits + 7),W
;; >>> gen.c:5886:genDataPointerGet
;;	1108 rIdx = r0x1052 
	BANKSEL	r0x1045
	MOVWF	r0x1045
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3544:genCmpGt *{*
;; ***	genCmpGt  3545
;;	694 register type nRegs=2
;;; gen.c:3291:genCmp *{*
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xA=10), size=2
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x00
;; >>> gen.c:3429:genCmp
;;	1108 rIdx = r0x1052 
	SUBWF	r0x1045,W
;; >>> gen.c:3474:genCmp
	BTFSS	STATUS,2
;; >>> gen.c:3475:genCmp
;; ***	popGetLabel  key=95, label offset 60
	GOTO	_00255_DS_
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x0a
;; >>> gen.c:3477:genCmp
;;	1108 rIdx = r0x1051 
	SUBWF	r0x1046,W
;;; gen.c:3234:genSkipc *{*
;; >>> gen.c:3241:genSkipc
_00255_DS_
	BTFSS	STATUS,0
;; >>> gen.c:3243:genSkipc
;; ***	popGetLabel  key=42, label offset 60
	GOTO	_00202_DS_
;;genSkipc:3244: created from rifx:0x7fffd5bc2a80
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 6, const = 0
;;; gen.c:6407:genDataPointerSet *{*
;; ***	genDataPointerSet  6408
;;gen.c:6442: size=1/2, offset=0, AOP_TYPE(res)=8
;; >>> gen.c:6451:genDataPointerSet
	.line	182; "newyears.c"	digits[3] = 9;
	MOVLW	0x09
;; >>> gen.c:6452:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 0) 1129 _digits
	BANKSEL	_digits
	MOVWF	(_digits + 6)
;;gen.c:6442: size=0/2, offset=1, AOP_TYPE(res)=8
;; >>> gen.c:6456:genDataPointerSet
;;	popGet AOP_PCODE (PO_IMMEDIATE + 1) 1129 _digits
	CLRF	(_digits + 7)
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2522:genEndFunction *{*
;; ***	genEndFunction  2524
;;; gen.c:2022:unsaverbank *{*
;; ***	unsaverbank  2024 - WARNING no code generated
;; >>> gen.c:2619:genEndFunction
_00202_DS_
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
;; >>> gen.c:2620:genEndFunction
	BANKSEL	FSR
	MOVWF	FSR
;; >>> gen.c:2622:genEndFunction
	MOVF	PSAVE,W
;; >>> gen.c:2623:genEndFunction
	MOVWF	PCLATH
;; >>> gen.c:2624:genEndFunction
	CLRF	STATUS
;; >>> gen.c:2626:genEndFunction
	SWAPF	SSAVE,W
;; >>> gen.c:2627:genEndFunction
	MOVWF	STATUS
;; >>> gen.c:2628:genEndFunction
	SWAPF	WSAVE,F
;; >>> gen.c:2629:genEndFunction
	SWAPF	WSAVE,W
END_OF_INTERRUPT
	RETFIE	
;;; gen.c:7407:genpic14Code *{*

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_newyears	code
;***
;  pBlock Stats: dbName = M
;***
;entry:  _main	;Function start
; 2 exit points
;has an exit
;functions called:
;   _delay
;   __mulint
;   _shift_out
;   _delay
;   __mulint
;   _shift_out
;11 compiler assigned registers:
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   r0x1042
;   r0x1043
;   r0x1044
;   STK02
;   STK01
;   STK00
;; Starting pCode block
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2339:genFunction *{*
;; ***	genFunction  2341 curr label offset=60previous max_key=95 
_main	;Function start
; 2 exit points
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _OPTION_REG, size = 1
;; 	line = 6918 result AOP_DIR=_OPTION_REG, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _OPTION_REG   offset=0
	.line	189; "newyears.c"	OPTION_REG = 0b00000000;
	BANKSEL	_OPTION_REG
	CLRF	_OPTION_REG
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TRISA, size = 1
;; 	line = 6918 result AOP_DIR=_TRISA, size=1, left -=-, size=0, right AOP_LIT=0x07, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	192; "newyears.c"	TRISA      = 0b00000111;
	MOVLW	0x07
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _TRISA   offset=0
	MOVWF	_TRISA
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TRISB, size = 1
;; 	line = 6918 result AOP_DIR=_TRISB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _TRISB   offset=0
	.line	193; "newyears.c"	TRISB      = 0b00000000;
	CLRF	_TRISB
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TRISC, size = 1
;; 	line = 6918 result AOP_DIR=_TRISC, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _TRISC   offset=0
	.line	194; "newyears.c"	TRISC      = 0b00000000;
	CLRF	_TRISC
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _PORTB, size = 1
;; 	line = 6918 result AOP_DIR=_PORTB, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _PORTB   offset=0
	.line	195; "newyears.c"	PORTB      = 0b00000000;
	BANKSEL	_PORTB
	CLRF	_PORTB
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _PORTC, size = 1
;; 	line = 6918 result AOP_DIR=_PORTC, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _PORTC   offset=0
	.line	196; "newyears.c"	PORTC      = 0b00000000;
	CLRF	_PORTC
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _WPUA, size = 1
;; 	line = 6918 result AOP_DIR=_WPUA, size=1, left -=-, size=0, right AOP_LIT=0x07, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	197; "newyears.c"	WPUA       = 0b00000111;
	MOVLW	0x07
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _WPUA   offset=0
	BANKSEL	_WPUA
	MOVWF	_WPUA
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _OSCCON, size = 1
;; 	line = 6918 result AOP_DIR=_OSCCON, size=1, left -=-, size=0, right AOP_LIT=0x50, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	200; "newyears.c"	OSCCON     = 0b01010000;
	MOVLW	0x50
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _OSCCON   offset=0
	MOVWF	_OSCCON
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _INTCON, size = 1
;; 	line = 6918 result AOP_DIR=_INTCON, size=1, left -=-, size=0, right AOP_LIT=0xc8, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	203; "newyears.c"	INTCON     = 0b11001000;
	MOVLW	0xc8
;; >>> gen.c:7013:genAssign
;;	1009
;;	1024  _INTCON   offset=0 - had to alloc by reg name
	BANKSEL	_INTCON
	MOVWF	_INTCON
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _PIE1, size = 1
;; 	line = 6918 result AOP_DIR=_PIE1, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	204; "newyears.c"	PIE1       = 0b00000001;
	MOVLW	0x01
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _PIE1   offset=0
	BANKSEL	_PIE1
	MOVWF	_PIE1
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _PIE2, size = 1
;; 	line = 6918 result AOP_DIR=_PIE2, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _PIE2   offset=0
	.line	205; "newyears.c"	PIE2       = 0b00000000;
	CLRF	_PIE2
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _IOCA, size = 1
;; 	line = 6918 result AOP_DIR=_IOCA, size=1, left -=-, size=0, right AOP_LIT=0x07, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	206; "newyears.c"	IOCA       = 0b00000111;
	MOVLW	0x07
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _IOCA   offset=0
	MOVWF	_IOCA
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _SPBRGH, size = 1
;; 	line = 6918 result AOP_DIR=_SPBRGH, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _SPBRGH   offset=0
	.line	211; "newyears.c"	SPBRGH     = 0b00000000;
	CLRF	_SPBRGH
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _SPBRG, size = 1
;; 	line = 6918 result AOP_DIR=_SPBRG, size=1, left -=-, size=0, right AOP_LIT=0x01, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	212; "newyears.c"	SPBRG      = 0b00000001;
	MOVLW	0x01
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _SPBRG   offset=0
	MOVWF	_SPBRG
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _BAUDCTL, size = 1
;; 	line = 6918 result AOP_DIR=_BAUDCTL, size=1, left -=-, size=0, right AOP_LIT=0x50, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	213; "newyears.c"	BAUDCTL    = 0b01010000;
	MOVLW	0x50
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _BAUDCTL   offset=0
	MOVWF	_BAUDCTL
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _RCSTA, size = 1
;; 	line = 6918 result AOP_DIR=_RCSTA, size=1, left -=-, size=0, right AOP_LIT=0x80, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	214; "newyears.c"	RCSTA      = 0b10000000;
	MOVLW	0x80
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _RCSTA   offset=0
	BANKSEL	_RCSTA
	MOVWF	_RCSTA
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TXSTA, size = 1
;; 	line = 6918 result AOP_DIR=_TXSTA, size=1, left -=-, size=0, right AOP_LIT=0xb0, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	215; "newyears.c"	TXSTA      = 0b10110000;
	MOVLW	0xb0
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _TXSTA   offset=0
	BANKSEL	_TXSTA
	MOVWF	_TXSTA
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _ANSEL, size = 1
;; 	line = 6918 result AOP_DIR=_ANSEL, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _ANSEL   offset=0
	.line	218; "newyears.c"	ANSEL      = 0b00000000;
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _ANSELH, size = 1
;; 	line = 6918 result AOP_DIR=_ANSELH, size=1, left -=-, size=0, right AOP_LIT=0x00, size=1
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1009
;;	1028  _ANSELH   offset=0
	.line	219; "newyears.c"	ANSELH     = 0b00000000;
	CLRF	_ANSELH
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _T1CON, size = 1
;; 	line = 6918 result AOP_DIR=_T1CON, size=1, left -=-, size=0, right AOP_LIT=0x38, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	222; "newyears.c"	T1CON  = 0b00111000;
	MOVLW	0x38
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _T1CON   offset=0
	BANKSEL	_T1CON
	MOVWF	_T1CON
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TMR1H, size = 1
;; 	line = 6918 result AOP_DIR=_TMR1H, size=1, left -=-, size=0, right AOP_LIT=0x0b, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	223; "newyears.c"	TMR1H  = 0b00001011;
	MOVLW	0x0b
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _TMR1H   offset=0
	MOVWF	_TMR1H
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;; ***	aopForSym 315
;;	327 sym->rname = _TMR1L, size = 1
;; 	line = 6918 result AOP_DIR=_TMR1L, size=1, left -=-, size=0, right AOP_LIT=0xdc, size=1
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	224; "newyears.c"	TMR1L  = 0b11011100;
	MOVLW	0xdc
;; >>> gen.c:7013:genAssign
;;	1009
;;	1028  _TMR1L   offset=0
	MOVWF	_TMR1L
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2085:genCall *{*
;; ***	genCall  2087
;;; gen.c:1800:saveRegisters *{*
;; ***	saveRegisters  1802
;; >>> gen.c:2174:genCall
	.line	226; "newyears.c"	delay();
	CALL	_delay
;;; gen.c:1844:unsaveRegisters *{*
;; ***	unsaveRegisters  1846
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _T1CONbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_T1CONbits
;; 	line = 6504 result AOP_PCODE=_T1CONbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_T1CONbits
;; >>> gen.c:6238:genPackBits
	.line	228; "newyears.c"	TMR1ON = 1;
	BANKSEL	_T1CONbits
	BSF	_T1CONbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;;	694 register type nRegs=2
;; 	line = 6918 result AOP_REG=r0x105A, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x105A 
_00279_DS_
	.line	233; "newyears.c"	for (i=0; i < 4; i++) {
	BANKSEL	r0x103D
	CLRF	r0x103D
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x105B 
	CLRF	r0x103E
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;;	694 register type nRegs=2
;; 	line = 6918 result AOP_REG=r0x105C, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x105C 
	CLRF	r0x103F
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x105D 
	CLRF	r0x1040
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3580:genCmpLt *{*
;; ***	genCmpLt  3581
;;	694 register type nRegs=2
;;; gen.c:3291:genCmp *{*
;;unsigned compare: left < lit(0x4=4), size=2
;; >>> gen.c:3262:pic14_mov2w_regOrLit
_00267_DS_
	MOVLW	0x00
;; >>> gen.c:3429:genCmp
;;	1108 rIdx = r0x105B 
	BANKSEL	r0x103E
	SUBWF	r0x103E,W
;; >>> gen.c:3474:genCmp
	BTFSS	STATUS,2
;; >>> gen.c:3475:genCmp
;; ***	popGetLabel  key=33, label offset 159
	GOTO	_00292_DS_
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x04
;; >>> gen.c:3477:genCmp
;;	1108 rIdx = r0x105A 
	SUBWF	r0x103D,W
;;; gen.c:3234:genSkipc *{*
;; >>> gen.c:3239:genSkipc
_00292_DS_
	BTFSC	STATUS,0
;; >>> gen.c:3243:genSkipc
;; ***	popGetLabel  key=11, label offset 159
	GOTO	_00270_DS_
;;genSkipc:3244: created from rifx:0x7fffd5bc2a80
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;; ***	genPlus  576
;;; genarith.c:577:genPlus *{*
;;	613
;;	aopForRemat 392
;;	418: rname _digits, val 0, const = 0
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits
;; 	line = 583 result AOP_REG=r0x105E, size=2, left AOP_PCODE=_digits, size=2, right AOP_REG=r0x105C, size=2
;;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_PCODE, right AOP_REG
;; ***	genPlus  682
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_digits
;; >>> genarith.c:691:genPlus
;;	1108 rIdx = r0x105C 
	.line	234; "newyears.c"	digit = display_map[digits[i]];
	BANKSEL	r0x103F
	MOVF	r0x103F,W
;; >>> genarith.c:700:genPlus
	ADDLW	(_digits + 0)
;; >>> genarith.c:701:genPlus
;;	1108 rIdx = r0x105E 
	MOVWF	r0x1041
;; >>> genarith.c:736:genPlus
	MOVLW	high (_digits + 0)
;; >>> genarith.c:737:genPlus
;;	1108 rIdx = r0x105F 
	MOVWF	r0x1042
;; >>> genarith.c:739:genPlus
;;	1108 rIdx = r0x105D 
	MOVF	r0x1040,W
;; >>> genarith.c:740:genPlus
	BTFSC	STATUS,0
;; >>> genarith.c:741:genPlus
;;	1108 rIdx = r0x105D 
	INCFSZ	r0x1040,W
;; >>> genarith.c:742:genPlus
;;	1108 rIdx = r0x105F 
	ADDWF	r0x1042,F
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	694 register type nRegs=2
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=2
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x105E 
	MOVF	r0x1041,W
;; >>> gen.c:5600:setup_fsr
	BANKSEL	FSR
	MOVWF	FSR
;;; gen.c:5556:SetIrp *{*
;; >>> gen.c:5577:SetIrp
	BCF	STATUS,7
;; >>> gen.c:5580:SetIrp
	BANKSEL	r0x1042
	BTFSC	r0x1042,0
;; >>> gen.c:5581:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  5951
;; >>> gen.c:5958:genNearPointerGet
	BANKSEL	INDF
	MOVF	INDF,W
;; >>> gen.c:5965:genNearPointerGet
;;	1108 rIdx = r0x1060 
	BANKSEL	r0x1043
	MOVWF	r0x1043
;; >>> gen.c:5628:inc_fsr
	BANKSEL	FSR
	INCF	FSR,F
;; >>> gen.c:5958:genNearPointerGet
	MOVF	INDF,W
;; >>> gen.c:5965:genNearPointerGet
;;	1108 rIdx = r0x1061 
	BANKSEL	r0x1044
	MOVWF	r0x1044
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2085:genCall *{*
;; ***	genCall  2087
;;; gen.c:1800:saveRegisters *{*
;; ***	saveRegisters  1802
;;	694 register type nRegs=2
;;	694 register type nRegs=2
;; 	2134 left AOP_REG
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1060 
	MOVF	r0x1043,W
;; 	2134 left AOP_REG
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7d
	MOVWF	STK02
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1061 
	MOVF	r0x1044,W
;; 	2134 left AOP_LIT
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7e
	MOVWF	STK01
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x02
;; 	2134 left AOP_LIT
;; >>> gen.c:2142:genCall
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2172:genCall
	PAGESEL	__mulint
;; >>> gen.c:2174:genCall
	CALL	__mulint
;; >>> gen.c:2180:genCall
	PAGESEL	$
;;	694 register type nRegs=2
;;; gen.c:1906:assignResultValue *{*
;; ***	assignResultValue  1908
;; 	line = 1910 result -=-, size=0, left AOP_REG=r0x105E, size=2, right -=-, size=0
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x105F 
	BANKSEL	r0x1042
	MOVWF	r0x1042
;; >>> gen.c:1422:get_returnvalue
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVF	STK00,W
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x105E 
	MOVWF	r0x1041
	ADDLW	(_display_map + 0)
;; >>> genarith.c:701:genPlus
;;	1108 rIdx = r0x105E 
	MOVWF	r0x1041
;; >>> genarith.c:714:genPlus
;;	1108 rIdx = r0x105F 
	MOVF	r0x1042,W
;; >>> genarith.c:715:genPlus
	BTFSC	STATUS,0
;; >>> genarith.c:716:genPlus
;;	1108 rIdx = r0x105F 
	INCFSZ	r0x1042,W
;; >>> genarith.c:717:genPlus
	ADDLW	high (_display_map + 0)
;; >>> genarith.c:718:genPlus
;;	1108 rIdx = r0x105F 
	MOVWF	r0x1042
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	694 register type nRegs=2
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=2
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x105E 
	MOVF	r0x1041,W
;; >>> gen.c:5600:setup_fsr
	BANKSEL	FSR
	MOVWF	FSR
;;; gen.c:5556:SetIrp *{*
;; >>> gen.c:5577:SetIrp
	BCF	STATUS,7
;; >>> gen.c:5580:SetIrp
	BANKSEL	r0x1042
	BTFSC	r0x1042,0
;; >>> gen.c:5581:SetIrp
	BSF	STATUS,7
;; ***	genNearPointerGet  5951
;; >>> gen.c:5958:genNearPointerGet
	BANKSEL	INDF
	MOVF	INDF,W
;; >>> gen.c:5965:genNearPointerGet
;;	1108 rIdx = r0x1060 
	BANKSEL	r0x1043
	MOVWF	r0x1043
;; >>> gen.c:5628:inc_fsr
	BANKSEL	FSR
	INCF	FSR,F
;; >>> gen.c:5958:genNearPointerGet
	MOVF	INDF,W
;; >>> gen.c:5965:genNearPointerGet
;;	1108 rIdx = r0x1061 
	BANKSEL	r0x1044
	MOVWF	r0x1044
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;; ***	aopForSym 315
;;	327 sym->rname = _finished, size = 2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1009
;;	1028  _finished   offset=0
	.line	236; "newyears.c"	if (!finished && (i == 1 || i == 2)) {
	BANKSEL	_finished
	MOVF	_finished,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1009
;;	1028  _finished   offset=1
	IORWF	(_finished + 1),W
;; >>> gen.c:6789:genIfx
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=2, label offset 159
	GOTO	_00001_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3616:genCmpEq *{*
;; ***	genCmpEq  3617
;; ifx is non-null
;;	694 register type nRegs=2
;; 	line = 3628 result AOP_CRY=0x00, size=0, left AOP_REG=r0x105A, size=2, right AOP_LIT=0x01, size=2
;; ***	mov2w  1380  offset=0
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x105A 
	BANKSEL	r0x103D
	MOVF	r0x103D,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0x01
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=34, label offset 159
	GOTO	_00293_DS_
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x105B 
	MOVF	r0x103E,W
;; >>> gen.c:3682:genCmpEq
	XORLW	0x00
	BTFSC	STATUS,2
	GOTO	_00260_DS_
_00293_DS_
	BANKSEL	r0x103D
	MOVF	r0x103D,W
	XORLW	0x02
;; >>> gen.c:3684:genCmpEq
	BTFSS	STATUS,2
;; >>> gen.c:3687:genCmpEq
;; ***	popGetLabel  key=2, label offset 159
	GOTO	_00001_DS_
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x105B 
	MOVF	r0x103E,W
;; >>> gen.c:3682:genCmpEq
	.line	237; "newyears.c"	digit |= 0b00010000;
	XORLW	0x00
	.line	240; "newyears.c"	shift_out(digit);
	BTFSS	STATUS,2
	GOTO	_00001_DS_
_00260_DS_
	BANKSEL	r0x1043
	BSF	r0x1043,4
_00001_DS_
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1061 
	MOVF	r0x1044,W
;; >>> gen.c:2174:genCall
	CALL	_shift_out
;;; gen.c:1844:unsaveRegisters *{*
;; ***	unsaveRegisters  1846
;;; gen.c:2315:resultRemat *{*
;; ***	genPlus  576
;;; genarith.c:577:genPlus *{*
;;	694 register type nRegs=2
;;	575
;; 	line = 583 result AOP_REG=r0x105C, size=2, left AOP_REG=r0x105C, size=2, right AOP_LIT=0x02, size=1
;;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  156
;; 	genPlusIncr  180
;;	adding lit to something. size 2
;;; genarith.c:269:genAddLit *{*
;; ***	genAddLit  270
;; hi = 0	genAddLit  324
;; >>> genarith.c:340:genAddLit
	.line	233; "newyears.c"	for (i=0; i < 4; i++) {
	MOVLW	0x02
;; >>> genarith.c:341:genAddLit
;;	1108 rIdx = r0x105C 
	BANKSEL	r0x103F
	ADDWF	r0x103F,F
;; >>> genarith.c:342:genAddLit
	BTFSC	STATUS,0
;; >>> genarith.c:343:genAddLit
;;	1108 rIdx = r0x105D 
	INCF	r0x1040,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;; ***	genPlus  576
;;; genarith.c:577:genPlus *{*
;;	694 register type nRegs=2
;;	575
;; 	line = 583 result AOP_REG=r0x105A, size=2, left AOP_REG=r0x105A, size=2, right AOP_LIT=0x01, size=1
;;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  156
;; >>> genarith.c:168:genPlusIncr
;;	1108 rIdx = r0x105A 
	INCF	r0x103D,F
;; >>> genarith.c:172:genPlusIncr
	BTFSC	STATUS,2
;; >>> genarith.c:173:genPlusIncr
;;	1108 rIdx = r0x105B 
	INCF	r0x103E,F
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2775:genGoto *{*
;; >>> gen.c:2777:genGoto
;; ***	popGetLabel  key=8, label offset 159
	GOTO	_00267_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTBbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; 	line = 6504 result AOP_PCODE=_PORTBbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; >>> gen.c:6238:genPackBits
_00270_DS_
	.line	243; "newyears.c"	RB6 = 1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;;	694 register type nRegs=2
;; 	line = 6918 result AOP_REG=r0x105A, size=2, left -=-, size=0, right AOP_LIT=0x64, size=2
;; ***	genAssign  7004
;; >>> gen.c:7011:genAssign
	.line	244; "newyears.c"	for (i=0; i<100; i++);
	MOVLW	0x64
;; >>> gen.c:7013:genAssign
;;	1108 rIdx = r0x105A 
	BANKSEL	r0x103D
	MOVWF	r0x103D
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x105B 
	CLRF	r0x103E
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7298:genDjnz *{*
;; ***	genDjnz  7299
;;; genarith.c:861:genMinus *{*
;; ***	genMinus  862
;;	694 register type nRegs=2
;;	575
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;;; genarith.c:269:genAddLit *{*
;; ***	genAddLit  270
;; hi = ff	genAddLit  371
;; >>> genarith.c:382:genAddLit
_00273_DS_
	MOVLW	0xff
;; >>> genarith.c:383:genAddLit
;;	1108 rIdx = r0x105A 
	BANKSEL	r0x103D
	ADDWF	r0x103D,F
;; >>> genarith.c:384:genAddLit
	BTFSS	STATUS,0
;; >>> genarith.c:385:genAddLit
;;	1108 rIdx = r0x105B 
	DECF	r0x103E,F
;; ***	addSign  826
;;; genarith.c:827:addSign *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6740:genIfx *{*
;; ***	genIfx  6741
;;	694 register type nRegs=2
;; ***	pic14_toBoolean  1514
;; >>> gen.c:1526:pic14_toBoolean
;;	1108 rIdx = r0x105A 
	MOVF	r0x103D,W
;; >>> gen.c:1532:pic14_toBoolean
;;	1108 rIdx = r0x105B 
	IORWF	r0x103E,W
;; >>> gen.c:6789:genIfx
	BTFSS	STATUS,2
;; >>> gen.c:6790:genIfx
;; ***	popGetLabel  key=14, label offset 159
	GOTO	_00273_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTBbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; 	line = 6504 result AOP_PCODE=_PORTBbits, size=2, left -=-, size=0, right AOP_LIT=0x00, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; >>> gen.c:6238:genPackBits
	.line	245; "newyears.c"	RB6 = 0;
	BANKSEL	_PORTBbits
	BCF	_PORTBbits,6
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2775:genGoto *{*
;; >>> gen.c:2777:genGoto
;; ***	popGetLabel  key=20, label offset 159
	GOTO	_00279_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2522:genEndFunction *{*
;; ***	genEndFunction  2524
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;entry:  _shift_out	;Function start
; 2 exit points
;has an exit
;3 compiler assigned registers:
;   r0x103B
;   STK00
;   r0x103C
;; Starting pCode block
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2339:genFunction *{*
;; ***	genFunction  2341 curr label offset=41previous max_key=7 
_shift_out	;Function start
; 2 exit points
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7339:genReceive *{*
;; ***	genReceive  7340
;;	694 register type nRegs=2
;;; gen.c:1906:assignResultValue *{*
;; ***	assignResultValue  1908
;; 	line = 1910 result -=-, size=0, left AOP_REG=r0x104C, size=2, right -=-, size=0
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x104D 
;;1	MOVWF	r0x103B
;; >>> gen.c:1422:get_returnvalue
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	.line	91; "newyears.c"	void shift_out(unsigned int value) {
	MOVF	STK00,W
;; >>> gen.c:1392:movwf
;;	1108 rIdx = r0x104C 
	BANKSEL	r0x103C
	MOVWF	r0x103C
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _TXSTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTAbits
;; >>> gen.c:5764:genUnpackBits
_00153_DS_
	.line	92; "newyears.c"	while(!TRMT);
	BANKSEL	_TXSTAbits
	BTFSS	_TXSTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=1, label offset 52
	GOTO	_00153_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:7101:genCast *{*
;; ***	genCast  7102
;;	694 register type nRegs=2
;; ***	aopForSym 315
;;	327 sym->rname = _TXREG, size = 1
;; 	line = 7110 result AOP_DIR=_TXREG, size=1, left -=-, size=0, right AOP_REG=r0x104C, size=2
;; ***	genCast  7234
;; >>> gen.c:7258:genCast
;;	1108 rIdx = r0x104C 
	.line	94; "newyears.c"	TXREG = value;
	BANKSEL	r0x103C
	MOVF	r0x103C,W
;; >>> gen.c:7259:genCast
;;	1009
;;	1028  _TXREG   offset=0
	BANKSEL	_TXREG
	MOVWF	_TXREG
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _TXSTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_TXSTAbits
;; >>> gen.c:5764:genUnpackBits
_00156_DS_
	.line	96; "newyears.c"	while(!TRMT);
	BANKSEL	_TXSTAbits
	BTFSS	_TXSTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=4, label offset 52
	GOTO	_00156_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2522:genEndFunction *{*
;; ***	genEndFunction  2524
	RETURN	
; exit point of _shift_out
;;; gen.c:7407:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _find_keypad_column	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   STK00
;; Starting pCode block
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2339:genFunction *{*
;; ***	genFunction  2341 curr label offset=20previous max_key=17 
_find_keypad_column	;Function start
; 2 exit points
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	.line	84; "newyears.c"	if(!CLM1) return 0;
	BANKSEL	_PORTAbits
	BTFSC	_PORTAbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=2, label offset 41
	GOTO	_00143_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=7, label offset 41
	GOTO	_00148_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
_00143_DS_
	.line	85; "newyears.c"	if(!CLM2) return 1;
	BANKSEL	_PORTAbits
	BTFSC	_PORTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=4, label offset 41
	GOTO	_00145_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x01
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=7, label offset 41
	GOTO	_00148_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
_00145_DS_
	.line	86; "newyears.c"	if(!CLM3) return 2;
	BANKSEL	_PORTAbits
	BTFSC	_PORTAbits,2
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=6, label offset 41
	GOTO	_00147_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x02
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=7, label offset 41
	GOTO	_00148_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
_00147_DS_
	.line	88; "newyears.c"	return -1;
	MOVLW	0xff
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0xff
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2522:genEndFunction *{*
;; ***	genEndFunction  2524
_00148_DS_
	RETURN	
; exit point of _find_keypad_column
;;; gen.c:7407:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _find_keypad_row	;Function start
; 2 exit points
;has an exit
;1 compiler assigned register :
;   STK00
;; Starting pCode block
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2339:genFunction *{*
;; ***	genFunction  2341 curr label offset=4previous max_key=12 
_find_keypad_row	;Function start
; 2 exit points
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; >>> gen.c:6238:genPackBits
	.line	60; "newyears.c"	ROWA = 1;
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,2
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	.line	61; "newyears.c"	if (CLM1 && CLM2 && CLM3) {
	BTFSS	_PORTAbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=2, label offset 20
	GOTO	_00122_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=2, label offset 20
	GOTO	_00122_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,2
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=2, label offset 20
	GOTO	_00122_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	.line	62; "newyears.c"	return 0;
	MOVLW	0x00
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=17, label offset 20
	GOTO	_00137_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTBbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; 	line = 6504 result AOP_PCODE=_PORTBbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTBbits
;; >>> gen.c:6238:genPackBits
_00122_DS_
	.line	65; "newyears.c"	ROWB = 1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,4
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	.line	66; "newyears.c"	if (CLM1 && CLM2 && CLM3) {
	BTFSS	_PORTAbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=6, label offset 20
	GOTO	_00126_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=6, label offset 20
	GOTO	_00126_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,2
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=6, label offset 20
	GOTO	_00126_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	.line	67; "newyears.c"	return 1;
	MOVLW	0x01
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=17, label offset 20
	GOTO	_00137_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; >>> gen.c:6238:genPackBits
_00126_DS_
	.line	70; "newyears.c"	ROWC = 1;
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,1
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	.line	71; "newyears.c"	if (CLM1 && CLM2 && CLM3) {
	BTFSS	_PORTAbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=10, label offset 20
	GOTO	_00130_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=10, label offset 20
	GOTO	_00130_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,2
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=10, label offset 20
	GOTO	_00130_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	.line	72; "newyears.c"	return 2;
	MOVLW	0x02
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=17, label offset 20
	GOTO	_00137_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6667:genPointerSet *{*
;; ***	genPointerSet  6668
;;; gen.c:6486:genNearPointerSet *{*
;; ***	genNearPointerSet  6487
;;	613
;;	aopForRemat 392
;;	418: rname _PORTCbits, val 0, const = 0
;; ***	genNearPointerSet  6502
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; 	line = 6504 result AOP_PCODE=_PORTCbits, size=2, left -=-, size=0, right AOP_LIT=0x01, size=1
;;; gen.c:6212:genPackBits *{*
;; ***	genPackBits  6213
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTCbits
;; >>> gen.c:6238:genPackBits
_00130_DS_
	.line	75; "newyears.c"	ROWD = 1;
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,0
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	.line	76; "newyears.c"	if (CLM1 && CLM2 && CLM3) {
	BTFSS	_PORTAbits,0
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=14, label offset 20
	GOTO	_00134_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,1
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=14, label offset 20
	GOTO	_00134_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6125:genPointerGet *{*
;; ***	genPointerGet  6126
;;; gen.c:5907:genNearPointerGet *{*
;; ***	genNearPointerGet  5908
;;	613
;;	aopForRemat 392
;;	418: rname _PORTAbits, val 0, const = 0
;; ***	genNearPointerGet  5924
;;	694 register type nRegs=1
;;; gen.c:5741:genUnpackBits *{*
;; ***	genUnpackBits  5742
;;	833: aopGet AOP_PCODE type PO_IMMEDIATE
;;	_PORTAbits
;; >>> gen.c:5764:genUnpackBits
	BTFSS	_PORTAbits,2
;; >>> gen.c:5765:genUnpackBits
;; ***	popGetLabel  key=14, label offset 20
	GOTO	_00134_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	.line	77; "newyears.c"	return 3;
	MOVLW	0x03
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0x00
;; >>> gen.c:2706:genRet
;; ***	popGetLabel  key=17, label offset 20
	GOTO	_00137_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2680:genRet *{*
;; ***	genRet  2682
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
_00134_DS_
	.line	80; "newyears.c"	return -1;
	MOVLW	0xff
;; >>> gen.c:1415:pass_argument
;; ***	popRegFromIdx,1042  , rIdx=0x7f
	MOVWF	STK00
;;; gen.c:1342:mov2w_op *{*
;; >>> gen.c:1360:mov2w_op
	MOVLW	0xff
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2522:genEndFunction *{*
;; ***	genEndFunction  2524
_00137_DS_
	RETURN	
; exit point of _find_keypad_row
;;; gen.c:7407:genpic14Code *{*

;***
;  pBlock Stats: dbName = C
;***
;entry:  _delay	;Function start
; 2 exit points
;has an exit
;2 compiler assigned registers:
;   r0x103B
;   r0x103C
;; Starting pCode block
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2339:genFunction *{*
;; ***	genFunction  2341 curr label offset=0previous max_key=0 
_delay	;Function start
; 2 exit points
;;; gen.c:2315:resultRemat *{*
;;; gen.c:6908:genAssign *{*
;; ***	genAssign  6909
;;	694 register type nRegs=2
;; 	line = 6918 result AOP_REG=r0x1048, size=2, left -=-, size=0, right AOP_LIT=0x00, size=2
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x1048 
	.line	56; "newyears.c"	for (i=0;i<8000;i++) k=i*2.1;
	BANKSEL	r0x103B
	CLRF	r0x103B
;; ***	genAssign  7004
;; >>> gen.c:7016:genAssign
;;	1108 rIdx = r0x1049 
	CLRF	r0x103C
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:3580:genCmpLt *{*
;; ***	genCmpLt  3581
;;	694 register type nRegs=2
;;; gen.c:3291:genCmp *{*
;;signed compare: left < lit(0x1F40=8000), size=2, mask=ffff
;; ***	mov2w  1380  offset=1
;; >>> gen.c:1385:mov2w
;;	1108 rIdx = r0x1049 
_00105_DS_
	BANKSEL	r0x103C
	MOVF	r0x103C,W
;; >>> gen.c:3451:genCmp
	ADDLW	0x80
;; >>> gen.c:3452:genCmp
	ADDLW	0x61
;; >>> gen.c:3474:genCmp
	BTFSS	STATUS,2
;; >>> gen.c:3475:genCmp
;; ***	popGetLabel  key=12, label offset 4
	GOTO	_00116_DS_
;; >>> gen.c:3262:pic14_mov2w_regOrLit
	MOVLW	0x40
;; >>> gen.c:3477:genCmp
;;	1108 rIdx = r0x1048 
	SUBWF	r0x103B,W
;;; gen.c:3234:genSkipc *{*
;; >>> gen.c:3239:genSkipc
_00116_DS_
	BTFSC	STATUS,0
;; >>> gen.c:3243:genSkipc
;; ***	popGetLabel  key=5, label offset 4
	GOTO	_00109_DS_
;;genSkipc:3244: created from rifx:0x7fffd5bc2a80
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2315:resultRemat *{*
;; ***	genPlus  576
;;; genarith.c:577:genPlus *{*
;;	694 register type nRegs=2
;;	575
;; 	line = 583 result AOP_REG=r0x1048, size=2, left AOP_REG=r0x1048, size=2, right AOP_LIT=0x01, size=1
;;; genarith.c:142:genPlusIncr *{*
;; ***	genPlusIncr  144
;; 	result AOP_REG, left AOP_REG, right AOP_LIT
;; 	genPlusIncr  156
;; >>> genarith.c:168:genPlusIncr
;;	1108 rIdx = r0x1048 
	BANKSEL	r0x103B
	INCF	r0x103B,F
;; >>> genarith.c:172:genPlusIncr
	BTFSC	STATUS,2
;; >>> genarith.c:173:genPlusIncr
;;	1108 rIdx = r0x1049 
	INCF	r0x103C,F
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2775:genGoto *{*
;; >>> gen.c:2777:genGoto
;; ***	popGetLabel  key=1, label offset 4
	GOTO	_00105_DS_
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2757:genLabel *{*
;; ***	genLabel  2760
;;; gen.c:2315:resultRemat *{*
;;; gen.c:2522:genEndFunction *{*
;; ***	genEndFunction  2524
_00109_DS_
	RETURN	
; exit point of _delay
;;; gen.c:7407:genpic14Code *{*


;	code size estimation:
;	  672+  214 =   886 instructions ( 2200 byte)

	end

;*******************************************************************
;	Boot1.asm
;			- Pragu OS Bootloader v0.0.1
;	
;*******************************************************************

ORG	0x7c00

BITS	16

START:	JMP LOADER

BOOTMSG DB "Welcome to PraguOS!", 0

;*******************************************************************
;	Prints a string
;*******************************************************************

PRINT:
	
		LODSB
		OR AL, AL
		JZ PRINTDONE
		MOV AH, 0x0E
		INT 0x10
		JMP PRINT

PRINTDONE:
	
		RET

;*******************************************************************
;	Bootloader Entry Point
;*******************************************************************

LOADER:
	
		XOR AX, AX
		MOV DS, AX
		MOV ES, AX

		MOV SI, BOOTMSG
		CALL PRINT

		CLI
		HLT

TIMES 510 - ($ - $$) DB 0

DW 0xAA55
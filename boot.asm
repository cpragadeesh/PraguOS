;*******************************************************************
;	Boot1.asm
;			- Pragu OS Bootloader v0.0.1
;			
;	Booting the shit out of OSes since 2016
;*******************************************************************

org	0x7c00

bits	16

start:

	cli
	hlt

times 510 - ($ - $$) db 0

dw 0xAA55
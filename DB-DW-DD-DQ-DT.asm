section .data
;Definimos Constantes
%define SYS_EXIT	 1
%define SYS_WRITE 	 4
%define STDOUT  	 1

;Definimos Varables
chrOpcion		DB	's',0xA 			;1 Byte
strMensaje 		DB 	'Hola',0xA		;5 Bytes
intNumero		DW	12345			;2 Bytes
intNumeroNeg	DW 	-12345			;2 Bytes
lngNumero		DQ  123234345346	;8 Bytes
flgNumero		DD	1.234			;4 Bytes
flgNumero2		DT 	123.454			;10 Bytes

section .text
	global _start
_start:
	mov edx,2
	mov ecx,chrOpcion
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

	mov eax,SYS_EXIT
	int 0x80
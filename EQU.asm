section .data
;Definiendo Constantes
SYS_EXIT 	EQU 1
SYS_WRITE 	EQU 4
STDIN 		EQU 0
STDOUT 		EQU 1
CHR_EXCL 	EQU '!'
EQL 		EQU 0xA		;Endline 10 'Salto de linea o siguente linea', en este caso Hexadecimal

;Definiendo Variable Mensaje
sMensaje db 'Hola a Todos',CHR_EXCL,EQL,EQL
iMensajeLen equ $- sMensaje

section .text
		global _start
_start:

	mov edx,iMensajeLen
	mov ecx,sMensaje
	mov	ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

	;Salida del Programa
	mov eax,SYS_EXIT
	int 0x80

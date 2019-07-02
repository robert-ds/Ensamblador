section .data
	;Definiendo Constantes
%define SYS_EXIT  	1
%define	SYS_WRITE 	4
%define STDIN 		0
%define	STDOUT 		1
%define CHR_EXCL 	'!'
%define EQL			0xA
%define SMENSAJE 	"Hola a Todos"

;Definimos Variable Mensaje
sMensaje DB SMENSAJE,CHR_EXCL,EQL,EQL
iMensajeLen equ $- sMensaje

section .text
	global _start
_start:
	mov edx, iMensajeLen
	mov ecx, sMensaje
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80

	;Salida del programa

	mov eax, SYS_EXIT
	int 0x80

	
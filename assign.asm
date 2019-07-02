section .data

;Definiendo Constantes
;ASSIGN PERMITE REDEFINIR CONSTANTES
%assign SYS_EXIT 	0 	;Esta mal Indicado el valor
%assign	SYS_WRITE 	4
%assign STDIN 		0
%assign STDOUT 		1
%assign CHR_EXCL 	'!'
%assign EQL 		0xA  ;Redefinimos con el valor correcto
%assign SYS_EXIT	1	 ;Redefinimos con el valor correcto

;Definimos Variable Mensaje
sMensaje DB 'Hola a Todos', CHR_EXCL,EQL,EQL
MENSAJE_LEN EQU $- sMensaje

section .text
		global _start
_start:

	mov edx, MENSAJE_LEN
	mov	ecx, sMensaje
	mov	ebx, STDOUT
	mov	eax, SYS_WRITE
	int 0x80

	;Salida del Programa
	mov eax, SYS_EXIT
	int 0x80
	
section .data

%define SYS_EXIT 	1
%define SYS_WRITE 	4
%define STDOUT		1

section .bss

strBuffer: 		RESB 10 	;Reserva 10 Byte's
intValor: 		RESW 1		;Reserva 2 Byte's
varCaracter: 	RESB 10		;Reserva 1 Byte

section .text
	global _start
_start:

;Actuliza el mensaje a Desplegar
;Prefijos Disponbles: Byte, Word y DWORD

	mov [strBuffer], DWORD 'ABCD'
	mov	[strBuffer+4], Word '01'
	mov [strBuffer+6], Word 'XY'
	mov [strBuffer+8], Byte '*'
	mov [strBuffer+9], Byte 0xa

;Prepara el Despliegue del Mensaje
	mov edx, 10
	mov ecx, strBuffer
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80

;Movemos una Letra al Caracter
	mov [varCaracter], byte '$'

;Prepara Despliegue de Caracter	
	mov edx, 1	
	mov	ecx, varCaracter
	mov	ebx, STDOUT
	mov	eax, SYS_WRITE
	int 0x80

;Colocamos el valor en la Variable
	mov [intValor], word 10	

mov [intValor], byte 10
mov [intValor+1], byte 48

;Prepara Desplegar el valor

	mov edx, 2
	mov	ecx, intValor
	mov	ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80

;Salida del Programa
	mov eax, SYS_EXIT
	int 0x80	

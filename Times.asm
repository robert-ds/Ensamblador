section .data

;Definiendo Constantes
%define SYS_EXIT 	1
%define	SYS_WRITE 	4
%define STDOUT		1

;Definiendo Varables con el prefijo TIMES
strMensaje	TIMES 10 DB '.'
strEQL		DB 0xA
strBuffer	TIMES 64 DB '*'
strEQL2		DB 0xA

section .text
	global _start
_start:
	mov edx, 11
	mov ecx,strMensaje
	mov ebx,STDOUT
	mov eax, SYS_WRITE
	int 0x80

;Prepara Despliegue del Caracter
	mov edx,65
	mov ecx,strBuffer
	mov	ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

;Salida del Programa
	mov eax,SYS_EXIT
	int 0x80	






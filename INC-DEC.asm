section .data

%define SYS_EXIT 	1
%define SYS_WRITE 	4
%define STDOUT		1

chrLetra 	DB 'A'
strEQL		DB 0xA

section .text
	global _start
_start:
;Prerara el Despliegue del Mensaje
	mov edx,2
	mov	ecx,chrLetra
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;incrementa La Letra
INC word [chrLetra];Se necesita usar word para ndcar tamaño

;Despliega el nuevo mensaje
	mov edx,1
	inc edx
	mov ecx, chrLetra
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

;Usamos Times para incrementar mas de una vez
times 5 INC word [chrLetra];Se necesita word para indcar tamaño

;Despliega la letra G
	mov edx, 2
	mov	ecx,chrLetra
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

; Decrementa la Letra
DEC word [chrLetra]; Se necesita word para indicar tamaño	

;Despliegue la letra F
 	mov edx,1
 	inc edx
	mov ecx,chrLetra 
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

;Usamos Tmes para ncrementar mas de una vez
times 5 DEC word [chrLetra]	
	 
;Despliega el nuevo Mensaje
	mov edx,2
	mov ecx,chrLetra
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80
;Salida del Programa
	mov eax,SYS_EXIT
	int 0x80	




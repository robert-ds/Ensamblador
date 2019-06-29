section .data								;Segmento de Dato
	userMsg db 'Please ente a Numbre: '	;Pide al Usuario que Ingrese un Número
	lenUserMsg equ $-userMsg				;La Longitud del Mensaje
	dispMsg db 'You Have Entered: '
	lenDispMsg equ $-dispMsg

section .bss		;Datos sin inicializar
	num resb 5

section .text
	global _start

_start:
	mov eax,4
	mov ebx,1
	mov	ecx,userMsg
	mov	edx,lenUserMsg
	int 80h

	;Lee y almacena la entrada del usuario
	mov eax,3
	mov ebx,2
	mov ecx,num
	mov	edx,5
	int 80h

	;Mensaje de Salida 'The entered number is'
	mov eax,4
	mov ebx,1
	mov ecx,dispMsg
	mov edx,lenDispMsg
	int 80h

	;Salida del número Ingresado
	mov eax,4
	mov ebx,1
	mov	ecx,num
	mov edx,5
	int 80h

	;Código de Salida
	mov eax,1
	mov ebx,0
	int 80h


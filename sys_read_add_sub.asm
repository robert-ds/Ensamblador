section .data

;Definiendo Constantes
%define SYS_EXIT 	1
%define SYS_WRITE 	4
%define STDOUT	 	1
%define SYS_READ 	3
%define STDIN	 	0

;Variables
;Mensaje del Programa
strMensaje DB 'Suma V. 1.0 Programa que Suma 2 Números',0xA,0xA
intLenMsgPrg equ $- strMensaje

;Mensaje para pedir el Número 1
strMsgNumUno DB 'Captura el Primer Número: ',0xA
intLenNumUno equ $- strMsgNumUno

;Mensaje para pedir el Número 2
strMsgNumDos DB 'Captura el Segundo Num: ',0xA
intLenNumDos equ $- strMsgNumDos

;Mensaje de Resultado
strMsgRes DB 'El Resultado de la Suma es: ',0xa
intLenRes equ $- strMsgRes

;Fin de linea
chrEQL DB 0xA

section .bss
intNumero1 resb 1	;Reserva 1 Byte
intNumero2 resb 1	;Reserva 1 Byte
intResult  resb 1	;Reserva 1 Byte

section .text
	global _start
_start:
;Prepara el Despliegue Información del Programa
	mov edx,intLenMsgPrg
	mov	ecx,strMensaje
	mov ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;Despliegue de Solcitud del Primer Número
	mov edx,intLenNumUno
	mov	ecx,strMsgNumUno
	mov ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;Lectura del Primer número
	mov eax,SYS_READ		;Función Kernel de Lectura	
	mov	ebx,STDIN			;File Descriptor para la entrada de Teclado
	mov	ecx,intNumero1		;Dirección de la variable donde se almacena el dato leido
	mov	edx,2				;Longitud en Bytes a leer el Número
	int 0x80				;ejecuta la nterrupción

;Desplegando el dato leido
	mov edx,1	
	mov	ecx,intNumero1
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80
;Despliegue del Cambio de Linea
	mov edx, 1	
	mov	ecx,chrEQL
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;Despliegue de la Solicitud del Segundo Número
	mov edx,intLenNumDos
	mov	ecx,strMsgNumDos
	mov ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;Lectura del Segundo número
	mov eax,SYS_READ		;Función Kernel de Lectura	
	mov	ebx,STDIN			;File Descriptor para la entrada de Teclado
	mov	ecx,intNumero2		;Dirección de la variable donde se almacena el dato leido
	mov	edx,2				;Longitud en Bytes a leer el Número
	int 0x80				;ejecuta la nterrupción

;Desplegando el dato leido
	mov edx,1	
	mov	ecx,intNumero2
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80
;Despliegue del Cambio de Linea
	mov edx, 1	
	mov	ecx,chrEQL
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;Movemos a registros los 2 datos
	mov eax, [intNumero1]
	sub eax, '0'
	mov ebx, [intNumero2]
	sub ebx, '0'
;Realizamos la Suma
 	add eax,ebx

;Sumamos '0' para convertir a ASCII
 	add eax,'0'

;Trasladamos al Resultado
	mov [intResult],eax

;Despliegue del Mensaje de Resultado
	mov edx,intLenRes
	mov ecx,strMsgRes
	mov ebx,STDOUT
	mov eax,SYS_WRITE
	int 0x80

;Desplegamos Resultado
	mov edx,1
	mov	ecx,intResult
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80

;Despliegue del Cambio de Linea
	mov edx, 1	
	mov	ecx,chrEQL
	mov	ebx,STDOUT
	mov	eax,SYS_WRITE
	int 0x80
;Salida del Programa
	mov eax,SYS_EXIT
	int 0x80







	

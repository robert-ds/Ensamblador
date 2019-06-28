section .text
	global _start	;Debe ser declarado para enlazador

_start:				;Punto de Entrada del Lanzador
	mov edx,len		;Longitud del Mensaje
	mov	ecx,msg		;Para Escribir mensae
	mov ebx,1		;Descriptor de Archivo (stdout)
	mov eax,4		;Número de llamada al sistema (system_write)
	int 0x80		;Llamada al Núcleo

	mov edx,9		;Longitud del Mensaje
	mov ecx, s2		;Escribir Mensaje
	mov	ebx,1		;Descriptor de Archivo de Salida (stdout)
	mov eax,4		;Número de llamada al Sistema (system_write)
	int 0x80		;Llamada al Núcleo

	mov eax,1 		;Número de llamada al Sistema (system_exit)
	int 0x80		;Llamada al Núcleo

section .data	
	msg db 'Desplegando 9 Estrellaas',0xa ;Mensaje a
	len equ $ - msg						  ; Longitud del Mensaje
	s2 times 9 db '*'
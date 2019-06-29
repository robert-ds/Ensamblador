section .text
	global _start
_start:
	;Escribiendo el nombre 'Zara Ali'
	mov edx,9		;Longitud del mensaje
	mov ecx,name 	;Escribir mensaje
	mov ebx,1		;Descriptor de Archivo (stdout)
	mov eax,4 		;Número de llamada al Sistema (sys_write)
	int 0x80		;Llamada al Núcleo

	mov [name], dword 'Nuha' 	;changed the name to Nuha Ali

	;Escribiendo el nombre 'Nuha ali'
	mov edx,8		;Longitud del mensaje
	mov ecx,name	;Escribir Mensaje
	mov ebx,1 		;Descriptor de archivo (stdout)
	mov eax,4		;Número de llamada al Sistema (sys_write)
	int 0x80		;Llamada al Nucleo

	mov eax,1		;Número de llamada al sistema(sys_exit)
	int 0x80

	section .data
	name db 'Zara Ali '
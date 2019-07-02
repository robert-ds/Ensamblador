section .data
sMensaje db 'New-Software',10		;El valor de 10 permite saltar a una nueva linea en ASCII

section .text
		global _start
_start:
;Despliegue 'Robert'
	mov edx, 13 		;Caracteres a mprmr
	mov ecx, sMensaje 	;Drección del Mensaje
	mov	ebx,1			;Salida a Pantalla (stdout)
	mov eax,4			;Número de llamada al Sstema(Sys_write)
	int 0x80 			;Llamada al Núcleo

	;Cambia Robert 'All-'
	mov [sMensaje], dword 'All-'

	;Despliega 'All-Andres'
	mov edx,13 			;13 Caracteres a imprimir
	;mov edx,15q		;En Octal
	;mov edx,0xd		;En Hexadecimal
	;mov edx,1101b		;En binario
	mov ecx,sMensaje	;Dreccion del Mensaje
	mov	ebx,1			;Salida a Pantalla (stdout)
	mov eax,4			;Número de Llamada al Sistema (sys_write)
	int 0x80 			;Llamada de nterrupcion al Núcleo

	;Salida del Programa
	mov eax,1			;Llamada al sstema para salir (Sys_exit)
	int 0x80


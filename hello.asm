   section .text
    global _start       

_start:
    mov edx,len     ;longitud del mensaje
    mov ecx,msg     ;Escribe el mensaje
    mov ebx,1       ;descripción de la salida
    mov eax, 4      ;Numeros de llamadas al sistema
    int 0x80         ;llamada al nucleo

    mov eax,1       ;numeros de llamadas al sistema
    int 0x80        ;llamada al nucleo

section .data
msg db 'Hello, World', 0xa ;cadena que se imprime
len equ $ -msg ;longitud de la cadena  

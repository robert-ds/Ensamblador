#!/bin/bash

#Scrpt que Compila codigo Ensamblador
echo "Generando Archivo "$1".o";
nasm -f elf $1.asm;

#$1 Representa el parametro que le pasamos al Script
echo "Enlazando y Creando Ejecutable  ";
ld -m elf_i386 -s -o $1 $1.o;

./$1

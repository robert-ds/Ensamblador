#!/bin/bash

#Scrpt que Compila codigo Ensamblador
nasm -f elf $1.asm   

#$1 Representa el parametro que le pasamos al Script

ld -m elf_i386 -s -o $1 $1.o

./$1

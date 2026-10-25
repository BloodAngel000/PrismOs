; En-tête Multiboot1 pour que QEMU comprenne que c'est un noyau
MBALIGN  equ  1 << 0
MEMINFO  equ  1 << 1
FLAGS    equ  MBALIGN | MEMINFO
MAGIC    equ  0x1BADB002
CHECKSUM equ -(MAGIC + FLAGS)

section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

section .bss
align 16
stack_bottom:
    resb 16384           ; Pile de 16 Ko
stack_top:

section .text
global _start
extern kernel_main

_start:
    mov esp, stack_top   ; Initialisation du pointeur de pile
    call kernel_main     ; Appel de la fonction C
    cli                  ; Désactivation des interruptions
.hang:
    hlt                  ; Pause processeur
    jmp .hang

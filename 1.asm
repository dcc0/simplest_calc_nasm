;Простейший калькулятор для сложения или вычитания двух чисел, взятых из аргументов
;Команда запуска
;nasm -f elf32 1.asm; ld -m elf_i386 -s -o 1 1.o; ./1 1 2 +
; или
; nasm -f elf32 1.asm; ld -m elf_i386 -s -o 1 1.o; ./1 1 2 -
section .text
%include '2.asm' ; Функции сложения, вычитания и вывода

global _start             ;must be declared for using gcc
_start:                     ;tell linker entry point
push ebp                ; Работа со стеком
mov ebp, esp
push    esi             ; Кладём esi на стек


 mov esi, esp[12]    ; Вынимаем из стека строку с аргуметом и кладём в esi
   mov ecx, 4          ; Для первого аргумента - символа
   mov bl, [esi+ecx] ; Кладём в ebx, именно в bl, содержимое стека со смещением  до символа 4
   mov ecx, 6          ; Кладём второй аргумент
   mov dx, [esi+8]    ; В третий аргумент кладём +  или -
   cmp dx, '+'          ; Если +
   je plus                 ; то вызываем сложение (функцию)
   cmp dx, '-'           ; Если -
   je minus              ; то вызываем вычитание
   call exit               ; Иначе вообще выходим

section .data
  sum db 4;             ; для хранения вывода

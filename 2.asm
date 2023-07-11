presult:
    mov     [sum], ebx ;Кладём результат в sum
    mov     ecx, sum   ; Кладём sum в ecx для вывода
    mov     edx, 2
    mov     ebx, 1          ;file descriptor (stdout)
    mov     eax, 4          ;system call number (sys_write)
    int     0x80               ;call kernel
    mov     eax, 1          ;system call number (sys_exit)
    int     0x80               ;call kernel
    leave
ret

exit:
    mov     eax, 1          ;system call number (sys_exit)
    int     0x80               ;call kernel
    leave
    leave
ret

minus:
   sub bl, [esi+ecx]  ; Складываем
   add bl, '0'            ; Добавим bl 0
   call presult
   leave
ret


plus:
   sub bl, '0'            ; Вычитаем из bl 0
   add bl, [esi+ecx]  ; Складываем
   call presult
   leave
ret

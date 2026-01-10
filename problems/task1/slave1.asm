bits 32
extern _printf          ;_printf already exsists inside <stdio.h>
global _getsum   ;intended for use inside both slave and master
                        ;readstring method is not needed in this module
segment data public data use32
    sum dd 0
segment code public code use32
    _getsum:
        push ebp
        mov ebp,esp
        pushad
        
        xor eax, eax
        mov esi, [ebp + 8]
        
        .loop1:
            lodsb
            cmp al, 0
            jz .exitfun
            
            sub al, '0'
            cmp al, 0
            jl .notDigit
            cmp al, 9
            jg .notDigit
            cbw
            cwd
            add [sum], eax
            .notDigit:
            jmp .loop1
        
        .exitfun:
            leave
            mov eax, [sum]
            ret

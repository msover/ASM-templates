bits 32
extern _printf          ;_printf already exsists inside <stdio.h>
extern _isSquareRoot
global _perfectsquare   ;intended for use inside both slave and master
                        ;readstring method is not needed in this module
segment data public data use32
    sum dd 0
segment code public code use32
    isvowel:
        push ebp
        mov ebp,esp
        pushad
        mov al, [ebp + 8]
        
        cmp al, 'a'
        jz .vowel
        cmp al, 'e'
        jz .vowel
        cmp al, 'i'
        jz .vowel
        cmp al, 'o'
        jz .vowel
        cmp al, 'u'
        jz .vowel
        cmp al, 'A'
        jz .vowel
        cmp al, 'E'
        jz .vowel
        cmp al, 'I'
        jz .vowel
        cmp al, 'O'
        jz .vowel
        cmp al, 'U'
        jz .vowel
        
        popad
        mov eax, 0
        jmp .notvowel
        .vowel:
            mov eax, 1
        .notvowel:
            leave    
            ret
   
        
    _perfectsquare:
        push ebp
        mov ebp,esp
        pushad
        
        xor eax, eax
        mov esi, [ebp + 8]
        
        .loop1:
            lodsb
            cmp al, 0
            jz .exitloop1
            
            cbw
            cwd
            push eax
            call isvowel
            add esp, 4
            
            add [sum], eax
            .notDigit:
            jmp .loop1
            
        .exitloop1:
            push dword [sum]
            call _isSquareRoot
            add esp, 4
            
            cmp eax, 1
            jz .isSquareRoot
            jmp .exitfun
        
        .isSquareRoot:
            mov eax, [sum]
        .exitfun:
            leave
            ret

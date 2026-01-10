bits 32
global _restructure
segment data public data use32
	alphabet db '12345678901234567890123456', 0
    newstring resb 100
    
segment code public code use32
    _restructure:
        push ebp
        mov ebp,esp
        pushad
       
        mov esi, [ebp + 8]
        mov edi, newstring
        xor ecx, ecx
        .mainloop:
            xor eax, eax
            xor edx, edx
            lodsb
            sub al, 'a'
            mov dl, [alphabet + eax]
            mov al, dl
            stosb
            cmp al, 0
            jz .exitfun
            jmp .mainloop
        
        .exitfun:
            mov esi, newstring
            mov edi, [ebp + 8]
            .secondloop:
                lodsb
                stosb
                cmp al, 0
                jnz .secondloop
            popad
            leave
            ret

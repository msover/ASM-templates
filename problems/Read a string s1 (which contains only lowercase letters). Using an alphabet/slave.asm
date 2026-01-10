bits 32
global _restructure
segment data public data use32
	alphabet db 'OPQRSTUVWXYZABCDEFGHIJKLMN', 0
    newarray resb 100
segment code public code use32
    _restructure:
        push ebp
        mov ebp,esp
        pushad
       
        mov esi, [ebp + 8]
        mov edi, newarray
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
            popad
            mov eax, newarray
            leave
            ret

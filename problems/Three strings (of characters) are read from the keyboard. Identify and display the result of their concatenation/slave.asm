bits 32
global _concatenate   ;intended for use inside both slave and master
segment data public data use32
    concatStr resb 300
segment code public code use32
    _concatenate:
        push ebp
        mov ebp, esp
        pushad
        
        cld
        mov edi, concatStr
        mov esi, [ebp + 8]
        .loop1:
            lodsb
            stosb
            cmp al, 0
            jnz .loop1
            
        dec edi
        mov esi, [ebp + 12]
        .loop2:
            lodsb
            stosb
            cmp al, 0
            jnz .loop2
            
        dec edi
        mov esi, [ebp + 16]
        .loop3:
            lodsb
            stosb
            cmp al, 0
            jnz .loop3
        
        popad
        leave
        mov eax, concatStr
        ret

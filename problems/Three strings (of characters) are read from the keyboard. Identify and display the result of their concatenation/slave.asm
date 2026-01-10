bits 32
global _concatenate   ;intended for use inside both slave and master
segment data public data use32
    concatStr resb 300
    str1 resb 100
    str2 resb 100
    str3 resb 100
segment code public code use32
    _concatenate:
        push ebp
        mov ebp, esp
        pushad
        mov dword [str1], [ebp + 8]
        mov dword [str2], [ebp + 12]
        mov dword [str3], [ebp + 16]
        
        
        cld
        mov edi, concatStr
        mov esi, [str1]
        .loop1:
            lodsb
            stosb
            cmp al, 0
            jnz .loop1
            
        dec edi
        mov esi, [str2]
        .loop2:
            lodsb
            stosb
            cmp al, 0
            jnz .loop2
            
        dec edi
        mov esi, [str3]
        .loop3:
            lodsb
            stosb
            cmp al, 0
            jnz .loop3
        
        popad
        leave
        mov eax, concatStr
        ret

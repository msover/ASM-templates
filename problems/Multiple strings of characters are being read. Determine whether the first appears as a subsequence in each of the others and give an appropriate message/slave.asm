%ifndef _SLAVE_ASM_
%define _SLAVE_ASM_

extern exit
import exit msvcrt.dll
segment data use32 class=data
    firstBuffer resb 100
segment code use32 class=code
    templateFun:
        push ebp
        mov ebp, esp
        
        leave
        ret
    
    isLeaveCommand:
        push ebp
        mov ebp, esp
        mov eax, 0
        mov edx, [esp + 8]
        cmp byte [edx], 'q'
        jnz .exitfun
        cmp byte [edx + 1], 'u'
        jnz .exitfun
        cmp byte [edx + 2], 'i'
        jnz .exitfun
        cmp byte [edx + 3], 't'
        jnz .exitfun
        mov eax, 1
        .exitfun:
            leave
            ret
    
    searchBuffers:
        push ebp
        mov ebp, esp
        mov eax, [ebp + 8]
        mov esi, 0
        mov edi, -1
        
        .loop1:
            inc edi
            mov esi, 0
            .loop2:
                mov ebx, edi
                add ebx, esi
                mov cl, [eax + ebx]
                mov ch, [firstBuffer + esi]
                
                
                cmp byte [firstBuffer + esi], 0
                jz .found
                
                
                cmp byte [eax + ebx], 0
                jz .exitfun
                
                cmp cl, ch
                jnz .loop1
                inc esi
                jmp .loop2
        
        
        
        jmp .exitfun
        .found:
            mov eax, 1
            leave
            ret
        .exitfun:
            mov eax, 0
            leave
            ret
        
    hasRepeated:
        push ebp
        mov ebp, esp
        
        mov eax, [ebp + 12]
        cmp eax, 0
        jz .firstCycle
        jmp .notFirstCycle
        .firstCycle:
            mov esi, [ebp + 8]
            mov edi, firstBuffer
            .loop1:
                lodsb
                stosb
                cmp al, 0
                jnz .loop1
            mov eax, 0
            jmp .exitfun
            
        .notFirstCycle:
            push dword [ebp + 8]
            call searchBuffers
            add esp, 4
        .exitfun:
            leave
            ret
%endif
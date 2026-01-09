%ifndef _SLAVE_ASM_
%define _SLAVE_ASM_

extern exit
import exit msvcrt.dll

segment data use32 class=data
    helloworld db "Hello World!", 0

segment code use32 class=code

    helloWorldFun:
        push ebp
        mov ebp, esp
        
        mov eax, helloworld
        
        leave
        ret

    exitFun:
        push ebp
        mov ebp, esp
        
        push 0
        call [exit]
        
        leave
        ret
    
    templateFun:
        push ebp
        mov ebp, esp
        
        leave
        ret
    
%endif
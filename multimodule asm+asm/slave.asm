%ifndef _SLAVE_ASM_
%define _SLAVE_ASM_
    
segment data use32 class=data
    helloworld db "Hello World!", 0

segment code use32 class=code

    func1:
        push ebp
        mov ebp, esp
        
        mov eax, helloworld
        
        leave
        ret

    func2:
        push ebp
        mov ebp, esp
        
        leave
        ret
    
    func3:
        push ebp
        mov ebp, esp
        
        leave
        ret
    
%endif
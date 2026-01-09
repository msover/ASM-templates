bits 32
global start        

extern exit, printf
import exit msvcrt.dll
import printf msvcrt.dll
%include "slave.asm"

segment data use32 class=data
    fmt db '%s', 0
    
segment code use32 class=code
    start:
        call helloWorldFun
        
        push eax
        push fmt
        call [printf]
        add esp, 4 * 2
        
        call exitFun
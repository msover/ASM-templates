bits 32
global start        

extern exit, printf, scanf
import exit msvcrt.dll
import printf msvcrt.dll
import scanf msvcrt.dll


;Multiple strings of characters are being read.
;Determine whether the first appears as a subsequence in each of the others and give an appropriate message.
%include "slave.asm"
segment data use32 class=data
    buffer resb 100
    scanfmt db '%s', 0
    printmsg db 'found it', 0
segment code use32 class=code
    start:
        mov ecx, 0
        .mainloop:
            push ecx
            push buffer
            push scanfmt
            call [scanf]
            add esp, 4 * 2
            
            
            push buffer
            call isLeaveCommand
            add esp, 4
            cmp eax, 1
            jz exitprogram
            
            pop ecx
            push ecx
            
            push ecx
            push buffer
            call hasRepeated
            add esp, 4 * 2
            
            
            cmp eax, 1
            jz .print
            jmp .dontprint
            
            .print:
                push printmsg
                call [printf]
                add esp, 4
            .dontprint:
            pop ecx
            inc ecx
            jmp .mainloop
        
        exitprogram:
            push 0
            call [exit]

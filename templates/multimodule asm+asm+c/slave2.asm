bits 32
extern _printf          ;_printf already exsists inside <stdio.h>
extern _str             ;intended for use only inside slave
global _slave2fun   ;intended for use inside both slave and master
                        ;readstring method is not needed in this module
segment data public data use32
	message db 'Hello world!', 0
    
segment code public code use32
    _slave2fun:
        push ebp
        mov ebp,esp
        
        push dword [esp + 8]
        call _printf
        add esp, 4 * 1
        
        push _str
        call _printf
        add esp, 4 * 1
        
        leave
        ret

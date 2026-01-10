bits 32
global _concat
segment data public data use32
	message db 'Hello world!', 0
    
segment code public code use32
    _printmythings:
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

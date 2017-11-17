    extern printf
    extern scanf
    section .data
scanmsg: db "%d%d", 0
printmsg: db "a=%d, b=%d", 10, 0
    section .text
    global main
swap:
    push ebp
    mov ebp, esp

    mov edx, dword [esp + 4]
    mov edx, eax
    mov eax, ecx
    mov ecx, edx
    
    pop ebp
    ret
main:
    push ebp
    mov ebp, esp

    push dword 0
    push dword 0
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 4]
    push eax
    push scanmsg
    call scanf
    add esp, 12
    pop eax
    pop ecx

    push ecx
    push eax
    call swap
    add esp, 8   
    
    push ecx
    push eax
    push printmsg
    call printf
    add esp, 12

    mov eax, 0

    pop ebp
    ret
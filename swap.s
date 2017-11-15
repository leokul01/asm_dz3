    extern printf
    extern scanf
    section .data
scanmsg: db "%d%d", 0
printmsg: db "a=%d, b=%d", 10, 0
    section .text
    global main
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

    mov edx, dword [esp + 4]
    mov edx, eax
    mov eax, ecx
    mov ecx, edx
    
    push ecx
    push eax
    push printmsg
    call printf
    add esp, 12

    mov eax, 0

    pop ebp
    ret
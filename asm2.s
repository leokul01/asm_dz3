    extern printf
    extern scanf
    section .data
scanmsg: db "%d%d", 0
printmsg: db "|a - b| = %d", 10, 0
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

    cmp eax, ecx
    jge @Positive
    jl @Negative

@Positive:
    sub eax, ecx
    push eax
    jmp @End
@Negative:
    sub ecx, eax
    push ecx
@End:
    push printmsg
    call printf
    add esp, 8
    
    mov eax, 0
    
    pop ebp
    ret



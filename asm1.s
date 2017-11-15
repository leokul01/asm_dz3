    extern printf
    extern scanf
    section .data
scanmsg: db "%d%d", 0
printmsg: db "a = %d, b = %d", 10, 0
    section .text
    global main
main:
    push ebp
    mov ebp, esp

    push dword 0 ; int b = 0;
    push dword 0 ; int a = 0;
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 4]
    push eax
    push scanmsg
    call scanf
    add esp, 12
    pop eax
    pop ecx

    cmp eax, 0
    jne @YesUnfam
    je @IfNot
@YesUnfam:
    cmp ecx, 0
    jle @IfYes
    jg @IfNot
@IfYes:   
    push ecx
    push eax
    push printmsg
    call printf
    add esp, 12
@IfNot:
    mov eax, 0

    pop ebp
    ret
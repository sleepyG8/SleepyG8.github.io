sub rsp, 32
call cont
add rsp, 32
ret

cont:;

lea rax, [G]
mov rax, [rax]
xor rcx, rcx
sub rcx, 11
sub rsp, 32
call rax
add rsp, 32

mov rcx, rax

lea rax, [W]
mov rax, [rax]
lea rdx, [S]
lea rsi, [Q]
movzx rsi, [rsi]
mov r14, rsi
mov r15, 0
sub rsp, 40
mov [rsp+24], 0
call rax
add rsp, 40

xor rax, rax
ret

S db "Hello from assembler",0
Q $ - S
N dq 32
W gf WriteConsoleA
G gf GetStdHandle
B gf Beep
END

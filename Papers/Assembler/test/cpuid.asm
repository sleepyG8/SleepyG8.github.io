; Sleepy Zazm test file
; Getting CPU name and AVX512 and Advanced Bit Manipulation

xor rax, rax        ; Getting CPU name
cpuid

shl rdx, 0x20
add rbx, rdx

mov rax, rbx

sub rsp, 0x20
mov [rsp+8], rax
mov [rsp+16], rcx
mov [rsp+20], 0x0A

lea rbx, [rsp+8]

mov rax, [G]
xor rcx, rcx
sub rcx, 11
sub rsp, 0x20
call rax
add rsp, 0x20

mov rcx, rax

mov rax, [W]
lea rdx, rbx
mov r14, 0x0D
mov r15, 0
sub rsp, 0x28
mov [rsp+24], 0
call rax
add rsp, 0x28

add rsp, 0x20

mov rax, 7          ; checking for avx512
xor rcx, rcx
cpuid

bt rbx, 16
setc rax

xor rcx, rcx        
bt rbx, 8           ; check for BMI
setc rcx

add rax, rcx        ; if both then 2

ret

W gf WriteConsoleA
G gf GetStdHandle

END

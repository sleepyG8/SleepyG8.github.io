mov rax, 0
func:;
movzx rbx, [rcx]
movzx rsi, [rdx]
cmp rsi, rbx
jne BADD
cmp rsi, 00
jz endi
cmp rbx, 00
jz endi
add rcx, 1
add rdx, 1
add rax, 1
jmp func
endi:;
xor rax, rax
ret
BADD:;
mov rax, 1
ret
END

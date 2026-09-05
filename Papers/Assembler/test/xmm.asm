lea rsi, [E]    ; make it so you can select a starting func in assembler
lea rdi, [W]
mov rcx, 5
movsb           ; assembler auto adds rep

lea rax, [W]
mov rax, [rax]

shl rax, 8
shr rax, 8

ret



mov rbx, 0
loop:;
movdqu xmm0, [rcx]
movdqu xmm1, [rdx]
cmppd xmm1, xmm0, 0
movmskpd rax, xmm0
add rcx, 16
add rdx, 16
add rbx, 16
cmp rbx, r14
jne loop
ret

mov rax, 2
mov rbx, 4
mov rcx, 2
mul rbx
div rcx

mov r13, rax
shl r13, 16
mov rax, r13

bswap rax


lea rax, [E]
movdqu xmm0, [rax]
movq rax, xmm0
mov rax, [rax]
shl rax, 16
shr rax, 16
mov rcx, rax

shr rax, 40
shl rax, 40
sub rcx, rax
mov rax, rcx

xor rcx, rcx
sub rcx, 1
and rax, rcx

;pshufd xmm0, xmm0, 228
;pextrq rax, xmm0, 0

ret

E db "Fuckkkk",0
W dq 32

END

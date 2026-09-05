sub rsp, 32

xor rbx, rbx
mov [rsp+8], rbx

lea rsi, [w]
lea rdi, [rsp+8]
mov rcx, 5
movsb

mov rax, [rsp+8]

lea rax, [w]
mov rcx, 1
mov [rax+2], 61
mov [rax+rcx], 61

mov rax, 1
inc rax
inc rax
inc rax

mov rcx, 2
div rcx

mov rbx, [w]
mov rax, rbx

add rsp, 32

add rbx, 1
cmp rsi, 00
jne loop

lea rax, [w]
mov rax, [rax]

ret

;doA:
;rdrand rax
;shr rax, 56
;cmp rax, 11
;jge doAgain
;ret


w db "wow",0


END

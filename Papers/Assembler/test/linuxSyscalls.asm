; Assemble this with zazm.exe <fileName> -ELF

mov rax, 1
mov rdi, 1
lea rsi, [n]             ;; Write words
lea rdx, [b]
mov rdx, [rdx]
syscall

mov rax, 60
xor rdi, rdi
syscall
ret

n db "Fuckkkkkkkkkkkkkkkkkkkkkk",0
b $ - n
END

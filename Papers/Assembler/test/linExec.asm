; The store instruction inlines the bytes onto the stack
; The format is store string and stack offset

sub rsp, 48

store "/bin/sh" 08

lea rdi, [rsp+8]
xor rsi, rsi
xor rdx, rdx
mov rax, 59
syscall             ; execve("/bin/sh", 0, 0)

add rsp, 48

mov rdi, rax
mov rax, 60
syscall

ret

END

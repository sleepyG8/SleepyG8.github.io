;; got this idea from https://github.com/guitmz/ansi-escape/blob/master/ansi.asm
;;

unsigned char B[] = {0x1B, 0x5B, 0x30, 0x31, 0x3B, 0x36, 0x30, 0x48, 0x00 };
unsigned char G[] = {0x1B, 0x5B, 0x33, 0x32, 0x6D, 0x00 };
unsigned char F[] = {0x1B, 0x5B, 0x30, 0x38, 0x3B, 0x30, 0x30, 0x48, 0x00 };
sub rsp, 128

mov rdi, 1
mov rsi, 21523        ;; lin ioctl code for term size
mov rbx, rsp
lea rdx, [rbx]
mov rax, 16
syscall

movzw rdi, [rbx+6]

add rsp, 128

xor rbx, rbx
loop:

add rbx, 1

lea rsi, [G]            ; green text
mov rdi, 1
mov rax, 1
mov rdx, 5
syscall


lea rsi, [B]            ; set pos
mov rdi, 1
mov rax, 1
mov rdx, 8
syscall

lea rsi, [A]            ; write words
mov rdi, 1
mov rax, 1
mov rdx, 6
syscall

lea rsi, [F]            ; set pos
mov rdi, 1
mov rax, 1
mov rdx, 8
syscall

cmp rbx, 100
jne loop                ; jump 10 times

xor rdi, rdi
mov rax, 60
syscall
ret

A db "Words",0

END

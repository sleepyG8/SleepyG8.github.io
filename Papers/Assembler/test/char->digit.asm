sub rsp, 32
call conv
add rsp, 32
ret


; digit to hex
mov rax, [A]    ; nib 1
and rax, 255
sub rax, 48
shl rax, 4      ; shift left 4 bits for next

mov rbx, [A]    ; nib 2
shr rbx, 8
and rbx, 255
sub rbx, 48

add rax, rbx

ret

; digit to hex
conv:
mov rax, [A]    ; nib 1
and rax, 255
sub rax, 48

mov rdx, 10
mul rdx         ; rax * 10

mov rbx, [A]    ; nib 2
shr rbx, 8
and rbx, 255
sub rbx, 48

add rax, rbx

mov rbx, [A]    ; nib 2
shr rbx, 16
cmp rbx, 00
jz stop

mov rdx, 10
mul rdx

and rbx, 255
sub rbx, 48

add rax, rbx

mov rbx, [A]    ; nib 2
shr rbx, 24
cmp rbx, 00
jz dooo

mov rbx, [A]    ; nib 2
shr rbx, 24
mov rdx, 10
mul rdx

and rbx, 255
sub rbx, 48

add rax, rbx

stop:
dooo:
ret

A db "244"

END

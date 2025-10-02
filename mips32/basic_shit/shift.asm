.text
.globl _start

_start:
    la $a0, msg
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    move $a0, $v0
    li $v0, 1
    syscall

.data
msg:    .asciiz "hii im alex from microsoft your computer has virus\r\n"


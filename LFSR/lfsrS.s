.globl _lfsr_assembly
_lfsr_assembly:
#setup
pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax            #seed

#body
.L1:
cmpl $0,%eax            #seed == 0
jne .L2
incl %eax            #seed++
jmp .END

.L2:
movl %eax, %ebx            #seed
shrl $2, %ebx            #>>2

movl %eax, %ecx            #seed
shrl $6, %ecx            #>>6

xorl %ecx, %ebx            #^ bitwise
xorl %eax, %ebx            #^ bitwise

movl %eax, %ecx
shrl $7, %ecx            #>>7

xorl %ecx, %ebx            #^ bitwise
andl $1, %ebx
andl $1, %ebx
movl %ebx, %edx            #bits = ............
je .L3

shrl $1, %eax            #>>1

sall $31, %ebx            #<<31
orl %ebx, %eax            #| bitwise
jmp .END

.L3:
cmpl $0, %eax


shrl $1, %eax            #>>1
jmp .END

#end
.END:
popl %ebp
ret


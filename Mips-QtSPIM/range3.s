#contains messages to be used in user interface
.data
#.asciiz - stores specified string in the NULL-terminated format
prompt_1: .asciiz "Enter integer#1: "

prompt_2: .asciiz "Enter integer#2: "

prompt_3: .asciiz "Enter integer#3: "

prompt: .asciiz "The range is: ["
comma: .asciiz ", "
bracket: .asciiz "]"

#code
.text
.globl main
main:

#print prompt_1
li $v0, 4 #print string
la $a0, prompt_1   #address of string to print
syscall

#input num1
li $v0, 5 #read integer
syscall
move $t1, $v0
move $t2, $v0

#print prompt_2
li $v0, 4 #print string
la $a0, prompt_2   #address of string to print
syscall

#input num2
li $v0, 5 #read integer
syscall
move $t3, $v0
move $t4, $v0

#print prompt_3
li $v0, 4 #print string
la $a0, prompt_3   #address of string to print
syscall

#input num3
li $v0, 5 #read integer
syscall
move $t5, $v0
move $t6, $v0

#print prompt
li $v0, 4 #print string
la $a0, prompt   #address of string to print
syscall

jal find_min #procedure call find_min
li $v0, 1 #min_value
move $a0, $t3
syscall

li $v0, 4 #print string
la $a0, comma
syscall

jal find_max #procedure call find_max
li $v0, 1 #max_value
move $a0, $t4
syscall

li $v0, 4 #print string
la $a0, bracket #]
syscall

j end #end program

find_min:
ble $t3, $t1, minv1
move $t3, $t1
minv1:
ble $t3, $t5, minv2
move $t3, $t5
minv2:
jr $ra

find_max:
bge $t4, $t2, maxv1
move $t4, $t2
maxv1:
bge $t4, $t6, maxv2
move $t4, $t6
maxv2:
jr $ra

end:

#all programs must end with those 2 lines of code
li $v0, 10 #exit
syscall
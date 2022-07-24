#contains messages to be used in user interface
.data
#.asciiz - stores specified string in the NULL-terminated format
prompt_1: .asciiz "Enter integer#1: "

prompt_2: .asciiz "Enter integer#2: "

prompt_3: .asciiz "Enter integer#3: "

prompt: .asciiz "The sum is: "

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

#print prompt_2
li $v0, 4 #print string
la $a0, prompt_2   #address of string to print
syscall

#input num2
li $v0, 5 #read integer
syscall
move $t2, $v0

#print prompt_3
li $v0, 4 #print string
la $a0, prompt_3   #address of string to print
syscall

#input num3
li $v0, 5 #read integer
syscall
move $t3, $v0

add $t0, $t1, $t2
add $t0, $t0, $t3

li $v0, 4 #print string
la $a0, prompt   #address of string to print
syscall

move $a0, $t0
li $v0, 1 #print integer
syscall

#all programs must end with those 2 lines of code
li $v0, 10 #exit
syscall
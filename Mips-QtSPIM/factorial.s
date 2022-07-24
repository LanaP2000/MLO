#contains messages to be used in user interface
.data
#.asciiz - stores specified string in the NULL-terminated format
prompt: .asciiz "Enter integer: "

factorial: .asciiz "The factorial: "

#code
.text
.globl main
main:

#print prompt
li $v0, 4 #print string
la $a0, prompt  #address of string to print
syscall

#input num
li $v0, 5 #read integer
syscall
move $a0, $v0

jal fact
move $t0, $v0

#print factorial
li $v0, 4 #print string
la $a0, factorial   #address of string to print
syscall

li $v0, 1 #print integer
move $a0, $t0   #address of string to print
syscall

#all programs must end with those 2 lines of code
li $v0, 10
syscall

fact:
  addi $sp, $sp, -8   #make room on stack
  sw $a0, 4($sp)   #store $a0 (n)
  sw $ra, 0($sp)   #store $ra
#Here we're saving return address because inside this procedure we are calling another procedure
  bne $a0, $0, else
  addi $v0, $0, 1   #return 1
  addi $sp, $sp, 8   #restore $sp
  jr $ra

  else:
  addi $a0, $a0, -1   #n=n-1
  jal fact   #recursive call
#puts value into ra and jumps from main to procedure
  lw $ra, 0($sp)   #restore $ra
  lw $a0, 4($sp)   #restore $a0 (n)
  mul $v0, $a0, $v0   #n*fact(n-1)
  
  addi $sp, $sp, 8   #restore $sp
  jr $ra

#contains messages to be used in user interface
.data
#.asciiz - stores specified string in the NULL-terminated format
prompt_1: .asciiz "Enter num of integers: "
prompt_2: .asciiz "Enter integer: "
paramsum: .asciiz "The sum is: "

#code
.text
.globl main
main:

#print prompt_1
li $v0, 4 #print string
la $a0, prompt_1 #address of string to print
syscall

#user input
li $v0, 5 #read integer
syscall
add $a1, $0, $v0
move $t0, $a1

for_insertion:
  beq $t0, 0, done
  li $v0, 4 #print string
  la $a0, prompt_2 #Enter integer
  syscall
  li $v0, 5 #read integer
  syscall

  addi $sp, $sp, -4 #allocate space on stack for $v0  
  sw $v0, ($sp) #save $v0 on stack

  addi $t0, $t0, -1 #user_input-1
  j for_insertion

done:
  jal sum_init
  add $t0, $0, $v0
  #print paramsum
  li $v0, 4 #print string
  la $a0, paramsum #address of string to print
  syscall
  
  move $a0, $t0
  li $v0, 1 #print integer
  syscall
  j end

sum_init:
add $t0, $0, $a1 #i=user_input
addi $v0, $0, 0, #sum = 0
sum:
  beq $t0, 0, ret
  addi $sp, $sp, 4 #deallocate space on stack 
  lw $t2, ($sp) #restore $t2 ($v0) from stack
  add $v0, $v0, $t2 #sum=sum+$v0
  addi $t0, $t0, -1 #i=i-1
  j sum
ret:
#indicates the end of the procedure and returns from a procedure
  jr $ra

end:

#all programs must end with those 2 lines of code
li $v0, 10 #exit
syscall
#contains messages to be used in user interface
.data
#.asciiz - stores specified string in the NULL-terminated format
arr_info: .asciiz "int class_grades[15] = { 88, 66, 97, 91, 90, 64, 71, 77, 75, 85, 58, 99, 83, 78, 48}"

array: .word 88, 66, 97, 91, 90, 64, 71, 77, 75, 85, 58, 99, 83, 78, 48

newline: .asciiz "\n"

arr_sum: .asciiz "The sum: "

arr_avg: .asciiz "The average: "

#code
.text
.globl main
main:

#print arr_info
li $v0, 4 #print string
la $a0, arr_info   #address of string to print
syscall

#print newline
li $v0, 4 #print string
la $a0, newline   #address of string to print
syscall

#$s0=array base address, $s1=i
la $s0, array
addi $s1, $0, 0 #i=0
addi $t2, $0, 15 #$t2=15
addi $t3, $0, 0 #sum=0

sum:
  slt $t0, $s1, $t2 #i<15
  beq $t0, $0, sum_done #if not then done
  sll $t0, $s1, 2 #$t0=i*4(byte offset)
#Each array element is a word, but the MIPS memory is byte addressed, so the offset from the base address is ix4
  add $t0, $t0, $s0 #address of array[i]
  lw $t1, 0($t0) #$t1=array[i]
  add $t3, $t3, $t1 #sum=sum+array[i]
  addi $s1, $s1, 1 #i=i+1
  j sum
sum_done:

#print arr_sum
li $v0, 4 #print string
la $a0, arr_sum   #address of string to print
syscall

#print sum
li $v0, 1 #print integer
move $a0, $t3   #address of string to print
syscall

#print newline
li $v0, 4 #print string
la $a0, newline   #address of string to print
syscall

#average
#$t5=length=15
li $t5, 15
#t6=average
div $t6, $t3, $t5 #$t6=sum/length

#print arr_avg
li $v0, 4 #print string
la $a0, arr_avg   #address of string to print
syscall

#print avg
li $v0, 1 #print integer
move $a0, $t6   #address of string to print
syscall

li $v0, 10
syscall
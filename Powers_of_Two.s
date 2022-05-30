.data
a : .word 1
.text
.globl main
main:
addi $s0,$s0,12
la $s3,a
li $t0,0
li $s1,1
#while(t0!=12){print power of two t0++}
while:
jal function
sllv $a0,$s1,$t0
sll $t1,$t0,2
add $t1,$t1,$s3
#store and print each values
sw $a0,($t1)
addi $v0,$0,1
syscall
jal next
# t0 ++
add $t0,$t0,1
ble $t0,$s0, while
#program end
exit: 
li $v0,10
syscall
#print "2^(t0)="
function:
#print 2
add $v0,$0,11
addi $a0,$0,'2'
syscall
#print power
add $v0,$0,11
addi $a0,$0,'^'
syscall
#print t0
add $v0,$0,1
move $a0,$t0
syscall
#print =
add $v0,$0,11
addi $a0,$0,'='
syscall
jr $ra
#next line
next:
add $v0,$0,11
addi $a0,$0,'\n'
syscall
jr $ra
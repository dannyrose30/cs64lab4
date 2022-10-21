# pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#   int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data

	# TODO: Write your initializations here
    number: .asciiz "Enter a number x:\n"
    exponent: .asciiz "Enter the exponent n:\n"
    result: .asciiz "Power(x,n) is:\n"
    newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
    li $v0 4
    la $a0 number
    syscall

    li $v0 5
    syscall
    move $t0 $v0 #t0 represents number

    li $v0 4
    la $a0 exponent
    syscall

    li $v0 5
    syscall
    move $t1 $v0 #t1 represents exponent

    li $t2 1  #Represents result
loop:
   beq $t1 $zero loop_exit
   mult $t2 $t0
   mflo $t2
   addi $t1 $t1 -1
   j loop

loop_exit:
   li $v0 4
   la $a0 result
   syscall

   li $v0 1
   move $a0 $t2
   syscall
    
   li $v0 4
   la $a0 newline
   syscall
   j exit

exit:
   li $v0 10
   syscall

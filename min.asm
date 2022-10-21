# min.asm program
#

.data

        # TODO: Complete these declarations / initializations

        prompt: .asciiz "Enter the next number:\n"
        result: .asciiz "Minimum:"
        newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:
    li $v0 4
    la $a0 prompt
    syscall

    li $v0 5
    syscall
    move $t0 $v0

    li $v0 4
    la $a0 prompt
    syscall

    li $v0 5
    syscall
    move $t1 $v0
    
    li $v0 4
    la $a0 prompt
    syscall

    li $v0 5
    syscall
    move $t2 $v0

    move $t3 $t0

    blt $t1 $t3 t1min
    j after_first_branch

t1min:
    move $t3 $t1
    j after_first_branch

after_first_branch:
    blt $t2 $t3 t2min
    j after_second_branch

t2min:
    move $t3 $t2
    j after_second_branch

after_second_branch:
    li $v0 4
    la $a0 result
    syscall

    li $v0 1
    move $a0 $t3
    syscall

    li $v0 4
    la $a0 newline
    syscall
    j exit

exit:
    li $v0 10
    syscall

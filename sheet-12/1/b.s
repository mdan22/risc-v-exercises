# Pseudocode:

# Assembly Code:

# Precondition: save registers on stack, init vars a0, t0=a0
# example: a0=4

# Initialize stack pointer
lui sp, 0x10000   # Set stack pointer to 0x10000000 (safe memory address), lower bits are automatically set to 0

# function trinum:
addi a0, x0, 4 # n and result
addi t2, x0, 2 # amount of times trinum is called
addi t3, x0, 0 # counter 

# save t2, t3 on stack
addi sp, sp, -8
sw t2, 4(sp)
sw t3, 0(sp)


L1:
# save t0, t1 on stack
addi sp, sp, -8
sw t0, 4(sp)
sw t1, 0(sp)

# start of loop
addi t0, a0, 0 # temp var that stores n
addi t1, x0, 1 # counter

L2:
add a0, a0, t1
addi t1, t1, 1
bne t1, t0, L2
# end of loop

# restore t0, t1 from stack
lw t1, 0(sp)
lw t0, 4(sp)
addi sp, sp, 8 # free space on stack

addi t3, t3, 1
blt t3, t2, L1

# restore t2, t3 from stack
lw t3, 0(sp)
lw t2, 4(sp)
addi sp, sp, 8 # free space on stack
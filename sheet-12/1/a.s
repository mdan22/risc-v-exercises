# Pseudocode:

# for-loop:
# a0 = 4
# t0 = a0
# t1 = 1
#
# do
#   a0 += t1
#   t1++
# while (t1!=t0)
# done

# using if:
# a0 = 4
# t0 = a0
# t1 = 1
#
# a0 += t1
# t1++
# if (t0!=t1)
#   go to line 19
# end if;


# Assembly Code:

# Precondition: save registers on stack, init vars a0, t0=a0
# example: a0=4

# Initialize stack pointer
lui sp, 0x10000   # Set stack pointer to 0x10000000 (safe memory address), lower bits are automatically set to 0

# save t0, t1 on stack
addi sp, sp, -8
sw t0, 4(sp)
sw t1, 0(sp)

# start of loop
addi a0, x0, 4 # n and result
addi t0, a0, 0 # temp var that stores n
addi t1, x0, 1 # counter

L1:
add a0, a0, t1
addi t1, t1, 1
bne t1, t0, L1
# end of loop

# restore t0, t1 from stack
lw t1, 0(sp)
lw t0, 4(sp)
addi sp, sp, 8 # free space on stack
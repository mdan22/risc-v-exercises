# Pseudocode:

# tri_num(int n) {
#   int accumulator = n
#
#   for (int i = accumulator, i > 0, i--) {
#     accumulator += j
#   }
# }


# Assembly Code:

# Precondition: save register(s) on stack, init vars a0=n=4, t0=a0

tri_num:

# init stack pointer
lui sp, 0x10000   # Set stack pointer to 0x10000000 (safe memory address), lower bits are automatically set to 0

# save t0 on stack
addi sp, sp, -4
sw t0, 0(sp)

addi a0, x0, 4 # init with n and stores result at the end
addi t0, a0, 0 # temp var that counts down from n

L1:
# start of loop
addi t0, t0, -1
add a0, a0, t0
bne t0, x0, L1
# end of loop

# restore t0 from stack
lw t0, 0(sp)
addi sp, sp, 4 # free space on stack
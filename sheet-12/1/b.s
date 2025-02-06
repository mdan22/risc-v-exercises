# Pseudocode:

# tri_num_nested(int n, int nestings) {
#   int accumulator = n
#
#   for (int i = nestings, i > 0, i--) {
#     for (int j = accumulator, j > 0, j--) {
#       accumulator += j
#     }
#   }
# }

# Assembly Code:

# nested calculator of triangular numbers
# Precondition: sw reg on stack, init vars: sp, a0=4, t0=a0, t1=2

tri_num_nested:

# init stack pointer
lui sp, 0x10000   # Set stack pointer to 0x10000000 (safe memory address), lower bits are automatically set to 0

# save t0, t1 on stack
addi sp, sp, -8
sw t0, 4(sp)
sw t1, 0(sp)

# init a0, t0, t1
addi a0, x0, 4 # a0 = n and a0 stores result at end
addi t1, x0, 2 # t1 = nestings

nestings_loop:
  addi t0, a0, 0 # t0 = a0, needs to be set each nesting

  tri_num_loop:
    addi t0, t0, -1
    add a0, a0, t0
    bne t0, x0, tri_num_loop
  # end tri_num_loop

  addi t1, t1, -1
  bne t1, x0, nestings_loop
# end nestings_loop

# restore t0, t1 from stack
lw t1, 0(sp)
lw t0, 4(sp)
addi sp, sp, 8 # free space on stack
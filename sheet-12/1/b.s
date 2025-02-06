# Pseudocode:

# trinum(trinum(n))
#   a0 = 4
#
# trinum:
#   do-while-loop:
#   t0 = a0
#   t1 = 1
#
#   do
#     a0 += t1
#     t1++
#   while (t1!=t0)
#   done


# Assembly Code:

# nested calculator of triangular numbers
# Precondition: sw reg on stack, init var a0=4, t0=a0, t1=2

tri_num_nested:

# Initialize stack pointer
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
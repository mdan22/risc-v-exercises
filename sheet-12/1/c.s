# Pseudocode:

# recursive_tri_num(int n) {
#   if(n=1) then
#     return 1;
#   else
#     return n + recursive_tri_num(n-1)
# }


# Assembly Code:

# calculator of triangular numbers using recursion
# Precondition: sw reg on stack, init vars: sp, a0=n=4

# init stack pointer
lui sp, 0x10000

# main program {

  # store ra on stack
  ADDI sp, sp, -4
  SW ra, 0(sp)

  # load example 4 into a0
  ADDI a0, x0, 4
  JAL ra, tri_num_recursive

  # restore stack
  LW ra, 0(sp)
  ADDI sp, sp, 4

JAL x0, END # } end of main program

tri_num_recursive:
  # store on stack
  ADDI sp, sp, -8
  SW t0, 4(sp)
  SW ra, 0(sp)

  # base case: a0 = 0 saves one line at the cost of one recursion
  # in this case a0 = 0 is returned and it still works
  BEQ a0, x0, tri_done

  ADD t0, x0, a0 # store current a0 in t0
  ADDI a0, a0, -1 # decrement a0
  JAL ra, tri_num_recursive # recursive call
  ADD a0, a0, t0 # a0 = a0 + t0 cuz (n + recursive_tri_num(n-1))

  tri_done:
  # restore stack
  LW ra, 0(sp)
  LW t0, 4(sp)
  ADDI sp, sp, 8

  # return
  JALR x0, ra, 0

END:
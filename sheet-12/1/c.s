# Pseudocode:

# recursive_tri_num(int n) {
#   if(n=1) then
#     return 1;
#   else
#     return n + recursive_tri_num(n-1)
# }


# Assembly Code:

# Dreieckssumme
# a0 (x10) Parameter / Return
# sp (x2)

# init stack pointer
lui sp, 0x10000

# load example 4 into a0
ADDI a0, x0, 4

# Function call(s)
JAL ra, Tri_Num

# end of main program
JAL x0, END

Tri_Num:
# store on stack
ADDI sp, sp, -8
SW t0, 4(sp)
SW ra, 0(sp)

# if done (a0 = 0) // saves one line at the cost of one recursion
BEQ a0, x0, tri_done
# remember present call value in t0
ADD t0, x0, a0
ADDI a0, a0, -1
JAL ra, Tri_Num
ADD a0, a0, t0
JAL x0, tri_done

tri_done:
# restore stack
LW ra, 0(sp)
LW t0, 4(sp)
ADDI sp, sp, 8
# return
JALR x0, ra, 0

END:
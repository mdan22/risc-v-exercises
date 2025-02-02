# Pseudocode:

# recursive_tri_num():
#   n = 4
# if(n=1) then
#   return 1;
# else
#   return n + recursive_tri_num(n-1)


# Assembler (mit Sicherung auf dem Stack):

# precondition: n >= 1

# start of main program
# init a0 with n (here: use example n = 4)
ADDI a0, zero, 4

# init stack pointer
ADDI sp, zero, 0x100

# functions called in main-program should be called here
JAL ra, recursive_tri_num

# end of main programm so jump to end of code
JAL x0, END

recursive_tri_num:

# begin recursive_tri_num {

# save registers to stack
ADDI sp, sp, -8
SW t0, 0 (sp)
SW ra, 4 (sp)

# if (n=1) then return 1;
BEQ a0, zero, tri_num_end

# store current n in t0
ADD t0, zero, a0

# decrement a0
ADDI a0, a0, -1

# call function again with decremented n
JAL ra, recursive_tri_num
# add n of recursion level
ADD a0, a0, t0

tri_num_end:

# } end recursive_tri_num

# restore registers from stack
LW ra, 4 (sp)
LW t0, 0 (sp)
ADDI sp, sp, 8

# return; ra (=x1) is link register
JALR x0, ra, 0

END:

# Pseudocode:

# if (x1==x2) AND (x3=x4) then
#   x10=0;
# else
#   x10=1;
# end if;

# Assembly Code

# precondition: x1 != x2 then we expect x10 = 1 and x1 = 3 as result
addi x1, x0, 2
addi x2, x0, 1
addi x3, x0, 1
addi x4, x0, 1

# actual start of program

beq x1, x2, L0  # if x1 == x2 (1.condition), jump to L0
addi x10, x0, 1 # else block
JAL x0, L2      # jump to L2

L0:
beq x3, x4, L1  # if x1 == x2, (2.condition) jump to L1
addi x10, x0, 1 # else block
JAL x0, L2      # jump to L2

L1:
addi x10, x0, 0 # then block

L2:
add x1, x1, x2  # whatever comes next e.g. store x1 + x2 in x1
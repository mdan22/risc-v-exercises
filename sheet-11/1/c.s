# Pseudocode:

# if (x1==x2) OR (x3==x4) then
#   x10=0;
# else
#   x10=1;
# end if;


# Assembly Code:

# Precondition: init x1, x2, x3, x4

# example initialization: x1 == x2 == 1
# example expected result: x10 = 0

addi x1, x0, 1
addi x2, x0, 1
addi x3, x0, 1
addi x4, x0, 2

# actual start of program

beq x1, x2, L1  # if x1 == x2 (1.condition), jump to L1
beq x3, x4, L1  # if x3 == x4, (2.condition) jump to L1
addi x10, x0, 1 # else block
JAL x0, L2      # jump to L2

L1:
addi x10, x0, 0 # then block

L2:
# whatever comes next e.g. store x1 + x2 in x1
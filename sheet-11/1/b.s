# Pseudocode:

# if (x1==x2) AND (x3==x4) then
#   x10=0;
# else
#   x10=1;
# end if;


# Assembly Code

# Precondition: init x1, x2, x3, x4

# example initialization: x1 = 1, x2 = 1 => (x1 != x2)
# example expected result: x10 = 1

addi x1, x0, 1
addi x2, x0, 2
addi x3, x0, 1
addi x4, x0, 1

# actual start of program

bne x1, x2, L1  # if x1 != x2 (1.condition), jump to L0
bne x3, x4, L1  # if x1 != x2, (2.condition) jump to L1
addi x10, x0, 0 # else block
JAL x0, L2      # jump to L2

L1:
addi x10, x0, 1 # then block

L2:
# whatever comes next
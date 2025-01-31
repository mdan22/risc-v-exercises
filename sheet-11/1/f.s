# Pseudocode:

# using if:

# if (x1==0) then
#   x10=0;
# else if (x1==1) then
#   x10=1;
# else if (x1==2) then
#   x10=2;
# else if (x1==3) then
#   x10=3;
# else
#   x10=42;
# end if;

# using case:

# case x1 in
#   0 then x10=0
#   1 then x10=1
#   2 then x10=2
#   3 then x10=3
#   default then x10=42
# esac

# Assembly Code:

# Precondition: init x1, x20=0, x21=1, x22=2, x23=3

# example initialization: x1 = 1
# example expected result: x10 = 1

addi x1, x0, 0

addi x20, x0, 0
addi x21, x0, 1
addi x22, x0, 2
addi x23, x0, 3

# actual start of program

beq x1, x20, L1 # if x1 = 0, jump to L1 (if condition)
beq x1, x21, L2 # if x1 = 1, jump to L2 (else if condition)
beq x1, x22, L3 # if x1 = 2, jump to L2 (else if condition)
beq x1, x23, L4 # if x1 = 3, jump to L2 (else if condition)
addi x10, x0, 42 # else / default block
jal x0, L5

L1:
addi x10, x0, 0 # then block
jal x0, L5

L2:
addi x10, x0, 1 # then block
jal x0, L5

L3:
addi x10, x0, 2 # then block
jal x0, L5

L4:
addi x10, x0, 3 # then block

L5:
# whatever comes next
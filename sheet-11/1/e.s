# Pseudocode:

# if (x1==x2) then
#   x10=0;
# else if (x3==x4) then
#   x10=1;
# else
#   x10=2;
# end if;


# Assembly Code

# Precondition: init x1, x2, x3, x4

# example initialization: x1 == x2 == 1
# example expected result: x10 = 0

addi x1, x0, 1
addi x2, x0, 1
addi x3, x0, 2
addi x4, x0, 1

# actual start of program

beq x1, x2, L1 # if x1 != x2, jump to L1 (if condition)
beq x3, x4, L2 # if x3 != x4, jump to L2 (else if condition)
addi x10, x0, 2 # else block
jal x0, L3

L1:
addi x10, x0, 0 # then block
jal x0, L3

L2:
addi x10, x0, 1 # elde if block

L3:

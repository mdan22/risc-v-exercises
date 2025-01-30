# Pseudocode:

# if (x1==x2) then
#   x10=0;
# else
#   x10=1;
# end if;


# Assembly Code

# Precondition: init x1, x2

# example initialization: x1 = 1, x2 = 2 => (x1 != x2)
# example expected result: x10 = 0

addi x1, x0, 1
addi x2, x0, 2

# actual start of program

beq x1, x2, L1  # if x1 == x2, jump to L1
addi x10, x0, 1 # else block
JAL x0, L2      # jump to L2

L1:
addi x10, x0, 0 # then block

L2:
# whatever comes next

# Je nachdem welche Bedingung für das Problem relevanter ist, also häufiger auftritt, kann man BNE (mit x1 != x2) oder BEQ (mit x1 == x2) verwenden. Wenn man BNE durch BEQ ersetzt, muss man einfach nur den then block mit dem else block vertauschen. Dann funktioniert der if-then-else-block auch mit BEQ.
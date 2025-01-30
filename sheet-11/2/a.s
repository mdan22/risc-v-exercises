# Pseudocode:

# while-loop:
# x1 = 0
# while (x1<3)
#   x1 = x1 + 1
# done

# using if:
# x1 = 0
# x3 = 3
#
# if (x1>=x3)
#   go to line 18
# else
#   x1 = x1 + 1
# go to line 13
# end if;


# Assembly Code

# Precondition: none

# initialize variables x1=0, x3=3
addi x1, x0, 0
addi x3, x0, 3

L1:
bge x1, x3, L2
addi x1, x1, 1
jal x0, L1

L2:
# whatever comes next
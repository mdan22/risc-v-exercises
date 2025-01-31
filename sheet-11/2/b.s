# Pseudocode:

# do-while-loop:
# do
#   x1 = 0
#   x1 = x1 + 1
# while (x1<3)

# using if:
# x1 = 0
# x3 = 3
#
# x1 = x1 + 1
# if (x1<x3)
#   go to line 12
# end if;


# Assembly Code:

# Precondition: none

# initialize variables x1=0, x3=3
addi x1, x0, 0
addi x3, x0, 3

L1:
addi x1, x1, 1
blt x1, x3, L1

# whatever comes next
# Pseudocode:

# nested for-loop:
# for (int i=1, i++, i<3)
#   for (int j=1, j++, j<3)
#   end for;
# end for;

# using while:
# int i = 0;
# int j = 0;
#
# while (i<3)
#   while (j<3)
#     j++;
#   done;
#   i++;
# done;

# using if:
# int x1 = 0;
# int x2 = 0;
# int x3 = 3;
#
# if (x1<3)
#   if (x2<3)
#     x1++;
#   end if;
#   x2++;
# end if;


# Assembly Code:

# Precondition: none

addi x1, x0, 0
addi x2, x0, 0
addi x3, x0, 3

L1:
bge x1, x3, L4

L2:
bge x2, x3, L3
addi x2, x2, 1
jal x0, L2

L3:
addi x1, x1, 1
jal x0, L1

L4:
# whatever comes next
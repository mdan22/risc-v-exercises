# do-while-loop that counts 1-bits of x2 register and stores result in x3:
# int x2 = 42
# int x3 = 0
# do
#   t1 = shiftRight(x2);
#   t2 = least significant bit(t1)
#   x3++;
# while (0<x2)
# done;


# Assembly Code:

# Precondition: init x2

# example: init x2 with 42
addi x2, x0, 42
# init x3 with 0
addi x3, x0, 0
# init counter
addi t0, x0, 0

L1:
srl t1, x2, t0   # shift x2 by 1 more digit each iteration
andi t2, t1, 1    # and operation on t1 and 1 returns least sig digit of t1
add x3, x3, t2    # add least sig digit (0 or 1) to result
addi t0, t0, 1    # increment t0
bne t1, x0, L1    # check if shifted result is 0, if not redo the loop

L2:
# whatever comes next
# ETI-detector (Pseudocode, sample solution):

# Initialize:
#   base_address = 0x10000000
#   counter = 0
#   offset = 0
#   
# while(true):
#   current_char = memory[base_address + offset]
#   if current_char == null:
#       break
#   if current_char == 'E':
#       offset++
#       current_char = memory[base_address + offset]
#       if current_char == 'T':
#           offset++
#           current_char = memory[base_address + offset]
#           if current_char == 'I':
#               counter++
#   offset++
#   goto while
# end

# ETI-detector (Assembly Code, sample solution):

# load x20 with the address where we read the characters
LUI x20, 0x10000
# initialize match counter
ADDI x10, x0, 0
# initialize offset
ADDI x23, x0, 0

S_idle:
# read next character
ADD x24, x20, x23
LB x21, 0(x24)
# check for null terminator
ADDI x22, x0, 0
BEQ x21, x22, END
ADDI x22, x0, 69
# compare character with 'E'
BEQ x21, x22, S_E
JAL x0, NEXT_CHAR

S_E:
# read next character
ADDI x23, x23, 1
ADD x24, x20, x23
LB x21, 0(x24)
# check for null terminator
ADDI x22, x0, 0
BEQ x21, x22, END
ADDI x22, x0, 84
# compare character with 'T'
BEQ x21, x22, S_T
JAL x0, NEXT_CHAR

S_T:
# read next character
ADDI x23, x23, 1
ADD x24, x20, x23
LB x21, 0(x24)
# check for null terminator
ADDI x22, x0, 0
BEQ x21, x22, END
ADDI x22, x0, 73
# compare character with 'I'
BEQ x21, x22, S_I
JAL x0, NEXT_CHAR

S_I:
# we had a match so inc x10
ADDI x10, x10, 1

NEXT_CHAR:
# increment offset
ADDI x23, x23, 1
JAL x0, S_idle

END:
# program ends, x10 contains number of ETI matches
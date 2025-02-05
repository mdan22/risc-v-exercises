# ETI test string generator

# Address starts at 0x10000000
# Initialize memory with test characters
LUI x20, 0x10000     # Base address for test string
ADDI x21, x0, 72     # 'H' (ASCII: 72)
SB x21, 0(x20)
ADDI x21, x0, 69     # 'E' (ASCII: 69)
SB x21, 1(x20)
ADDI x21, x0, 76     # 'L' (ASCII: 76)
SB x21, 2(x20)
ADDI x21, x0, 76     # 'L' (ASCII: 76)
SB x21, 3(x20)
ADDI x21, x0, 79     # 'O' (ASCII: 79)
SB x21, 4(x20)
ADDI x21, x0, 32     # ' ' (ASCII: 32)
SB x21, 5(x20)

# First ETI
ADDI x21, x0, 69     # 'E' (ASCII: 69)
SB x21, 6(x20)
ADDI x21, x0, 84     # 'T' (ASCII: 84)
SB x21, 7(x20)
ADDI x21, x0, 73     # 'I' (ASCII: 73)
SB x21, 8(x20)

# Rest of string
ADDI x21, x0, 32     # ' ' (ASCII: 32)
SB x21, 9(x20)
ADDI x21, x0, 87     # 'W' (ASCII: 87)
SB x21, 10(x20)
ADDI x21, x0, 79     # 'O' (ASCII: 79)
SB x21, 11(x20)
ADDI x21, x0, 82     # 'R' (ASCII: 82)
SB x21, 12(x20)
ADDI x21, x0, 76     # 'L' (ASCII: 76)
SB x21, 13(x20)
ADDI x21, x0, 68     # 'D' (ASCII: 68)
SB x21, 14(x20)
ADDI x21, x0, 32     # ' ' (ASCII: 32)
SB x21, 15(x20)

# Second ETI
ADDI x21, x0, 69     # 'E' (ASCII: 69)
SB x21, 16(x20)
ADDI x21, x0, 84     # 'T' (ASCII: 84)
SB x21, 17(x20)
ADDI x21, x0, 73     # 'I' (ASCII: 73)
SB x21, 18(x20)

# Terminator
ADDI x21, x0, 0      # Null terminator (ASCII: 0)
SB x21, 19(x20)
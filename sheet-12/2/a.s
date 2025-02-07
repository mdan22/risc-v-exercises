# ETI-detector (Pseudocode):

# eti_detector(memory[]) {
#   // init index, character, matches:
#   index = 0 // can be implemented as stack pointer
#   index--
#   char character;
#   int matches = 0

#   // Check for sequence E->T->I
#   while (true) {
#     load_next_char();
#     if (character == 'E') {
#       load_next_char();
#       if (character == 'T') {
#         load_next_char();
#         if (character == 'I') {
#           matches++
#         }
#       }
#     }
#   }

#   // before each check we load the next character
#   load_next_char() {
#     index++
#     character = memory[index]
#     if (current_char == null) {
#       return matches
#     }
#   }
# }


# ETI-detector (Assembly Code):
# sp is used as stack pointer
# t0 is used to load a character
# t1 is used to store E, T, I so t0 can be compared to it

# init stack pointer to 256 (use hex for addresses)
lui sp, 0x10000    # Set memory base address 0x1000 0000

# at cost of this line we can use load_next_char more often
addi sp, sp, -1
# set match matches to 0
addi a0, x0, 0

eti_detector:

check_e:
jal ra, load_next_char
addi t1, x0, 69
beq t0, t1, check_t

check_t:
jal ra, load_next_char
addi t1, x0, 84
beq t0, t1, check_i

check_i:
jal ra, load_next_char
addi t1, x0, 73
bne t0, t1, check_e
addi a0, a0, 1

load_next_char:
ADDI sp, sp, 1
lb t0, 0(sp)
beq t0, x0, end
jalr x0, ra, 0

end:
# end of program, a0 contains amount of ETI occurances
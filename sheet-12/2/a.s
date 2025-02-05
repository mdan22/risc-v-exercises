# ETI-detector (Pseudocode):

# init base_address, counter:
#   base_address = 0x10000000
#   counter = 0
#   
# start:
#   current_char = memory[base_address]
#   if current_char == null:
#       end program
#   
#   // Check for sequence E->T->I
#   if current_char == 'E':
#       next_char = memory[base_address + 1]
#       if next_char == 'T':
#           next_next_char = memory[base_address + 2] 
#           if next_next_char == 'I':
#               counter++
#   
#   base_address++
#   goto start
#
# end:
#   return counter


# ETI-detector (Assembly Code):

# init stack pointer to 256 (use hex for addresses)
lui t1, 0x10000    # Set memory base address 0x10000000
# set match counter to 0
addi a0, x0, 0
# will use t2 to compare current character

start:
lb t0, 0(t1)
beq t0, x0, end

check_e:
addi t2, x0, 69
beq t0, t2, check_t
jal x0, next_char

check_t:
addi t1, t1, 1  # Move to next character
lb t0, 0(t1)    # Load next character
addi t2, x0, 84
beq t0, t2, check_i
jal x0, next_char

check_i:
addi t1, t1, 1  # Move to next character
lb t0, 0(t1)    # Load next character
addi t2, x0, 73
beq t0, t2, found_eti
jal x0, next_char

found_eti:
addi a0, a0, 1

next_char:
ADDI t1, t1, 1
jal x0, start

end:
# end of program, a0 contains amount of ETI occurances
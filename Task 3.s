.text
.globl main
main:
    li x25, 0x200       # Load array base address (0x200) into x25[cite: 1]
    li x5, 10           # Set loop upper bound limit to 10
    li x22, 0           # Initialize i = 0
    
Loop1:
    bge x22, x5, Loop1_End  # If i >= 10, exit Loop 1
    slli x10, x22, 2    # Compute byte offset = i * 4 (4-byte integers)[cite: 1]
    add x10, x10, x25   # Compute absolute memory address (0x200 + offset)[cite: 1]
    sw x22, 0(x10)      # Store current value of i into a[i]
    addi x22, x22, 1    # i = i + 1
    beq x0, x0, Loop1   # Repeat Loop 1
    
Loop1_End:
    li x23, 0           # Initialize sum = 0
    li x22, 0           # Reset i = 0 for the second loop

Loop2:
    bge x22, x5, Loop2_End  # If i >= 10, exit Loop 2
    slli x10, x22, 2    # Compute byte offset = i * 4[cite: 1]
    add x10, x10, x25   # Compute absolute memory address (0x200 + offset)[cite: 1]
    lw x9, 0(x10)       # Load a[i] from memory into temporary register x9
    add x23, x23, x9    # sum = sum + a[i]
    addi x22, x22, 1    # i = i + 1
    beq x0, x0, Loop2   # Repeat Loop 2
    
Loop2_End:

end:
    j end
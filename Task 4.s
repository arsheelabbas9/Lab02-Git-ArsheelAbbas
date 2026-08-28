.data
    # Allocate space in memory for array D so the store instruction has a valid target
    .align 2
    D: .space 256        # Allocating 256 bytes for array D

.text
.globl main
main:
    # TASK 4: nested loops — regs: a=x5 b=x6 i=x7 j=x29 D=x10
    li x5, 3            # a = 3
    li x6, 3            # b = 3
    la x10, D           # D base address

    li x7, 0            # i = 0

OuterLoop:
    bge x7, x5, OuterEnd # If i >= a, exit outer loop
    
    li x29, 0           # Initialize inner loop variable j = 0 (j = x29)

InnerLoop:
    bge x29, x6, InnerEnd # If j >= b, exit inner loop
    
    slli x11, x29, 4    # x11 = j * 16 (byte offset for D[4*j])
    add  x12, x10, x11  # x12 = address of D[4*j]

    add  x13, x7, x29   # x13 = i + j
    sw   x13, 0(x12)    # store i+j at D[4*j]
    
    addi x29, x29, 1    # j = j + 1 (j++)
    j    InnerLoop      # Repeat inner loop

InnerEnd:
    addi x7, x7, 1      # i = i + 1 (i++)
    j    OuterLoop      # Repeat outer loop

OuterEnd:

end:
    # Infinite loop to halt program execution for inspection
    j end
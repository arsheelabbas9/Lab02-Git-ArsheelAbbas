.data
    save: .word 2, 2, 4, 2
.text
.globl main
main:
   
    li x22, 0           # i = 0
    li x24, 2           # k = 2 (loop continues while save[i] == 2)
    la x25, save        # Load base memory address of 'save' array into x25
 
Loop: 
    slli x10, x22, 2    # Temp reg x10 = i * 4 (Modified: shift left by 2)
    add x10, x10, x25   # x10 = absolute address of save[i]
    lw x9, 0(x10)       # Temp reg x9 = save[i] (Modified: ld to lw)
    bne x9, x24, end    # go to Exit if save[i] != k
    addi x22, x22, 1    # i = i + 1
    beq x0, x0, Loop    # unconditional jump to Loop
    
end:
    j end







    
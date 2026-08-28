.text
.globl main
main:
    li x20, 3           # x = 3 (Change this from 1 to 4 to test different cases)
    li x22, 10          # b = 10 (Suitable initial value for b)
    li x23, 4           # c = 4  (Suitable initial value for c)
    li x21, 0           # Initialize a = 0

    li x5, 1
    beq x20, x5, Case1  # Check if x == 1
    li x5, 2
    beq x20, x5, Case2  # Check if x == 2
    li x5, 3
    beq x20, x5, Case3  # Check if x == 3
    li x5, 4
    beq x20, x5, Case4  # Check if x == 4
    j Default   # Default case
Case1:
    add x21, x22, x23   # a = b + c
    j end
Case2:
    sub x21, x22, x23   # a = b - c
    j end
Case3:
    slli x21, x22, 1    # a = b * 2 (using shift left logical by 1)
    j end
Case4:
    srai x21, x22, 1    # a = b / 2 (using shift right arithmetic by 1)
    j end
Default:
    li x21, 0           # a = 0
end:
    j end










    






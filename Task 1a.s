.text
.globl main
main:
    # Assuming variables: f=x19, g=x20, h=x21, i=x22, j=x23
    li x20, 15          # g = 15
    li x21, 5           # h = 5
    li x22, 1           # i = 1
    li x23, 2           # j = 2 

    bne x22, x23, Else  # branch if not equal
    add x19, x20, x21
    beq x0, x0, end     

Else: 
    sub x19, x20, x21   # f = g - h
end:
    j end
    




    
    .text
    .globl main
main:
    pushq %rbp
    movq $massage,%rdi
    movq $42,%rsi
    xor %rax, %rax 
    call printf
    popq %rbp
    ret
    .data
massage:
    .string "n = %d\n"


# I did my best to do this hw.
# Sorry for ask too many problem.
# Sorry for exercise7, I did not really did it.
# I use assembler to assemble code and remake it.
# For p1~p6, I did by myself. Reference: Chatgpt, handout 02, nqueen.s

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


# I did my best to use stack frame at exercise 4~6.

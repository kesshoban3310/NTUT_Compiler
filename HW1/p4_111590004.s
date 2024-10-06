    .text
    .globl main
main:
    pushq %rbp        
    movq (x),%rax
    imulq %rax,%rax
    movq %rax,y

    movq (x),%rax
    addq (y),%rax

    movq $massage,%rdi
    movq %rax,%rsi
    call printf

    xor %rax, %rax      
    popq %rbp          
    ret

    .data
x: 
    .quad 2
y: 
    .quad 0
massage:
    .string "%d\n"

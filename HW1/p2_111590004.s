    .text
    .globl main
main:
    pushq %rbp
    movq $massage,%rdi

    # 4 + 6
    movq $4,%r8
    movq $6,%r9
    addq %r8,%r9
    movq %r9,%rsi
    xor %rax, %rax 
    call printf

    xor %r9,%r9
    xor %r8,%r8

    # 21 * 2
    movq $massage,%rdi
    movq $21,%r8
    salq $1,%r8
    movq %r8,%rsi
    xor %rax, %rax 
    call printf


    # 4 + 7 / 2
    movq $massage,%rdi
    movq $7,%r8
    movq $4,%r9
    sarq $1,%r8
    addq %r9,%r8
    movq %r8,%rsi
    xor %rax, %rax 
    call printf

    # 3 - 6 * (10 / 5)
    movq $massage,%rdi
    movq $3,%r8
    movq $6,%r9
    movq $5,%r10
    movq $10,%rax
    idiv %r10
    imul %r9
    movq %rax,%r9
    sub %r9,%r8
    movq %r8,%rsi

    call printf

    popq %rbp
    ret
    .data
massage:
    .string "%d\n"

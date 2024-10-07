    .text
    .globl main

# r8 => n,r9 => c , r10 => s
isqrt:
    movq %rdi,%r8
    movq $0,%r9
    movq $1,%r10
    jmp isqrt_expr
    
isqrt_expr:
    cmpq %r8,%r10
    jle isqrt_loop
    movq %r9,%rax
    ret

isqrt_loop:
    incq %r9
    leaq 1(%r10,%r9,2),%r10
    jmp isqrt_expr

main:
    pushq %rbp
    movq %rsp,%rbp
    jmp loop_expr

loop_expr:
    cmp $20,(n)
    jle loop
    xorq %rax,%rax
    popq %rbp
    ret

loop:
    movq (n),%rdi
    call isqrt

    movq $massage,%rdi
    movq (n),%rsi
    movq %rax,%rdx
    call printf

    xorq %rax,%rax
    incq (n)
    jmp loop_expr

    .data
massage:
    .string "sqrt(%2d) = %2d\n"
n:
    .quad 0

# I did my best to use stack frame at exercise 4~6.

    .text
    .globl main

# r8 => n,r9 => c , r10 => s
isqrt:
    movq %rdi,%r8
    movq $0,%r9
    movq $1,%r10
    jmp isqrt_loop
    
isqrt_loop:
    cmpq %r8,%r10
    jg isqrt_end

    incq %r9
    movq %r9,%r11
    shlq $1,%r11
    addq $1,%r11
    addq %r11,%r10

    jmp isqrt_loop
isqrt_end:
    movq %r9,%rax
    ret

main:
    pushq %rbp
    movq %rsp,%rbp
    jmp loop
loop:
    cmp $20,(n)
    jg end_loop

    movq (n),%rdi
    call isqrt

    movq $massage,%rdi
    movq (n),%rsi
    movq %rax,%rdx
    call printf

    xorq %rax,%rax
    incq (n)
    jmp loop
end_loop:
    xorq %rax,%rax
    popq %rbp
    ret

    .data
massage:
    .string "sqrt(%2d) = %2d\n"
debug_message:
    .string "%2d\n"
n:
    .quad 0

# I did my best to use stack frame at exercise 4~6.

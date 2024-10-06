    .text
    .globl main

main:

    pushq %rbp
    movq %rsp,%rbp
    # true && false
    movq $0,%r8
    movq $1,%r9
    andq %r8,%r9
    cmp %r8,%r9
    jz print_false
    jnz print_true
    print_true:
        movq $true_message, %rdi
        call printf
    print_false:
        movq $false_message, %rdi
        call printf
    # if 3 <> 4 then 10 * 2 else 14
    movq $3,%r8
    movq $4,%r9
    jmp if_condition
    if_condition:
        cmp %r8,%r9
        jne true_condition
        je false_condition
    false_condition:
        movq $14,%rsi
        movq $message,%rdi
        call printf
    true_condition:
        movq $10,%rsi
        shlq $1,%rsi
        movq $message,%rdi
        call printf

    # 2 = 3 || 4 <= 2 * 3

    movq $2,%r8
    movq $3,%r9
    movq $4,%r10
    movq $3,%r11
    shlq $1,%r11

    cmp %r8,%r9
    je or_true_print
    cmp %r11,%r10
    jle or_true_print
    jmp or_false_print
    or_true_print:
        movq $true_message, %rdi
        call printf
        jmp end
    or_false_print:
        movq $false_message, %rdi
        call printf
        jmp end
end:
    xor %rax,%rax
    popq %rbp
    ret
    .data

message:
    .string "%d\n"
true_message:
    .string "true\n"
false_message: 
    .string "false\n"

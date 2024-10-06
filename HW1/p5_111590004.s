    .text
    .globl main
main:
    pushq %rbp    
       
    # print(let x = 3 in x*x)   
    movq (x),%rax
    imulq %rax,%rax
    movq %rax,x
    movq $massage,%rdi
    movq %rax,%rsi
    call printf

    # reset x = 3
    movq $3,x

    # let x = 3 in (let y = x + x in x * y) + (let z = x + 3 in z / z)

    # (let y = x + x in x * y)
    movq (x),%r8
    addq %r8,%r8
    movq (x),%rax
    imul %r8 
    movq %rax,y

    xor %r8,%r8
    xor %rax,%rax
    
    # (let z = x + 3 in z / z)
    movq (x),%r8
    addq $3,%r8
    movq %r8,z
    movq (z),%r8
    movq (z),%rax
    idiv %r8  #  %rax / %r8 => z/z => 1
    movq %rax,(z)

    # Combine it
    movq (z),%rax
    addq (y),%rax

    movq %rax,x
    movq $massage,%rdi
    movq %rax,%rsi
    call printf

    xor %rax, %rax      
    popq %rbp          
    ret

    .data
x: 
    .quad 3
y: 
    .quad 0
z:
    .quad 0
massage:
    .string "%d\n"

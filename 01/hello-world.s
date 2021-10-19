@
@ Assembler program to print 'Hello world!' to stdout.
@
@ R0-R2 - parameters to Linux function services
@ R7 - Linux function number
@

.global _start @ Provide program starting
@ Address to linker

@ Set up the parameters to print 'Hello world!' and then call Linux to do it
_start: mov R0, #1 @ 1 = stdout
ldr R1, =hello_world @ string to print
mov R2, #13 @ Length of our string
mov R7, #4 @ Linux write system call
svc 0 @ Call Linux to print

@ Set up the parameters to exit the parameters to exit the program and then
@ call Linux to do it.
mov R0, #0 @ Use 0 return code
mov R7, #1 @ Service command code 1 terminates program
svc 0 @ Call Linux to terminate

.data
hello_world: .ascii "Hello world!\n"

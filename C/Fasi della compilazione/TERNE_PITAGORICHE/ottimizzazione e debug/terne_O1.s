	.file	"terne.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Inserisci il numero di terne pitagoriche da generare: \0"
.LC1:
	.ascii "%d\0"
	.align 8
.LC2:
	.ascii "Le prime %d terne pitagoriche sono:\12\0"
.LC3:
	.ascii "%d %d %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	60(%rsp), %rdx
	leaq	.LC1(%rip), %rcx
	call	scanf
	movl	60(%rsp), %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$3, %r15d
	movl	$0, %r12d
	movl	$1, %r13d
	leaq	.LC3(%rip), %r14
	cmpl	$0, 60(%rsp)
	jg	.L2
.L3:
	movl	$0, %eax
	addq	$72, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	ret
.L13:
	movl	%ebx, %r9d
	movl	%ebp, %r8d
	movl	%r13d, %edx
	movq	%r14, %rcx
	call	printf
	addl	$1, %r12d
.L4:
	addl	$1, %ebx
	cmpl	%edi, %ebx
	je	.L8
.L5:
	movl	%ebx, %eax
	imull	%ebx, %eax
	cmpl	%eax, %esi
	jne	.L4
	jmp	.L13
.L8:
	addl	$1, %ebp
	addl	$2, %edi
	cmpl	%r15d, %ebp
	je	.L6
.L9:
	leal	(%rbp,%rbp), %eax
	cmpl	%ebp, %eax
	jl	.L8
	movl	%ebp, %esi
	imull	%ebp, %esi
	addl	44(%rsp), %esi
	movl	%ebp, %ebx
	jmp	.L5
.L6:
	addl	$1, %r13d
	addl	$2, %r15d
	cmpl	%r12d, 60(%rsp)
	jle	.L3
.L2:
	leal	(%r13,%r13), %eax
	cmpl	%eax, %r13d
	jg	.L6
	movl	%r13d, %eax
	imull	%r13d, %eax
	movl	%eax, 44(%rsp)
	movl	%r15d, %edi
	movl	%r13d, %ebp
	jmp	.L9
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef

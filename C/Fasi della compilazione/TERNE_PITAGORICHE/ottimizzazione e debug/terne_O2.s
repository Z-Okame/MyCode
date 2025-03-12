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
	.section	.text.startup,"x"
	.p2align 4,,15
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
	xorl	%edi, %edi
	movl	$3, %r13d
	movl	$1, %ebp
	leaq	.LC3(%rip), %r12
	call	__main
	leaq	.LC0(%rip), %rcx
	call	printf
	leaq	60(%rsp), %rdx
	leaq	.LC1(%rip), %rcx
	call	scanf
	movl	60(%rsp), %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	60(%rsp), %eax
	testl	%eax, %eax
	jle	.L3
	.p2align 4,,10
.L2:
	leal	(%rbp,%rbp), %eax
	cmpl	%eax, %ebp
	jg	.L6
	movl	%ebp, %eax
	movl	%r13d, %r15d
	movl	%ebp, %r14d
	imull	%ebp, %eax
	movl	%eax, 44(%rsp)
	.p2align 4,,10
.L9:
	leal	(%r14,%r14), %eax
	cmpl	%r14d, %eax
	jl	.L8
	movl	%r14d, %esi
	movl	%r14d, %ebx
	imull	%r14d, %esi
	addl	44(%rsp), %esi
	jmp	.L5
	.p2align 4,,10
.L4:
	addl	$1, %ebx
	cmpl	%ebx, %r15d
	je	.L8
.L5:
	movl	%ebx, %eax
	imull	%ebx, %eax
	cmpl	%eax, %esi
	jne	.L4
	movl	%ebx, %r9d
	movl	%r14d, %r8d
	movl	%ebp, %edx
	movq	%r12, %rcx
	addl	$1, %ebx
	addl	$1, %edi
	call	printf
	cmpl	%ebx, %r15d
	jne	.L5
	.p2align 4,,10
.L8:
	addl	$1, %r14d
	addl	$2, %r15d
	cmpl	%r13d, %r14d
	jne	.L9
.L6:
	addl	$1, %ebp
	addl	$2, %r13d
	cmpl	%edi, 60(%rsp)
	jg	.L2
.L3:
	xorl	%eax, %eax
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
	.seh_endproc
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef

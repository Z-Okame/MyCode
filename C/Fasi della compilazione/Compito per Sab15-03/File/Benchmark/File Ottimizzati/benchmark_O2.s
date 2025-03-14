	.file	"benchmark.c"
	.text
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Tempo di esecuzione: %f secondi\12\0"
	.section	.text.startup,"x"
	.p2align 4,,15
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
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
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	a(%rip), %rbx
	movl	$1717986919, %edi
	leaq	2000+a(%rip), %rsi
	leaq	1002000+a(%rip), %rbp
	call	__main
	call	clock
	xorl	%ecx, %ecx
	movl	%eax, %r14d
	call	*__imp__time64(%rip)
	movl	%eax, %ecx
	call	srand
.L2:
	leaq	-2000(%rsi), %r12
.L3:
	call	rand
	addq	$4, %r12
	movl	%eax, %ecx
	imull	%edi
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, -4(%r12)
	cmpq	%rsi, %r12
	jne	.L3
	leaq	2000(%r12), %rsi
	cmpq	%rbp, %rsi
	jne	.L2
	leaq	b(%rip), %r12
	movl	$1717986919, %ebp
	leaq	2000+b(%rip), %rdi
	leaq	1002000+b(%rip), %rsi
.L6:
	leaq	-2000(%rdi), %r13
.L5:
	call	rand
	addq	$4, %r13
	movl	%eax, %ecx
	imull	%ebp
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, -4(%r13)
	cmpq	%rdi, %r13
	jne	.L5
	leaq	2000(%r13), %rdi
	cmpq	%rsi, %rdi
	jne	.L6
	leaq	prod(%rip), %r10
	leaq	1000000+prod(%rip), %r11
	subq	%r12, %r10
	leaq	1000000(%r12), %rdi
	subq	%r12, %r11
.L7:
	movq	%rdi, %r9
.L11:
	movl	-1000000(%r10,%r9), %r8d
	leaq	-1000000(%r9), %rax
	movq	%rbx, %rcx
	.p2align 4,,10
.L8:
	movl	(%rcx), %edx
	addq	$2000, %rax
	addq	$4, %rcx
	imull	-2000(%rax), %edx
	addl	%edx, %r8d
	cmpq	%r9, %rax
	jne	.L8
	leaq	4(%rax), %r9
	movl	%r8d, -1000000(%r10,%rax)
	cmpq	%rsi, %r9
	jne	.L11
	addq	$2000, %r10
	addq	$2000, %rbx
	cmpq	%r11, %r10
	jne	.L7
	call	clock
	leaq	.LC1(%rip), %rcx
	pxor	%xmm0, %xmm0
	subl	%r14d, %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LC0(%rip), %xmm0
	movapd	%xmm0, %xmm1
	movq	%xmm0, %rdx
	call	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%rbp
	popq	%r12
	popq	%r13
	popq	%r14
	ret
	.seh_endproc
	.comm	prod, 1000000, 5
	.comm	b, 1000000, 5
	.comm	a, 1000000, 5
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef

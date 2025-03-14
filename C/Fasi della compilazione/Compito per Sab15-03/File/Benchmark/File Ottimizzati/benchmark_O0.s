	.file	"benchmark.c"
	.text
	.comm	a, 1000000, 5
	.comm	b, 1000000, 5
	.comm	prod, 1000000, 5
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Tempo di esecuzione: %f secondi\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	call	clock
	movl	%eax, -16(%rbp)
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	$0, -8(%rbp)
	jmp	.L3
.L4:
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leaq	a(%rip), %rax
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	-4(%rbp), %r8d
	movslq	%r8d, %r8
	imulq	$500, %r8, %r8
	addq	%r8, %rcx
	movl	%edx, (%rax,%rcx,4)
	addl	$1, -8(%rbp)
.L3:
	cmpl	$499, -8(%rbp)
	jle	.L4
	addl	$1, -4(%rbp)
.L2:
	cmpl	$499, -4(%rbp)
	jle	.L5
	movl	$0, -4(%rbp)
	jmp	.L6
.L9:
	movl	$0, -8(%rbp)
	jmp	.L7
.L8:
	call	rand
	movl	%eax, %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	leaq	b(%rip), %rax
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	movl	-4(%rbp), %r8d
	movslq	%r8d, %r8
	imulq	$500, %r8, %r8
	addq	%r8, %rcx
	movl	%edx, (%rax,%rcx,4)
	addl	$1, -8(%rbp)
.L7:
	cmpl	$499, -8(%rbp)
	jle	.L8
	addl	$1, -4(%rbp)
.L6:
	cmpl	$499, -4(%rbp)
	jle	.L9
	movl	$0, -4(%rbp)
	jmp	.L10
.L15:
	movl	$0, -8(%rbp)
	jmp	.L11
.L14:
	movl	$0, -12(%rbp)
	jmp	.L12
.L13:
	leaq	prod(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$500, %rcx, %rcx
	addq	%rcx, %rdx
	movl	(%rax,%rdx,4), %r8d
	leaq	a(%rip), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$500, %rcx, %rcx
	addq	%rcx, %rdx
	movl	(%rax,%rdx,4), %r9d
	leaq	b(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	imulq	$500, %rcx, %rcx
	addq	%rcx, %rdx
	movl	(%rax,%rdx,4), %eax
	imull	%r9d, %eax
	leal	(%r8,%rax), %ecx
	leaq	prod(%rip), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	movl	-4(%rbp), %r8d
	movslq	%r8d, %r8
	imulq	$500, %r8, %r8
	addq	%r8, %rdx
	movl	%ecx, (%rax,%rdx,4)
	addl	$1, -12(%rbp)
.L12:
	cmpl	$499, -12(%rbp)
	jle	.L13
	addl	$1, -8(%rbp)
.L11:
	cmpl	$499, -8(%rbp)
	jle	.L14
	addl	$1, -4(%rbp)
.L10:
	cmpl	$499, -4(%rbp)
	jle	.L15
	call	clock
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	subl	-16(%rbp), %eax
	cvtsi2sd	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm1
	movsd	-32(%rbp), %xmm0
	movq	%xmm0, %rdx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef

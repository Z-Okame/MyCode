	.file	"benchmark.c"
	.text
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
	call	__main
	call	clock
	movl	%eax, %r14d
	movl	$0, %ecx
	call	*__imp__time64(%rip)
	movl	%eax, %ecx
	call	srand
	leaq	a(%rip), %rbx
	leaq	2000+a(%rip), %rdi
	leaq	1002000+a(%rip), %r12
	movl	$1717986919, %ebp
.L2:
	leaq	-2000(%rdi), %rsi
.L3:
	call	rand
	movl	%eax, %ecx
	imull	%ebp
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, (%rsi)
	addq	$4, %rsi
	cmpq	%rdi, %rsi
	jne	.L3
	addq	$2000, %rdi
	cmpq	%r12, %rdi
	jne	.L2
	leaq	b(%rip), %rdi
	leaq	2000+b(%rip), %r12
	leaq	1002000+b(%rip), %rsi
	movl	$1717986919, %r13d
	jmp	.L6
.L17:
	addq	$2000, %r12
	cmpq	%rsi, %r12
	je	.L16
.L6:
	leaq	-2000(%r12), %rbp
.L5:
	call	rand
	movl	%eax, %ecx
	imull	%r13d
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, 0(%rbp)
	addq	$4, %rbp
	cmpq	%r12, %rbp
	jne	.L5
	jmp	.L17
.L16:
	leaq	prod(%rip), %r10
	subq	%rdi, %r10
	leaq	1000000+prod(%rip), %rbp
	subq	%rdi, %rbp
	jmp	.L7
.L18:
	movl	%r8d, -1000000(%r11,%r9)
	addq	$4, %r9
	cmpq	%rsi, %r9
	je	.L9
.L11:
	movq	%r10, %r11
	movl	-1000000(%r10,%r9), %r8d
	leaq	-1000000(%r9), %rax
	movq	%rbx, %rcx
.L8:
	movl	(%rcx), %edx
	imull	(%rax), %edx
	addl	%edx, %r8d
	addq	$4, %rcx
	addq	$2000, %rax
	cmpq	%r9, %rax
	jne	.L8
	jmp	.L18
.L9:
	addq	$2000, %r10
	addq	$2000, %rbx
	cmpq	%rbp, %r10
	je	.L10
.L7:
	leaq	1000000(%rdi), %r9
	jmp	.L11
.L10:
	call	clock
	subl	%r14d, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	divsd	.LC0(%rip), %xmm0
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$0, %eax
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

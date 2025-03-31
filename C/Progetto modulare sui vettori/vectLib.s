	.file	"vectLib.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%g\0"
.LC1:
	.ascii ", \0"
.LC2:
	.ascii "]\0"
	.text
	.globl	print_vec
	.def	print_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	print_vec
print_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$91, %ecx
	call	putchar
	movq	$0, -8(%rbp)
	jmp	.L2
.L4:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC0(%rip), %rcx
	call	printf
	movq	24(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -8(%rbp)
	jnb	.L3
	leaq	.LC1(%rip), %rcx
	call	printf
.L3:
	addq	$1, -8(%rbp)
.L2:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L4
	leaq	.LC2(%rip), %rcx
	call	puts
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%lf\0"
	.text
	.globl	scanf_vec
	.def	scanf_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	scanf_vec
scanf_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L6
.L7:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rcx
	call	scanf
	addq	$1, -8(%rbp)
.L6:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L7
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	add_vec
	.def	add_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	add_vec
add_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L9
.L10:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L9:
	movq	-8(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L10
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	adds_vec
	.def	adds_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	adds_vec
adds_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movsd	%xmm1, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L12
.L13:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	addsd	24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L12:
	movq	-8(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L13
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	muls_vec
	.def	muls_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	muls_vec
muls_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movsd	%xmm1, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L15
.L16:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	mulsd	24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L15:
	movq	-8(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L16
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	sub_vec
	.def	sub_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	sub_vec
sub_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L18
.L19:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L18:
	movq	-8(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L19
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	dot_vec
	.def	dot_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	dot_vec
dot_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L21
.L22:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addq	$1, -16(%rbp)
.L21:
	movq	-16(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L22
	movsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	concat_vec
	.def	concat_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	concat_vec
concat_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L25
.L26:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	48(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L25:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L26
	movq	$0, -16(%rbp)
	jmp	.L27
.L28:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rax, %rdx
	movq	24(%rbp), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	leaq	0(,%rax,8), %rcx
	movq	48(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -16(%rbp)
.L27:
	movq	-16(%rbp), %rax
	cmpq	40(%rbp), %rax
	jb	.L28
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	reverse_vec
	.def	reverse_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	reverse_vec
reverse_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L30
.L31:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	24(%rbp), %rax
	subq	-8(%rbp), %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movq	24(%rbp), %rax
	subq	-8(%rbp), %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	-16(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L30:
	movq	24(%rbp), %rax
	shrq	%rax
	cmpq	%rax, -8(%rbp)
	jb	.L31
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	sort_vec
	.def	sort_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	sort_vec
sort_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L33
.L38:
	movq	$0, -16(%rbp)
	jmp	.L34
.L37:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L35
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
.L35:
	addq	$1, -16(%rbp)
.L34:
	movq	24(%rbp), %rax
	subq	-8(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L37
	addq	$1, -8(%rbp)
.L33:
	movq	24(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -8(%rbp)
	jb	.L38
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	shuffle_vec
	.def	shuffle_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	shuffle_vec
shuffle_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movq	24(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -8(%rbp)
	jmp	.L41
.L42:
	call	rand
	cltq
	movq	-8(%rbp), %rdx
	leaq	1(%rdx), %rcx
	movl	$0, %edx
	divq	%rcx
	movq	%rdx, -16(%rbp)
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	subq	$1, -8(%rbp)
.L41:
	cmpq	$0, -8(%rbp)
	jne	.L42
	nop
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	rshft_vec
	.def	rshft_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	rshft_vec
rshft_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L44
	movq	$0, -8(%rbp)
	jmp	.L45
.L46:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L45:
	movq	-8(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L46
	jmp	.L43
.L44:
	movq	32(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L48
.L49:
	movq	-16(%rbp), %rax
	subq	24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	subq	$1, -16(%rbp)
.L48:
	movq	-16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jnb	.L49
	movq	$0, -24(%rbp)
	jmp	.L50
.L51:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -24(%rbp)
.L50:
	movq	-24(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L51
.L43:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	lshft_vec
	.def	lshft_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	lshft_vec
lshft_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L53
	movq	$0, -8(%rbp)
	jmp	.L54
.L55:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L54:
	movq	-8(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L55
	jmp	.L52
.L53:
	movq	$0, -16(%rbp)
	jmp	.L57
.L58:
	movq	-16(%rbp), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -16(%rbp)
.L57:
	movq	32(%rbp), %rax
	subq	24(%rbp), %rax
	cmpq	%rax, -16(%rbp)
	jb	.L58
	movq	32(%rbp), %rax
	subq	24(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L59
.L60:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -24(%rbp)
.L59:
	movq	-24(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L60
.L52:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	rrot_vec
	.def	rrot_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	rrot_vec
rrot_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	cmpq	32(%rbp), %rax
	jnb	.L68
	movq	$0, -8(%rbp)
	jmp	.L64
.L67:
	movq	32(%rbp), %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	32(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L65
.L66:
	movq	-16(%rbp), %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	subq	$1, -16(%rbp)
.L65:
	cmpq	$0, -16(%rbp)
	jne	.L66
	movq	16(%rbp), %rax
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L64:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L67
	jmp	.L61
.L68:
	nop
.L61:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	lrot_vec
	.def	lrot_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	lrot_vec
lrot_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	24(%rbp), %rax
	cmpq	32(%rbp), %rax
	jnb	.L76
	movq	$0, -8(%rbp)
	jmp	.L72
.L75:
	movq	16(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L73
.L74:
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -16(%rbp)
.L73:
	movq	32(%rbp), %rax
	subq	$1, %rax
	cmpq	%rax, -16(%rbp)
	jb	.L74
	movq	32(%rbp), %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	-24(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L72:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L75
	jmp	.L69
.L76:
	nop
.L69:
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	slice_vec
	.def	slice_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	slice_vec
slice_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L78
.L79:
	movl	32(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	24(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L78:
	movl	-4(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L79
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	rand_vec
	.def	rand_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	rand_vec
rand_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	$0, %ecx
	call	time
	movl	%eax, %ecx
	call	srand
	movq	$0, -8(%rbp)
	jmp	.L81
.L82:
	call	rand
	cltd
	idivl	40(%rbp)
	movl	%edx, %ecx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	32(%rbp), %edx
	addl	%ecx, %edx
	movl	%edx, (%rax)
	addq	$1, -8(%rbp)
.L81:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L82
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	fill_vec
	.def	fill_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	fill_vec
fill_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movsd	%xmm2, 32(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L84
.L85:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	32(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L84:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L85
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	zero_vec
	.def	zero_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	zero_vec
zero_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L87
.L88:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addq	$1, -8(%rbp)
.L87:
	movq	-8(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L88
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	mean_vec
	.def	mean_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	mean_vec
mean_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L90
.L93:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	24(%rbp), %rax
	testq	%rax, %rax
	js	.L91
	cvtsi2sdq	%rax, %xmm0
	jmp	.L92
.L91:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L92:
	movsd	-8(%rbp), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	movsd	%xmm0, -16(%rbp)
	addq	$1, -24(%rbp)
.L90:
	movq	-24(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L93
	movsd	-16(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	min_vec
	.def	min_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	min_vec
min_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L96
.L99:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movsd	-8(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L97
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
.L97:
	addq	$1, -16(%rbp)
.L96:
	movq	-16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L99
	movsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	max_vec
	.def	max_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	max_vec
max_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	16(%rbp), %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	$1, -16(%rbp)
	jmp	.L103
.L106:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	comisd	-8(%rbp), %xmm0
	jbe	.L104
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
.L104:
	addq	$1, -16(%rbp)
.L103:
	movq	-16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L106
	movsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	sum_vec
	.def	sum_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	sum_vec
sum_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L110
.L111:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addq	$1, -16(%rbp)
.L110:
	movq	-16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L111
	movsd	-8(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	eq_vec
	.def	eq_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	eq_vec
eq_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movsd	%xmm3, 40(%rbp)
	movq	$0, -8(%rbp)
	jmp	.L114
.L118:
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	movq	.LC5(%rip), %xmm1
	andpd	%xmm1, %xmm0
	comisd	40(%rbp), %xmm0
	jb	.L120
	movl	$0, %eax
	jmp	.L117
.L120:
	addq	$1, -8(%rbp)
.L114:
	movq	-8(%rbp), %rax
	cmpq	32(%rbp), %rax
	jb	.L118
	movl	$1, %eax
.L117:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	map_vec
	.def	map_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	map_vec
map_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%r8, -32(%rbp)
	movq	$0, -88(%rbp)
	jmp	.L122
.L123:
	movq	-88(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-88(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-48(%rbp), %rax
	leaq	(%rcx,%rax), %rbx
	movq	-32(%rbp), %rax
	movq	%rdx, %xmm0
	call	*%rax
	movq	%xmm0, %rax
	movq	%rax, (%rbx)
	addq	$1, -88(%rbp)
.L122:
	movq	-88(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L123
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	norm_vec
	.def	norm_vec;	.scl	2;	.type	32;	.endef
	.seh_proc	norm_vec
norm_vec:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	$0, -16(%rbp)
	jmp	.L125
.L126:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addq	$1, -16(%rbp)
.L125:
	movq	-16(%rbp), %rax
	cmpq	24(%rbp), %rax
	jb	.L126
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC5:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	time;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	sqrt;	.scl	2;	.type	32;	.endef

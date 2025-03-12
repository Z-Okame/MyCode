	.file	"terne.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
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
.LFB13:
	.file 1 "terne.c"
	.loc 1 5 1
	.cfi_startproc
	pushq	%rbp
	.seh_pushreg	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	.loc 1 5 1
	call	__main
.LVL0:
	.loc 1 6 12
	movl	$1, -4(%rbp)
	.loc 1 7 9
	movl	$0, -16(%rbp)
	.loc 1 9 5
	leaq	.LC0(%rip), %rcx
	call	printf
	.loc 1 10 5
	leaq	-20(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	scanf
	.loc 1 12 5
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rcx
	call	printf
	.loc 1 15 11
	jmp	.L2
.L8:
	.loc 1 18 11
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
	.loc 1 19 15
	jmp	.L3
.L7:
	.loc 1 22 15
	movl	-8(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 23 19
	jmp	.L4
.L6:
	.loc 1 26 24
	movl	-4(%rbp), %eax
	imull	-4(%rbp), %eax
	movl	%eax, %edx
	.loc 1 26 34
	movl	-8(%rbp), %eax
	imull	-8(%rbp), %eax
	.loc 1 26 29
	addl	%eax, %edx
	.loc 1 26 45
	movl	-12(%rbp), %eax
	imull	-12(%rbp), %eax
	.loc 1 26 20
	cmpl	%eax, %edx
	jne	.L5
	.loc 1 28 21
	movl	-12(%rbp), %ecx
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%ecx, %r9d
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	.loc 1 29 28
	addl	$1, -16(%rbp)
.L5:
	.loc 1 31 18
	addl	$1, -12(%rbp)
.L4:
	.loc 1 23 27
	movl	-8(%rbp), %eax
	addl	%eax, %eax
	.loc 1 23 19
	cmpl	%eax, -12(%rbp)
	jle	.L6
	.loc 1 33 14
	addl	$1, -8(%rbp)
.L3:
	.loc 1 19 23
	movl	-4(%rbp), %eax
	addl	%eax, %eax
	.loc 1 19 15
	cmpl	%eax, -8(%rbp)
	jle	.L7
	.loc 1 35 10
	addl	$1, -4(%rbp)
.L2:
	.loc 1 15 20
	movl	-20(%rbp), %eax
	.loc 1 15 11
	cmpl	%eax, -16(%rbp)
	jl	.L8
	.loc 1 38 12
	movl	$0, %eax
	.loc 1 39 1
	addq	$64, %rsp
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.seh_endproc
.Letext0:
	.section	.debug_info,"dr"
.Ldebug_info0:
	.long	0x16d
	.word	0x4
	.secrel32	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.ascii "GNU C17 8.1.0 -mtune=core2 -march=nocona -g\0"
	.byte	0xc
	.ascii "terne.c\0"
	.ascii "C:\\Users\\pietr\\OneDrive\\Documenti\0"
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.secrel32	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.uleb128 0x3
	.ascii "main\0"
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.long	0xc0
	.quad	.LFB13
	.quad	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x4
	.ascii "N\0"
	.byte	0x1
	.byte	0x6
	.byte	0x9
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x4
	.ascii "a\0"
	.byte	0x1
	.byte	0x6
	.byte	0xc
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x4
	.ascii "b\0"
	.byte	0x1
	.byte	0x6
	.byte	0x13
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.ascii "c\0"
	.byte	0x1
	.byte	0x6
	.byte	0x16
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x4
	.ascii "counter\0"
	.byte	0x1
	.byte	0x7
	.byte	0x9
	.long	0xc0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.byte	0
	.section	.debug_abbrev,"dr"
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"dr"
	.long	0x2c
	.word	0x2
	.secrel32	.Ldebug_info0
	.byte	0x8
	.byte	0
	.word	0
	.word	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"dr"
.Ldebug_line0:
	.section	.debug_str,"dr"
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef

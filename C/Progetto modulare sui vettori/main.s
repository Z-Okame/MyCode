	.file	"main.c"
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\12--- Calcolatrice Vettoriale ---\0"
.LC1:
	.ascii "1. Somma di due vettori\0"
.LC2:
	.ascii "2. Sottrazione di due vettori\0"
	.align 8
.LC3:
	.ascii "3. Aggiunta di uno scalare a un vettore\0"
	.align 8
.LC4:
	.ascii "4. Moltiplicazione di un vettore per uno scalare\0"
	.align 8
.LC5:
	.ascii "5. Prodotto scalare di due vettori\0"
	.align 8
.LC6:
	.ascii "6. Concatenazione di due vettori\0"
.LC7:
	.ascii "7. Inversione di un vettore\0"
.LC8:
	.ascii "8. Ordinamento di un vettore\0"
	.align 8
.LC9:
	.ascii "9. Mescolamento casuale di un vettore\0"
	.align 8
.LC10:
	.ascii "10. Shift a destra di un vettore\0"
	.align 8
.LC11:
	.ascii "11. Shift a sinistra di un vettore\0"
	.align 8
.LC12:
	.ascii "12. Rotazione a destra di un vettore\0"
	.align 8
.LC13:
	.ascii "13. Rotazione a sinistra di un vettore\0"
.LC14:
	.ascii "14. Slice di un vettore\0"
	.align 8
.LC15:
	.ascii "15. Calcolo della norma di un vettore\0"
	.align 8
.LC16:
	.ascii "16. Media degli elementi di un vettore\0"
	.align 8
.LC17:
	.ascii "17. Valore minimo di un vettore\0"
	.align 8
.LC18:
	.ascii "18. Valore massimo di un vettore\0"
	.align 8
.LC19:
	.ascii "19. Somma degli elementi di un vettore\0"
	.align 8
.LC20:
	.ascii "20. Confronto di due vettori con tolleranza\0"
	.align 8
.LC21:
	.ascii "21. Applicazione di una funzione a ogni elemento di un vettore\0"
.LC22:
	.ascii "0. Esci\0"
.LC23:
	.ascii "Seleziona un'opzione: \0"
	.text
	.globl	print_menu
	.def	print_menu;	.scl	2;	.type	32;	.endef
	.seh_proc	print_menu
print_menu:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC0(%rip), %rcx
	call	puts
	leaq	.LC1(%rip), %rcx
	call	puts
	leaq	.LC2(%rip), %rcx
	call	puts
	leaq	.LC3(%rip), %rcx
	call	puts
	leaq	.LC4(%rip), %rcx
	call	puts
	leaq	.LC5(%rip), %rcx
	call	puts
	leaq	.LC6(%rip), %rcx
	call	puts
	leaq	.LC7(%rip), %rcx
	call	puts
	leaq	.LC8(%rip), %rcx
	call	puts
	leaq	.LC9(%rip), %rcx
	call	puts
	leaq	.LC10(%rip), %rcx
	call	puts
	leaq	.LC11(%rip), %rcx
	call	puts
	leaq	.LC12(%rip), %rcx
	call	puts
	leaq	.LC13(%rip), %rcx
	call	puts
	leaq	.LC14(%rip), %rcx
	call	puts
	leaq	.LC15(%rip), %rcx
	call	puts
	leaq	.LC16(%rip), %rcx
	call	puts
	leaq	.LC17(%rip), %rcx
	call	puts
	leaq	.LC18(%rip), %rcx
	call	puts
	leaq	.LC19(%rip), %rcx
	call	puts
	leaq	.LC20(%rip), %rcx
	call	puts
	leaq	.LC21(%rip), %rcx
	call	puts
	leaq	.LC22(%rip), %rcx
	call	puts
	leaq	.LC23(%rip), %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	increment
	.def	increment;	.scl	2;	.type	32;	.endef
	.seh_proc	increment
increment:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm1
	movsd	.LC24(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC25:
	.ascii "%d\0"
	.align 8
.LC26:
	.ascii "Inserisci %lu valori per il primo vettore:\12\0"
	.align 8
.LC27:
	.ascii "Inserisci %lu valori per il secondo vettore:\12\0"
.LC28:
	.ascii "Risultato della somma:\0"
.LC29:
	.ascii "Risultato della sottrazione:\0"
	.align 8
.LC30:
	.ascii "Inserisci %lu valori per il vettore:\12\0"
.LC31:
	.ascii "Inserisci lo scalare: \0"
.LC32:
	.ascii "%lf\0"
	.align 8
.LC33:
	.ascii "Risultato dell'aggiunta dello scalare:\0"
	.align 8
.LC34:
	.ascii "Risultato della moltiplicazione per lo scalare:\0"
.LC35:
	.ascii "Prodotto scalare: %.2f\12\0"
	.align 8
.LC36:
	.ascii "Risultato della concatenazione:\0"
.LC37:
	.ascii "Vettore invertito:\0"
.LC38:
	.ascii "Vettore ordinato:\0"
.LC39:
	.ascii "Vettore mescolato:\0"
	.align 8
.LC40:
	.ascii "Inserisci il numero di passi: \0"
.LC41:
	.ascii "%lu\0"
	.align 8
.LC43:
	.ascii "Vettore dopo lo shift a destra:\0"
	.align 8
.LC44:
	.ascii "Vettore dopo lo shift a sinistra:\0"
	.align 8
.LC45:
	.ascii "Vettore dopo la rotazione a destra:\0"
	.align 8
.LC46:
	.ascii "Vettore dopo la rotazione a sinistra:\0"
	.align 8
.LC47:
	.ascii "Inserisci l'indice di inizio e il numero di elementi: \0"
.LC48:
	.ascii "%d %d\0"
.LC49:
	.ascii "Risultato dello slice:\0"
.LC50:
	.ascii "Norma del vettore: %.2f\12\0"
.LC51:
	.ascii "Media degli elementi: %.2f\12\0"
.LC52:
	.ascii "Valore minimo: %.2f\12\0"
.LC53:
	.ascii "Valore massimo: %.2f\12\0"
.LC54:
	.ascii "Somma degli elementi: %.2f\12\0"
.LC55:
	.ascii "Inserisci la tolleranza: \0"
	.align 8
.LC56:
	.ascii "I vettori sono uguali entro la tolleranza.\0"
	.align 8
.LC57:
	.ascii "I vettori non sono uguali entro la tolleranza.\0"
	.align 8
.LC58:
	.ascii "Vettore dopo l'incremento di uno:\0"
.LC59:
	.ascii "Uscita dalla calcolatrice.\0"
.LC60:
	.ascii "Opzione non valida. Riprova.\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r15
	.seh_pushreg	%r15
	pushq	%r14
	.seh_pushreg	%r14
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$296, %rsp
	.seh_stackalloc	296
	leaq	128(%rsp), %rbp
	.seh_setframe	%rbp, 128
	.seh_endprologue
	call	__main
	movq	%rsp, %rax
	movq	%rax, %rdi
	movq	$5, 112(%rbp)
	movq	112(%rbp), %rdx
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, 120(%rbp)
	movq	%rdx, %rbx
	movl	$0, %esi
	movq	%rdx, %r12
	movl	$0, %r13d
	leaq	0(,%rdx,8), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, 128(%rbp)
	movq	112(%rbp), %rdx
	movq	%rdx, %rax
	subq	$1, %rax
	movq	%rax, 136(%rbp)
	movq	%rdx, %r14
	movl	$0, %r15d
	movq	%rdx, 16(%rbp)
	movq	$0, 24(%rbp)
	leaq	0(,%rdx,8), %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, 144(%rbp)
	movq	112(%rbp), %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 152(%rbp)
	movq	%rax, 0(%rbp)
	movq	$0, 8(%rbp)
	movq	%rax, -16(%rbp)
	movq	$0, -8(%rbp)
	salq	$3, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, 104(%rbp)
.L40:
	call	print_menu
	leaq	52(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC25(%rip), %rcx
	call	scanf
	movl	52(%rbp), %eax
	cmpl	$21, %eax
	ja	.L5
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L7(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L7(%rip), %rdx
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L7:
	.long	.L28-.L7
	.long	.L27-.L7
	.long	.L26-.L7
	.long	.L25-.L7
	.long	.L24-.L7
	.long	.L23-.L7
	.long	.L22-.L7
	.long	.L21-.L7
	.long	.L20-.L7
	.long	.L19-.L7
	.long	.L18-.L7
	.long	.L17-.L7
	.long	.L16-.L7
	.long	.L15-.L7
	.long	.L14-.L7
	.long	.L13-.L7
	.long	.L12-.L7
	.long	.L11-.L7
	.long	.L10-.L7
	.long	.L9-.L7
	.long	.L8-.L7
	.long	.L6-.L7
	.text
.L27:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC26(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC27(%rip), %rcx
	call	printf
	movq	144(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	104(%rbp), %rcx
	movq	144(%rbp), %rdx
	movq	128(%rbp), %rax
	movq	112(%rbp), %r8
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	add_vec
	leaq	.LC28(%rip), %rcx
	call	puts
	movq	104(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L26:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC26(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC27(%rip), %rcx
	call	printf
	movq	144(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	104(%rbp), %rcx
	movq	144(%rbp), %rdx
	movq	128(%rbp), %rax
	movq	112(%rbp), %r8
	movq	%r8, %r9
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	sub_vec
	leaq	.LC29(%rip), %rcx
	call	puts
	movq	104(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L25:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC31(%rip), %rcx
	call	printf
	leaq	64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC32(%rip), %rcx
	call	scanf
	movq	104(%rbp), %rdx
	movsd	64(%rbp), %xmm0
	movq	128(%rbp), %rax
	movq	112(%rbp), %rcx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	adds_vec
	leaq	.LC33(%rip), %rcx
	call	puts
	movq	104(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L24:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC31(%rip), %rcx
	call	printf
	leaq	64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC32(%rip), %rcx
	call	scanf
	movq	104(%rbp), %rdx
	movsd	64(%rbp), %xmm0
	movq	128(%rbp), %rax
	movq	112(%rbp), %rcx
	movq	%rcx, %r9
	movq	%rdx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rcx
	call	muls_vec
	leaq	.LC34(%rip), %rcx
	call	puts
	movq	104(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L23:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC26(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC27(%rip), %rcx
	call	printf
	movq	144(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	144(%rbp), %rdx
	movq	128(%rbp), %rax
	movq	112(%rbp), %rcx
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	dot_vec
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC35(%rip), %rcx
	call	printf
	jmp	.L29
.L22:
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC26(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC27(%rip), %rcx
	call	printf
	movq	144(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	112(%rbp), %rax
	addq	%rax, %rax
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, 96(%rbp)
	movq	%rax, -32(%rbp)
	movq	$0, -24(%rbp)
	movq	%rax, -48(%rbp)
	movq	$0, -40(%rbp)
	salq	$3, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, 88(%rbp)
	movq	88(%rbp), %rcx
	movq	144(%rbp), %r8
	movq	128(%rbp), %rax
	movq	112(%rbp), %r9
	movq	112(%rbp), %rdx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	concat_vec
	leaq	.LC36(%rip), %rcx
	call	puts
	movq	112(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	88(%rbp), %rax
	movq	%rax, %rcx
	call	print_vec
	nop
	movq	%rbx, %rsp
	jmp	.L29
.L21:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	reverse_vec
	leaq	.LC37(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L20:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	sort_vec
	leaq	.LC38(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L19:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	shuffle_vec
	leaq	.LC39(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L18:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC40(%rip), %rcx
	call	printf
	leaq	64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rcx
	call	scanf
	movsd	64(%rbp), %xmm0
	comisd	.LC42(%rip), %xmm0
	jnb	.L30
	cvttsd2siq	%xmm0, %rax
	jmp	.L31
.L30:
	movsd	.LC42(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L31:
	movq	128(%rbp), %rcx
	movq	112(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	rshft_vec
	leaq	.LC43(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L17:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC40(%rip), %rcx
	call	printf
	leaq	64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rcx
	call	scanf
	movsd	64(%rbp), %xmm0
	comisd	.LC42(%rip), %xmm0
	jnb	.L32
	cvttsd2siq	%xmm0, %rax
	jmp	.L33
.L32:
	movsd	.LC42(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L33:
	movq	128(%rbp), %rcx
	movq	112(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	lshft_vec
	leaq	.LC44(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L16:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC40(%rip), %rcx
	call	printf
	leaq	64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rcx
	call	scanf
	movsd	64(%rbp), %xmm0
	comisd	.LC42(%rip), %xmm0
	jnb	.L34
	cvttsd2siq	%xmm0, %rax
	jmp	.L35
.L34:
	movsd	.LC42(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L35:
	movq	128(%rbp), %rcx
	movq	112(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	rrot_vec
	leaq	.LC45(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L15:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC40(%rip), %rcx
	call	printf
	leaq	64(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC41(%rip), %rcx
	call	scanf
	movsd	64(%rbp), %xmm0
	comisd	.LC42(%rip), %xmm0
	jnb	.L36
	cvttsd2siq	%xmm0, %rax
	jmp	.L37
.L36:
	movsd	.LC42(%rip), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2siq	%xmm0, %rax
	movabsq	$-9223372036854775808, %rdx
	xorq	%rdx, %rax
.L37:
	movq	128(%rbp), %rcx
	movq	112(%rbp), %rdx
	movq	%rdx, %r8
	movq	%rax, %rdx
	call	lrot_vec
	leaq	.LC46(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L14:
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC47(%rip), %rcx
	call	printf
	leaq	44(%rbp), %rdx
	leaq	48(%rbp), %rax
	movq	%rdx, %r8
	movq	%rax, %rdx
	leaq	.LC48(%rip), %rcx
	call	scanf
	movl	44(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, 80(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -64(%rbp)
	movq	$0, -56(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -80(%rbp)
	movq	$0, -72(%rbp)
	cltq
	salq	$3, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	48(%rsp), %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, 72(%rbp)
	movl	44(%rbp), %r8d
	movl	48(%rbp), %ecx
	movq	72(%rbp), %rdx
	movq	128(%rbp), %rax
	movl	%r8d, %r9d
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	slice_vec
	leaq	.LC49(%rip), %rcx
	call	puts
	movl	44(%rbp), %eax
	cltq
	movq	72(%rbp), %rcx
	movq	%rax, %rdx
	call	print_vec
	nop
	movq	%rbx, %rsp
	jmp	.L29
.L13:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	norm_vec
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC50(%rip), %rcx
	call	printf
	jmp	.L29
.L12:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	mean_vec
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC51(%rip), %rcx
	call	printf
	jmp	.L29
.L11:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	min_vec
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC52(%rip), %rcx
	call	printf
	jmp	.L29
.L10:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	max_vec
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC53(%rip), %rcx
	call	printf
	jmp	.L29
.L9:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	sum_vec
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	leaq	.LC54(%rip), %rcx
	call	printf
	jmp	.L29
.L8:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC26(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC27(%rip), %rcx
	call	printf
	movq	144(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	leaq	.LC55(%rip), %rcx
	call	printf
	leaq	56(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC32(%rip), %rcx
	call	scanf
	movsd	56(%rbp), %xmm0
	movq	144(%rbp), %rdx
	movq	128(%rbp), %rax
	movq	112(%rbp), %rcx
	movapd	%xmm0, %xmm3
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	eq_vec
	testb	%al, %al
	je	.L38
	leaq	.LC56(%rip), %rcx
	call	puts
	jmp	.L29
.L38:
	leaq	.LC57(%rip), %rcx
	call	puts
	jmp	.L29
.L6:
	movq	112(%rbp), %rax
	movl	%eax, %edx
	leaq	.LC30(%rip), %rcx
	call	printf
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	scanf_vec
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	leaq	increment(%rip), %r8
	movq	%rax, %rcx
	call	map_vec
	leaq	.LC58(%rip), %rcx
	call	puts
	movq	128(%rbp), %rax
	movq	112(%rbp), %rdx
	movq	%rax, %rcx
	call	print_vec
	jmp	.L29
.L28:
	leaq	.LC59(%rip), %rcx
	call	puts
	jmp	.L29
.L5:
	leaq	.LC60(%rip), %rcx
	call	puts
.L29:
	movl	52(%rbp), %eax
	testl	%eax, %eax
	jne	.L40
	movl	$0, %eax
	movq	%rdi, %rsp
	leaq	168(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC24:
	.long	0
	.long	1072693248
	.align 8
.LC42:
	.long	0
	.long	1138753536
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	scanf;	.scl	2;	.type	32;	.endef
	.def	scanf_vec;	.scl	2;	.type	32;	.endef
	.def	add_vec;	.scl	2;	.type	32;	.endef
	.def	print_vec;	.scl	2;	.type	32;	.endef
	.def	sub_vec;	.scl	2;	.type	32;	.endef
	.def	adds_vec;	.scl	2;	.type	32;	.endef
	.def	muls_vec;	.scl	2;	.type	32;	.endef
	.def	dot_vec;	.scl	2;	.type	32;	.endef
	.def	concat_vec;	.scl	2;	.type	32;	.endef
	.def	reverse_vec;	.scl	2;	.type	32;	.endef
	.def	sort_vec;	.scl	2;	.type	32;	.endef
	.def	shuffle_vec;	.scl	2;	.type	32;	.endef
	.def	rshft_vec;	.scl	2;	.type	32;	.endef
	.def	lshft_vec;	.scl	2;	.type	32;	.endef
	.def	rrot_vec;	.scl	2;	.type	32;	.endef
	.def	lrot_vec;	.scl	2;	.type	32;	.endef
	.def	slice_vec;	.scl	2;	.type	32;	.endef
	.def	norm_vec;	.scl	2;	.type	32;	.endef
	.def	mean_vec;	.scl	2;	.type	32;	.endef
	.def	min_vec;	.scl	2;	.type	32;	.endef
	.def	max_vec;	.scl	2;	.type	32;	.endef
	.def	sum_vec;	.scl	2;	.type	32;	.endef
	.def	eq_vec;	.scl	2;	.type	32;	.endef
	.def	map_vec;	.scl	2;	.type	32;	.endef

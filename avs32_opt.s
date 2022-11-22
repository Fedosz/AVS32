	.file	"avs32.c"
	.intel_syntax noprefix
	.text
	.globl	f
	.type	f, @function
f:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	xmm1, QWORD PTR .LC1[rip]
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR .LC0[rip]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	mov	rax, QWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rax
	call	pow@PLT
	addsd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	subsd	xmm0, xmm1
	movq	rax, xmm0
	movq	xmm0, rax
	leave
	ret
	.size	f, .-f
	.section	.rodata
	.align 8
.LC5:
	.string	"Incorrect precision, restart program"
.LC6:
	.string	"%s"
.LC8:
	.string	"%.8lf"
.LC9:
	.string	"Amount of iterations: "
.LC10:
	.string	"%d"
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	push	r13
	sub	rsp, 72
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	mov	rax, QWORD PTR -64[rbp]			#double e
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	mov	eax, 0
	call	atof@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	QWORD PTR -24[rbp], xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	comisd	xmm0, QWORD PTR .LC3[rip]
	ja	.L4
	movsd	xmm0, QWORD PTR .LC4[rip]
	comisd	xmm0, QWORD PTR -24[rbp]
	jbe	.L15
.L4:
	lea	rax, .LC5[rip]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L7
.L15:
	pxor	xmm0, xmm0			
	movsd	QWORD PTR -48[rbp], xmm0		#double left = 0
	movsd	xmm0, QWORD PTR .LC1[rip]		#double right = 1
	movsd	QWORD PTR -40[rbp], xmm0		
	movsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]		#double mid = (left + right) / 2
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	mov	r13d, 0					#register int i = 0;
.L12:
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	call	f
	movsd	QWORD PTR -72[rbp], xmm0
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -72[rbp]
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L16
	movsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -40[rbp], xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
	jmp	.L10
.L16:
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	call	f
	movsd	QWORD PTR -72[rbp], xmm0
	mov	rax, QWORD PTR -40[rbp]
	movq	xmm0, rax
	call	f
	movsd	xmm1, QWORD PTR -72[rbp]
	mulsd	xmm1, xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, xmm1
	jbe	.L10
	movsd	xmm0, QWORD PTR -32[rbp]
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
.L10:
	mov	eax, r13d
	add	eax, 1
	mov	r13d, eax
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -48[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
	comisd	xmm0, QWORD PTR -24[rbp]
	ja	.L12
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rax
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	edi, 10
	call	putchar@PLT
	lea	rax, .LC9[rip]
	mov	rsi, rax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, r13d
	mov	esi, eax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L7:
	mov	r13, QWORD PTR -8[rbp]
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 8
.LC3:
	.long	-755914244
	.long	1062232653
	.align 8
.LC4:
	.long	-500134854
	.long	1044740494
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits

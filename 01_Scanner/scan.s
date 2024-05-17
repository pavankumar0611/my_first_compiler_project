	.file	"scan.c"
	.text
	.type	chrpos, @function
chrpos:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L2
	movq	-8(%rbp), %rax
	subq	-24(%rbp), %rax
	jmp	.L4
.L2:
	movl	$-1, %eax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	chrpos, .-chrpos
	.type	next, @function
next:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	Putback(%rip), %eax
	testl	%eax, %eax
	je	.L6
	movl	Putback(%rip), %eax
	movl	%eax, -4(%rbp)
	movl	$0, Putback(%rip)
	movl	-4(%rbp), %eax
	jmp	.L5
.L6:
	movq	Infile(%rip), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movl	%eax, -4(%rbp)
	cmpl	$10, -4(%rbp)
	jne	.L8
	movl	Line(%rip), %eax
	addl	$1, %eax
	movl	%eax, Line(%rip)
	movl	-4(%rbp), %eax
	jmp	.L5
.L8:
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	next, .-next
	.type	putback, @function
putback:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, Putback(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	putback, .-putback
	.type	skip, @function
skip:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	next
	movl	%eax, -4(%rbp)
	jmp	.L11
.L12:
	call	next
	movl	%eax, -4(%rbp)
.L11:
	cmpl	$32, -4(%rbp)
	je	.L12
	cmpl	$9, -4(%rbp)
	je	.L12
	cmpl	$10, -4(%rbp)
	je	.L12
	cmpl	$12, -4(%rbp)
	je	.L12
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	skip, .-skip
	.section	.rodata
.LC0:
	.string	"0123456789"
	.text
	.type	scanint, @function
scanint:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L15
.L16:
	movl	-8(%rbp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
	call	next
	movl	%eax, -20(%rbp)
.L15:
	movl	-20(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	chrpos
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L16
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	putback
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	scanint, .-scanint
	.section	.rodata
	.align 8
.LC1:
	.string	"unregonised character %c on line %d\n"
	.text
	.globl	scan
	.type	scan, @function
scan:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	skip
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	je	.L19
	cmpl	$-1, -4(%rbp)
	jl	.L20
	cmpl	$61, -4(%rbp)
	jg	.L20
	cmpl	$36, -4(%rbp)
	jl	.L20
	movl	-4(%rbp), %eax
	subl	$36, %eax
	cmpl	$25, %eax
	ja	.L20
	movl	%eax, %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L22(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L22(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L22:
	.long	.L27-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L26-.L22
	.long	.L25-.L22
	.long	.L20-.L22
	.long	.L24-.L22
	.long	.L20-.L22
	.long	.L23-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L20-.L22
	.long	.L21-.L22
	.text
.L19:
	movl	$0, %eax
	jmp	.L28
.L25:
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	jmp	.L29
.L24:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	jmp	.L29
.L26:
	movq	-24(%rbp), %rax
	movl	$2, (%rax)
	jmp	.L29
.L23:
	movq	-24(%rbp), %rax
	movl	$3, (%rax)
	jmp	.L29
.L21:
	movq	-24(%rbp), %rax
	movl	$5, (%rax)
	jmp	.L29
.L27:
	movq	-24(%rbp), %rax
	movl	$6, (%rax)
	jmp	.L29
.L20:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	je	.L30
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	scanint
	movq	-24(%rbp), %rdx
	movl	%eax, 4(%rdx)
	movq	-24(%rbp), %rax
	movl	$4, (%rax)
	jmp	.L29
.L30:
	movl	Line(%rip), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
.L29:
	movl	$1, %eax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	scan, .-scan
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

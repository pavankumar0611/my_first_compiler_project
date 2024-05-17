	.file	"main.c"
	.text
	.globl	Line
	.bss
	.align 4
	.type	Line, @object
	.size	Line, 4
Line:
	.zero	4
	.globl	Putback
	.align 4
	.type	Putback, @object
	.size	Putback, 4
Putback:
	.zero	4
	.globl	Infile
	.align 8
	.type	Infile, @object
	.size	Infile, 8
Infile:
	.zero	8
	.text
	.type	init, @function
init:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$1, Line(%rip)
	movl	$10, Putback(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	init, .-init
	.section	.rodata
.LC0:
	.string	"usage : %s infile \n"
	.text
	.type	usage, @function
usage:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE7:
	.size	usage, .-usage
	.globl	tokstr
	.section	.rodata
.LC1:
	.string	"+"
.LC2:
	.string	"-"
.LC3:
	.string	"*"
.LC4:
	.string	"/"
.LC5:
	.string	"intlit"
.LC6:
	.string	"="
.LC7:
	.string	"$"
	.section	.data.rel.local,"aw"
	.align 32
	.type	tokstr, @object
	.size	tokstr, 56
tokstr:
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.section	.rodata
.LC8:
	.string	"Token %s"
.LC9:
	.string	", value %d"
	.text
	.globl	scanfile
	.type	scanfile, @function
scanfile:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	jmp	.L4
.L6:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	tokstr(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-16(%rbp), %eax
	cmpl	$4, %eax
	jne	.L5
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L5:
	movl	$10, %edi
	call	putchar@PLT
.L4:
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	scan@PLT
	testl	%eax, %eax
	jne	.L6
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	scanfile, .-scanfile
	.section	.rodata
.LC10:
	.string	"r"
.LC11:
	.string	"unable to open %s: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$2, -4(%rbp)
	je	.L9
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	usage
.L9:
	movl	$0, %eax
	call	init
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC10(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, Infile(%rip)
	movq	Infile(%rip), %rax
	testq	%rax, %rax
	jne	.L10
	call	__errno_location@PLT
	movl	(%rax), %eax
	movl	%eax, %edi
	call	strerror@PLT
	movq	%rax, %rcx
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	stderr(%rip), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L10:
	movl	$0, %eax
	call	scanfile
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE9:
	.size	main, .-main
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

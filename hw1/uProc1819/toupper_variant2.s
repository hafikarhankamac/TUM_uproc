	.file	"toupper.c"
	.text
	.type	toupper_simple, @function
toupper_simple:
.LFB61:
	.cfi_startproc
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L1
.L5:
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L3
	subl	$32, %eax
	movb	%al, (%rdi)
.L3:
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L5
.L1:
	rep ret
	.cfi_endproc
.LFE61:
	.size	toupper_simple, .-toupper_simple
	.type	toupper_optimised, @function
toupper_optimised:
.LFB62:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE62:
	.size	toupper_optimised, .-toupper_optimised
	.globl	mymalloc
	.type	mymalloc, @function
mymalloc:
.LFB63:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	addq	$32, %rdi
	call	malloc
	andq	$-16, %rax
	leaq	16(%rax), %rax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE63:
	.size	mymalloc, .-mymalloc
	.globl	createChar
	.type	createChar, @function
createChar:
.LFB64:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	movsbl	%cl, %ecx
	cmpl	%ebx, %ecx
	setge	%bl
	call	rand
	movl	%eax, %ecx
	movl	$1321528399, %edx
	imull	%edx
	sarl	$3, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	imull	$26, %edx, %edx
	subl	%edx, %ecx
	movzbl	%bl, %ebx
	leal	2(%rbx), %eax
	movl	%eax, %ebx
	sall	$5, %ebx
	leal	1(%rbx,%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	createChar, .-createChar
	.globl	init
	.type	init, @function
init:
.LFB65:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %r13
	movl	%esi, %r14d
	leaq	1(%rdi), %rdi
	call	mymalloc
	movq	%rax, %r12
	movl	$1, %edi
	call	srand
	testq	%r13, %r13
	je	.L15
	movl	$0, %ebx
	movl	$0, %ebp
.L14:
	movl	%r14d, %edi
	call	createChar
	movb	%al, (%r12,%rbx)
	addl	$1, %ebp
	movslq	%ebp, %rbx
	cmpq	%rbx, %r13
	ja	.L14
	jmp	.L13
.L15:
	movl	$0, %ebx
.L13:
	movb	$0, (%r12,%rbx)
	movq	%r12, %rax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE65:
	.size	init, .-init
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Before: %.40s...\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"ERROR: Bad call to gettimeofday"
	.section	.rodata.str1.1
.LC4:
	.string	"After:  %.40s...\n"
	.text
	.globl	run_toupper
	.type	run_toupper, @function
run_toupper:
.LFB66:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	movq	%rcx, %rbp
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	no_ratio(%rip), %eax
	movl	%eax, %ecx
	imull	%edi, %ecx
	addl	%esi, %ecx
	imull	no_sz(%rip), %edx
	imull	%edx, %eax
	leal	(%rax,%rcx), %ebx
	movslq	%esi, %rsi
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi,8), %esi
	movslq	%edi, %rdi
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi,8), %rdi
	call	init
	movq	%rax, %r12
	cmpl	$0, debug(%rip)
	je	.L19
	movq	%rax, %rdx
	movl	$.LC1, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L19:
	leaq	16(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	jne	.L20
	movl	$.LC2, %edi
	call	puts
	vmovsd	.LC0(%rip), %xmm4
	vmovsd	%xmm4, 8(%rsp)
	jmp	.L21
.L20:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vmulsd	.LC3(%rip), %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm3
	vmovsd	%xmm3, 8(%rsp)
.L21:
	movq	%r12, %rdi
	call	*%rbp
	leaq	16(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	jne	.L22
	movl	$.LC2, %edi
	call	puts
	vmovsd	.LC0(%rip), %xmm0
	jmp	.L23
.L22:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vmulsd	.LC3(%rip), %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L23:
	movslq	%ebx, %rbx
	vsubsd	8(%rsp), %xmm0, %xmm0
	movq	results(%rip), %rax
	vmovsd	%xmm0, (%rax,%rbx,8)
	cmpl	$0, debug(%rip)
	je	.L18
	movq	%r12, %rdx
	movl	$.LC4, %esi
	movl	$1, %edi
	movl	$0, %eax
	call	__printf_chk
.L18:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	je	.L25
	call	__stack_chk_fail
.L25:
	addq	$64, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE66:
	.size	run_toupper, .-run_toupper
	.globl	run
	.type	run, @function
run:
.LFB67:
	.cfi_startproc
	movq	toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	.L33
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	%esi, %r13d
	movl	%edi, %r12d
	movl	$toupperversion, %ebx
	movl	$0, %ebp
.L29:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	movl	%r13d, %esi
	movl	%r12d, %edi
	call	run_toupper
	addl	$1, %ebp
	addq	$16, %rbx
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L29
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.L33:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"VARIANT2: gcc -lm -march=native toupper.c -O1"
	.align 8
.LC6:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
	.section	.rodata.str1.1
.LC7:
	.string	"\t%s: %f"
	.text
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB68:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$.LC5, %edi
	call	puts
	movl	$0, %r13d
	cmpl	$0, no_sz(%rip)
	jg	.L44
	jmp	.L34
.L39:
	movslq	%r12d, %rax
	movq	ratios(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r14), %rdx
	movl	$.LC6, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	cmpl	$0, no_version(%rip)
	jle	.L37
	movl	$toupperversion, %ebp
	movl	$0, %ebx
.L38:
	movl	no_ratio(%rip), %eax
	movl	%eax, %edx
	imull	%r13d, %edx
	addl	%r12d, %edx
	movl	%ebx, %ecx
	imull	no_sz(%rip), %ecx
	imull	%ecx, %eax
	addl	%edx, %eax
	cltq
	movq	results(%rip), %rdx
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	0(%rbp), %rdx
	movl	$.LC7, %esi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk
	addl	$1, %ebx
	addq	$16, %rbp
	cmpl	%ebx, no_version(%rip)
	jg	.L38
.L37:
	movl	$10, %edi
	call	putchar
	addl	$1, %r12d
	cmpl	%r12d, no_ratio(%rip)
	jg	.L39
.L40:
	addl	$1, %r13d
	cmpl	%r13d, no_sz(%rip)
	jle	.L34
.L44:
	cmpl	$0, no_ratio(%rip)
	jle	.L40
	movslq	%r13d, %r14
	salq	$3, %r14
	movl	$0, %r12d
	jmp	.L39
.L34:
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE68:
	.size	printresults, .-printresults
	.globl	main
	.type	main, @function
main:
.LFB69:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, 8(%rsp)
	cmpl	$1, %edi
	jle	.L47
	leaq	8(%rsi), %rbp
	leal	2(%rdi), %r15d
	movl	$3, %r12d
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movq	$0, 24(%rsp)
	movl	$800000, %r13d
.L57:
	movq	%rbp, %rbx
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L51
	cmpb	$100, 1(%rax)
	jne	.L49
	cmpb	$0, 2(%rax)
	jne	.L51
	movl	$1, debug(%rip)
	movq	0(%rbp), %rax
	cmpb	$45, (%rax)
	jne	.L50
.L75:
	cmpb	$108, 1(%rax)
	jne	.L51
	cmpb	$0, 2(%rax)
	jne	.L51
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r13
	cmpl	%r12d, 8(%rsp)
	jle	.L52
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L53
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	jne	.L54
	cmpb	$0, 2(%rdi)
	jne	.L53
	jmp	.L52
.L54:
	cmpb	$100, %al
	jne	.L53
	cmpb	$0, 2(%rdi)
	je	.L52
.L53:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	cltq
	movq	%rax, 24(%rsp)
	movq	24(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %r14
.L51:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L50
	cmpb	$114, 1(%rax)
	jne	.L50
	cmpb	$0, 2(%rax)
	jne	.L50
	movq	8(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 12(%rsp)
	cmpl	%r12d, 8(%rsp)
	jle	.L52
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L55
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	jne	.L56
	cmpb	$0, 2(%rdi)
	jne	.L55
	jmp	.L52
.L56:
	cmpb	$100, %al
	jne	.L55
	cmpb	$0, 2(%rdi)
	je	.L52
.L55:
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 16(%rsp)
	movq	24(%rbx), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movl	%eax, 20(%rsp)
.L50:
	addq	$8, %rbp
	addl	$1, %r12d
	cmpl	%r15d, %r12d
	jne	.L57
.L52:
	movl	$0, %ecx
	cmpq	$0, toupperversion+8(%rip)
	jne	.L72
	jmp	.L58
.L80:
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movq	$0, 24(%rsp)
	movl	$800000, %r13d
.L72:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%ecx, %ecx
	addl	$2, %ecx
	movl	%ecx, no_version(%rip)
.L58:
	cmpq	$0, 24(%rsp)
	jne	.L60
.L73:
	movl	$1, no_sz(%rip)
	jmp	.L61
.L60:
	movq	24(%rsp), %rax
	subq	%r13, %rax
	movl	$0, %edx
	divq	%r14
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
.L61:
	cmpl	$0, 16(%rsp)
	jne	.L62
	movl	$1, no_ratio(%rip)
	jmp	.L63
.L62:
	movl	16(%rsp), %eax
	subl	12(%rsp), %eax
	cltd
	idivl	20(%rsp)
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
.L63:
	movl	no_sz(%rip), %ebx
	movl	no_ratio(%rip), %ebp
	imull	%ebx, %ecx
	imull	%ebp, %ecx
	movslq	%ecx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, results(%rip)
	movslq	%ebp, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, ratios(%rip)
	movslq	%ebx, %rdi
	salq	$3, %rdi
	call	malloc
	movq	%rax, sizes(%rip)
	testl	%ebx, %ebx
	jle	.L64
	movl	$0, %eax
.L65:
	movslq	%eax, %rcx
	movq	%rcx, %rdx
	imulq	%r14, %rdx
	addq	%r13, %rdx
	movq	sizes(%rip), %rsi
	movq	%rdx, (%rsi,%rcx,8)
	addl	$1, %eax
	cmpl	%eax, no_sz(%rip)
	jg	.L65
	cmpl	$0, no_ratio(%rip)
	jle	.L66
.L74:
	movl	20(%rsp), %edi
	movl	12(%rsp), %eax
	movl	$0, %edx
.L67:
	movslq	%edx, %rsi
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	movq	ratios(%rip), %rcx
	vmovsd	%xmm0, (%rcx,%rsi,8)
	addl	$1, %edx
	addl	%edi, %eax
	cmpl	%edx, no_ratio(%rip)
	jg	.L67
.L66:
	movl	$0, %ebp
	cmpl	$0, no_sz(%rip)
	jg	.L86
	jmp	.L69
.L81:
	movl	%ebx, %esi
	movl	%ebp, %edi
	call	run
	addl	$1, %ebx
	cmpl	%ebx, no_ratio(%rip)
	jg	.L81
.L71:
	addl	$1, %ebp
	cmpl	%ebp, no_sz(%rip)
	jle	.L69
.L86:
	movl	$0, %ebx
	cmpl	$0, no_ratio(%rip)
	jg	.L81
	jmp	.L71
.L47:
	cmpq	$0, toupperversion+8(%rip)
	jne	.L80
	movl	$0, %ecx
	movl	$1, 20(%rsp)
	movl	$0, 16(%rsp)
	movl	$50, 12(%rsp)
	movl	$10000, %r14d
	movl	$800000, %r13d
	jmp	.L73
.L64:
	testl	%ebp, %ebp
	jg	.L74
	jmp	.L69
.L49:
	movq	0(%rbp), %rax
	jmp	.L75
.L69:
	movl	$0, %eax
	call	printresults
	movl	$0, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE69:
	.size	main, .-main
	.globl	toupperversion
	.section	.rodata.str1.1
.LC8:
	.string	"simple"
.LC9:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC8
	.quad	toupper_simple
	.quad	.LC9
	.quad	toupper_optimised
	.quad	0
	.quad	0
	.globl	no_version
	.align 4
	.type	no_version, @object
	.size	no_version, 4
no_version:
	.long	1
	.globl	no_ratio
	.align 4
	.type	no_ratio, @object
	.size	no_ratio, 4
no_ratio:
	.long	1
	.globl	no_sz
	.align 4
	.type	no_sz, @object
	.size	no_sz, 4
no_sz:
	.long	1
	.comm	sizes,8,8
	.comm	ratios,8,8
	.comm	results,8,8
	.globl	debug
	.bss
	.align 4
	.type	debug, @object
	.size	debug, 4
debug:
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	-1074790400
	.align 8
.LC3:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

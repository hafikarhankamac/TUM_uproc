	.file	"toupper.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.type	toupper_simple, @function
toupper_simple:
.LFB61:
	.cfi_startproc
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L6:
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L3
	subl	$32, %eax
	movb	%al, (%rdi)
.L3:
	addq	$1, %rdi
.L9:
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L6
	rep ret
	.cfi_endproc
.LFE61:
	.size	toupper_simple, .-toupper_simple
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.type	toupper_optimised, @function
toupper_optimised:
.LFB62:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE62:
	.size	toupper_optimised, .-toupper_optimised
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
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
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	addq	$16, %rax
	ret
	.cfi_endproc
.LFE63:
	.size	mymalloc, .-mymalloc
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
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
	movl	$1374389535, %edx
	movl	%eax, %ecx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %edx
	subl	%edx, %ecx
	cmpl	%ebx, %ecx
	setge	%bl
	call	rand
	movl	$1321528399, %edx
	movl	%eax, %ecx
	movzbl	%bl, %ebx
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$3, %edx
	subl	%eax, %edx
	leal	2(%rbx), %eax
	imull	$26, %edx, %edx
	movl	%eax, %ebx
	sall	$5, %ebx
	subl	%edx, %ecx
	leal	1(%rbx,%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE64:
	.size	createChar, .-createChar
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB4:
	.text
.LHOTB4:
	.p2align 4,,15
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
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	addq	$33, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%esi, %ebp
	call	malloc
	movl	$1, %edi
	andq	$-16, %rax
	leaq	16(%rax), %r14
	call	srand
	testq	%r13, %r13
	je	.L19
	leaq	0(%r13,%r14), %r12
	movq	%r14, %rbx
	.p2align 4,,10
	.p2align 3
.L18:
	movl	%ebp, %edi
	addq	$1, %rbx
	call	createChar
	movb	%al, -1(%rbx)
	cmpq	%rbx, %r12
	jne	.L18
.L17:
	movb	$0, (%r14,%r13)
	movq	%r14, %rax
	popq	%rbx
	.cfi_remember_state
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
.L19:
	.cfi_restore_state
	xorl	%r13d, %r13d
	jmp	.L17
	.cfi_endproc
.LFE65:
	.size	init, .-init
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"Before: %.40s...\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"ERROR: Bad call to gettimeofday"
	.section	.rodata.str1.1
.LC9:
	.string	"After:  %.40s...\n"
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
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
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$64, %rsp
	.cfi_def_cfa_offset 96
	imull	no_sz(%rip), %edx
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	no_ratio(%rip), %eax
	movl	%eax, %ecx
	imull	%edi, %ecx
	movslq	%edi, %rdi
	imull	%edx, %eax
	addl	%esi, %ecx
	movslq	%esi, %rsi
	leal	(%rax,%rcx), %ebx
	movq	ratios(%rip), %rax
	vcvttsd2si	(%rax,%rsi,8), %esi
	movq	sizes(%rip), %rax
	movq	(%rax,%rdi,8), %rdi
	call	init
	movl	debug(%rip), %edx
	movq	%rax, %r12
	testl	%edx, %edx
	jne	.L32
.L23:
	leaq	16(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	je	.L33
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vmulsd	.LC8(%rip), %xmm0, %xmm0
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm3
	vmovsd	%xmm3, 8(%rsp)
.L25:
	movq	%r12, %rdi
	call	*%rbp
	leaq	16(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	gettimeofday
	cmpl	$-1, %eax
	je	.L34
	vxorpd	%xmm0, %xmm0, %xmm0
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sdq	40(%rsp), %xmm0, %xmm0
	vmulsd	.LC8(%rip), %xmm0, %xmm0
	vcvtsi2sdq	32(%rsp), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
.L27:
	vsubsd	8(%rsp), %xmm0, %xmm0
	movq	results(%rip), %rax
	movslq	%ebx, %rbx
	vmovsd	%xmm0, (%rax,%rbx,8)
	movl	debug(%rip), %eax
	testl	%eax, %eax
	je	.L22
	movq	%r12, %rdx
	movl	$.LC9, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
.L22:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L35
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	movq	%rax, %rdx
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L34:
	movl	$.LC7, %edi
	call	puts
	vmovsd	.LC5(%rip), %xmm0
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L33:
	movl	$.LC7, %edi
	call	puts
	vmovsd	.LC5(%rip), %xmm4
	vmovsd	%xmm4, 8(%rsp)
	jmp	.L25
.L35:
	call	__stack_chk_fail
	.cfi_endproc
.LFE66:
	.size	run_toupper, .-run_toupper
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	run
	.type	run, @function
run:
.LFB67:
	.cfi_startproc
	movq	toupperversion+8(%rip), %rcx
	testq	%rcx, %rcx
	je	.L45
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%esi, %r12d
	movl	$toupperversion, %ebx
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
.L40:
	movq	(%rbx), %r8
	movl	%ebp, %edx
	addq	$16, %rbx
	movl	%r12d, %esi
	movl	%r13d, %edi
	addl	$1, %ebp
	call	run_toupper
	movq	8(%rbx), %rcx
	testq	%rcx, %rcx
	jne	.L40
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
.L45:
	rep ret
	.cfi_endproc
.LFE67:
	.size	run, .-run
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"VARIANT3: gcc -lm -march=native toupper.c -O2"
	.align 8
.LC13:
	.string	"Size: %ld \tRatio: %f \tRunning time:"
	.section	.rodata.str1.1
.LC14:
	.string	"\t%s: %f"
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	printresults
	.type	printresults, @function
printresults:
.LFB68:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$.LC12, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r13d, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	puts
	movl	no_sz(%rip), %ecx
	testl	%ecx, %ecx
	jle	.L62
	.p2align 4,,10
	.p2align 3
.L56:
	movl	no_ratio(%rip), %eax
	xorl	%r12d, %r12d
	xorl	%ebx, %ebx
	testl	%eax, %eax
	jle	.L51
	.p2align 4,,10
	.p2align 3
.L57:
	movq	ratios(%rip), %rax
	movl	$.LC13, %esi
	movl	$1, %edi
	xorl	%r14d, %r14d
	movl	$toupperversion, %r15d
	vmovsd	(%rax,%r12), %xmm0
	movq	sizes(%rip), %rax
	movq	(%rax,%r13), %rdx
	movl	$1, %eax
	call	__printf_chk
	movl	no_version(%rip), %edx
	testl	%edx, %edx
	jle	.L53
.L58:
	movl	no_sz(%rip), %ecx
	movl	no_ratio(%rip), %eax
	movl	$.LC14, %esi
	movl	$1, %edi
	addq	$16, %r15
	imull	%r14d, %ecx
	movl	%eax, %edx
	addl	$1, %r14d
	imull	%ebp, %edx
	imull	%ecx, %eax
	addl	%ebx, %edx
	addl	%edx, %eax
	movq	results(%rip), %rdx
	cltq
	vmovsd	(%rdx,%rax,8), %xmm0
	movq	-16(%r15), %rdx
	movl	$1, %eax
	call	__printf_chk
	cmpl	%r14d, no_version(%rip)
	jg	.L58
.L53:
	movl	$10, %edi
	addl	$1, %ebx
	addq	$8, %r12
	call	putchar
	cmpl	%ebx, no_ratio(%rip)
	jg	.L57
.L51:
	addl	$1, %ebp
	addq	$8, %r13
	cmpl	%ebp, no_sz(%rip)
	jg	.L56
.L62:
	addq	$8, %rsp
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
.LFE68:
	.size	printresults, .-printresults
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.section	.text.startup,"ax",@progbits
.LHOTB16:
	.p2align 4,,15
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
	cmpl	$1, %edi
	jle	.L66
	leaq	8(%rsi), %rbx
	leal	2(%rdi), %r14d
	movl	%edi, %r15d
	movl	$3, %r13d
	movl	$1, %ebp
	movl	$0, 20(%rsp)
	movl	$50, 16(%rsp)
	movl	$10000, %r12d
	movq	$0, 24(%rsp)
	movq	$800000, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L79:
	movq	(%rbx), %rax
	cmpb	$45, (%rax)
	jne	.L67
	cmpb	$100, 1(%rax)
	jne	.L68
	cmpb	$0, 2(%rax)
	jne	.L111
	movl	$1, debug(%rip)
	cmpb	$45, (%rax)
	jne	.L67
.L68:
	cmpb	$108, 1(%rax)
	jne	.L111
	cmpb	$0, 2(%rax)
	jne	.L67
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r13d, %r15d
	cltq
	movq	%rax, 8(%rsp)
	jle	.L74
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L75
	movzbl	1(%rdi), %eax
	cmpb	$114, %al
	je	.L110
	cmpb	$100, %al
	jne	.L75
.L110:
	cmpb	$0, 2(%rdi)
	je	.L74
.L75:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	24(%rbx), %rdi
	cltq
	movl	$10, %edx
	xorl	%esi, %esi
	movq	%rax, 24(%rsp)
	call	strtol
	movslq	%eax, %r12
	movq	(%rbx), %rax
.L111:
	movzbl	(%rax), %edx
	cmpb	$45, %dl
	jne	.L67
	cmpb	$114, 1(%rax)
	jne	.L67
	cmpb	$0, 2(%rax)
	jne	.L67
	movq	8(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	cmpl	%r13d, %r15d
	movl	%eax, 16(%rsp)
	jle	.L74
	movq	16(%rbx), %rdi
	cmpb	$45, (%rdi)
	jne	.L77
	movzbl	1(%rdi), %eax
	cmpb	$108, %al
	je	.L112
	cmpb	$100, %al
	jne	.L77
.L112:
	cmpb	$0, 2(%rdi)
	je	.L74
.L77:
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	movq	24(%rbx), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	%eax, 20(%rsp)
	call	strtol
	movl	%eax, %ebp
.L67:
	addl	$1, %r13d
	addq	$8, %rbx
	cmpl	%r13d, %r14d
	jne	.L79
.L74:
	xorl	%ecx, %ecx
	cmpq	$0, toupperversion+8(%rip)
	je	.L80
.L96:
	cmpq	$1, toupperversion+24(%rip)
	sbbl	%ecx, %ecx
	addl	$2, %ecx
	movl	%ecx, no_version(%rip)
.L80:
	cmpq	$0, 24(%rsp)
	jne	.L82
.L97:
	movl	$1, no_sz(%rip)
.L83:
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jne	.L84
	movl	$1, no_ratio(%rip)
.L85:
	movl	no_sz(%rip), %r15d
	movl	no_ratio(%rip), %r13d
	imull	%r15d, %ecx
	imull	%r13d, %ecx
	movslq	%ecx, %rdi
	salq	$3, %rdi
	call	malloc
	movslq	%r13d, %rdi
	movq	%rax, results(%rip)
	salq	$3, %rdi
	call	malloc
	movslq	%r15d, %rdi
	movq	%rax, %r14
	movq	%rax, ratios(%rip)
	salq	$3, %rdi
	call	malloc
	testl	%r15d, %r15d
	movq	%rax, sizes(%rip)
	jle	.L86
	leal	-1(%r15), %edx
	movq	8(%rsp), %rbx
	leaq	8(%rax,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rbx, (%rax)
	addq	$8, %rax
	addq	%r12, %rbx
	cmpq	%rax, %rdx
	jne	.L87
	testl	%r13d, %r13d
	jle	.L90
.L98:
	movl	16(%rsp), %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L89:
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vmovsd	%xmm0, (%r14,%rdx,8)
	addq	$1, %rdx
	addl	%ebp, %eax
	cmpl	%edx, %r13d
	jg	.L89
	testl	%r15d, %r15d
	jle	.L91
.L90:
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L93:
	xorl	%ebx, %ebx
	testl	%r13d, %r13d
	jle	.L95
	.p2align 4,,10
	.p2align 3
.L102:
	movl	%ebx, %esi
	movl	%ebp, %edi
	addl	$1, %ebx
	call	run
	cmpl	%ebx, no_ratio(%rip)
	jg	.L102
.L95:
	addl	$1, %ebp
	cmpl	%ebp, no_sz(%rip)
	jle	.L91
	movl	no_ratio(%rip), %r13d
	jmp	.L93
.L86:
	testl	%r13d, %r13d
	jg	.L98
.L91:
	xorl	%eax, %eax
	call	printresults
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
.L84:
	.cfi_restore_state
	movl	20(%rsp), %eax
	subl	16(%rsp), %eax
	cltd
	idivl	%ebp
	addl	$1, %eax
	movl	%eax, no_ratio(%rip)
	jmp	.L85
.L82:
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	xorl	%edx, %edx
	divq	%r12
	addl	$1, %eax
	movl	%eax, no_sz(%rip)
	jmp	.L83
.L66:
	cmpq	$0, toupperversion+8(%rip)
	movl	$1, %ebp
	je	.L114
	movl	$0, 20(%rsp)
	movl	$50, 16(%rsp)
	movl	$10000, %r12d
	movq	$0, 24(%rsp)
	movq	$800000, 8(%rsp)
	jmp	.L96
.L114:
	xorl	%ecx, %ecx
	movl	$0, 20(%rsp)
	movl	$50, 16(%rsp)
	movl	$10000, %r12d
	movq	$800000, 8(%rsp)
	jmp	.L97
	.cfi_endproc
.LFE69:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE16:
	.section	.text.startup
.LHOTE16:
	.globl	toupperversion
	.section	.rodata.str1.1
.LC17:
	.string	"simple"
.LC18:
	.string	"optimised"
	.data
	.align 32
	.type	toupperversion, @object
	.size	toupperversion, 48
toupperversion:
	.quad	.LC17
	.quad	toupper_simple
	.quad	.LC18
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
.LC5:
	.long	0
	.long	-1074790400
	.align 8
.LC8:
	.long	2696277389
	.long	1051772663
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.10) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

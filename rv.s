	.file	"rv.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	display
	.type	display, @function
display:
	mv	a5,a0
 #APP
# 25 "rv.c" 1
	addi	a7,zero,35
	mv	a0, a5
	ecall
# 0 "" 2
 #NO_APP
	ret
	.size	display, .-display
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	li	a2,16384
	li	a6,-32768
	li	a1,32768
	li	a5,0
	li	a4,0
	addi	a2,a2,-1
	addi	a6,a6,1
	li	t1,2147418112
	addi	a1,a1,-2
.L4:
	and	a3,a4,a2
	slli	a3,a3,1
	and	a5,a5,a6
	or	a5,a5,a3
	or	a5,a5,t1
 #APP
# 25 "rv.c" 1
	addi	a7,zero,35
	mv	a0, a5
	ecall
# 0 "" 2
 #NO_APP
	addi	a4,a4,1
	and	a4,a4,a2
	slli	a4,a4,16
	srli	a4,a4,16
	and	a3,a4,a2
	slli	a3,a3,1
	and	a5,a5,a6
	or	a5,a5,a3
	and	a3,a5,a1
	slli	a3,a3,16
	srli	a3,a3,16
	bne	a3,a1,.L4
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (Arch Linux Repositories) 12.2.0"

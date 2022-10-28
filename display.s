	li	a2,32768
	li	a5,0x40000
	li	a6,0x60000
start:
	li	a4,0
	li	a7,35
.L4:
	or	a3,a4,a5
	lhu	a0,0(a3)
	slli	a0,a0,16
	or	a0,a0,a4
 #APP
# 19 "rv.c" 1
	ecall
# 0 "" 2
 #NO_APP
	addi	a4,a4,2
	bne	a4,a2,.L4
	
	srli	a5,a5,15
	addi	a5,a5,1
	slli	a5,a5,15
	bltu	a5,a6,normal
	li	a5,0x40000
normal:
	addi	a0,zero,10
	addi	a7,zero,10
	ecall
	j start

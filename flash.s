	li	a4,0
	li	a6,-65536
	li	a1,2147418112
	li	a2,16384
	li	a7,35
.L4:
	and	a0,a0,a6
	or	a0,a0,a4
	or	a0,a0,a1
 #APP
# 19 "rv.c" 1
	ecall
# 0 "" 2
 #NO_APP
	addi	a4,a4,1
	bne	a4,a2,.L4
	
	addi	a0,zero,10
	addi	a7,zero,10
	ecall

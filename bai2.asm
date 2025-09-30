.data
	INT_MAX:   .word 2147483647
    	INT_MIN:   .word -2147483648
	array: .space 400
	size: .word
	arrayMax: .word
	arrayMin: .word
	arraySum: .word 0
	MAX: .asciiz "MAX: "
	MIN: .asciiz "MIN: "
	SUM: .asciiz "SUM: "
	input: .asciiz "Nhap gia tri i: "
	output: .asciiz "array[i] = "
	endl: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall 
	
	#Lưu giá trị kích thước của mảng
	sw $v0, size
	
	#Lấy giá trị kích thước lưu vào thanh ghi $t0
	lw $t0, size
	
	#MAX và MIN của mảng sẽ được lưu vào $s0, $s1 
	lw $s0, INT_MIN
	lw $s1, INT_MAX
	
	#Tổng các phần tử của mảng lưu vào $s2
	lw $s2, arraySum
	
	#Nhập mảng 
	li $t1, 0
Loop:	beq $t1, $t0, EndLoop
	#Nhập 1 số lưu vào thanh ghi $t2
	li $v0, 5
	syscall 
	add $t2, $zero, $v0
	#Tính tổng mảng
	add $s2, $s2, $t2
	
Find:
	#Tìm Max, Min
	blt $s0, $t2, FindMax
	bgt $s1, $t2, FindMin
	
	
	#Đưa số vào mảng
	la $t3, array
	sll $t4, $t1, 2
	add $t5, $t3, $t4
	sw $t2, 0($t5)
	
	addi $t1, $t1, 1
	j Loop
FindMax:
	add $s0, $t2, $zero #$s0 = $t2 là giá trị vừa nhập
	j Find
FindMin: 
	add $s1, $t2, $zero #$s1 = $t2 là giá trị vừa nhập
	j Find
EndLoop:
#Lưu giá trị $s0, $s1, $s2 vào biến arrayMax, arrayMin, arraySum
	sw $s0, arrayMax
	sw $s1, arrayMin
	sw $s2, arraySum
#Xuất giá trị arrayMax, arrayMin, arraySum

	#Xuất arrayMax
	li $v0, 4 
	la $a0, MAX 
	syscall
	li $v0, 1
	add $a0, $s0, $zero
	syscall
	li $v0, 4
	la $a0, endl
	syscall
	
	#Xuất arrayMin
	li $v0, 4 
	la $a0, MIN 
	syscall
	li $v0, 1
	add $a0, $s1, $zero
	syscall
	li $v0, 4
	la $a0, endl
	syscall
	
	#Xuất arraySum
	li $v0, 4 
	la $a0, SUM 
	syscall
	li $v0, 1
	add $a0, $s2, $zero
	syscall
	li $v0, 4
	la $a0, endl
	syscall
	
#Nhập vào giá trị i sau đó xuất ra array[i]
	li $v0, 4 
	la $a0, input
	syscall
	#Nhập giá trị i
	li $v0, 5
	syscall
	add $t1, $zero, $v0
	#Lấy giá trị array[i]
	sll $t1, $t1, 2
	la $t3, array
	add $t1, $t1, $t3
	lw  $t6, 0($t1)
	#Xuất array[i]
	li $v0, 4 
	la $a0, output
	syscall	
	
	li $v0, 1
	add $a0, $zero, $t6 
	syscall
	
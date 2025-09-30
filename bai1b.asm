.data
	word1: .word 0
	word2: .word 0
	tong: .asciiz "Tong: "
	hieu: .asciiz "Hieu: "
	tich: .asciiz "Tich: "
	thuong: .asciiz "Thuong: "
	endl: .asciiz "\n"
.text
main:
	li $v0, 5
	syscall
	#Lưu giá trị của số vừa nhập vào biến word1
	sw $v0, word1
	
	li $v0, 5
	syscall 
	#Lưu giá trị của số vừa nhập vào biến word2
	sw $v0, word2
	
	#Load giá trị word1 và word2 vào thanh ghi t1 và t2 
	lw $t1, word1
	lw $t2, word2
	#Lưu tổng hiệu tích thương và phần dư sau khi chia của word1 và word2 vào s0 s1 s2 s3 s4
	add $s0, $t1, $t2
	sub $s1, $t1, $t2
	#Lấy phàn bit thấp 32 bit cuối sau khi nhân
	mult $t1, $t2
	mflo $s2
	#Lấy phần bit thấp (thương) và phần bit cao (dư)
	div $t1, $t2
	mflo $s3
	mfhi $s4
	
	#Xuất chuỗi tổng 
	la $a0, tong
	li $v0, 4 
	syscall 
	
	add $a0, $zero, $s0
	li $v0, 1 
	syscall
	
	la $a0, endl
	li $v0, 4 
	syscall
	
	#Xuất chuỗi hieu
	la $a0, hieu
	li $v0, 4 
	syscall 
	
	add $a0, $zero, $s1
	li $v0, 1 
	syscall
	
	la $a0, endl
	li $v0, 4 
	syscall
	
	#Xuất chuỗi tích
	la $a0, tich
	li $v0, 4 
	syscall 
	
	add $a0, $zero, $s2
	li $v0, 1 
	syscall
	
	la $a0, endl
	li $v0, 4 
	syscall
	
	#Xuất chuỗi thương
	la $a0, thuong
	li $v0, 4 
	syscall 
	
	add $a0, $zero, $s3
	li $v0, 1 
	syscall
	
	la $a0, endl
	li $v0, 4 
	syscall
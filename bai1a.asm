.data
	word1: .word 0
	word2: .word 0
.text
main:
	li $v0, 5
	syscall
#sau khi gọi syscall $v0 lưu giữ giá trị nhập vào bàn phím ta store giá trị đó vào biến word1
	sw $v0, word1 
	
	li $v0, 5
	syscall
#sau khi gọi syscall $v0 lưu giữ giá trị nhập vào bàn phím ta store giá trị đó vào biến word2
	sw $v0, word2
	
#ta load giá trị word1 và word2 lần lượt vào 2 thanh ghi $t1 và $t2
	lw $t1, word1
	lw $t2, word2
	
	sub $t0, $t1, $t2 #$t0 = $t1 - $t2
	beq $t0, $zero, Exit
	slt $t3, $zero, $t0 #$t3 = 1 nếu $t0 > 0 
	beq $t3, $zero, print2 #nếu $t3 = 0 thì $t1 - $t2 < 0 nên word1 < word2
print1:
	#Xuất word1
	lw $a0, word1
	li $v0, 1
	syscall
	j Exit
print2:
	#Xuất word2
	lw $a0, word2
	li $v0, 1
	syscall 
Exit:


	

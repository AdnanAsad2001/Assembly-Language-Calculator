.data
MESSAGE_1: .asciiz "PLEASE ENTER AN INTEGER: "
MESSAGE_2: .asciiz "PLEASE ENTER AN OPERATION (+,-,*,/,^): "
MESSAGE_3: .asciiz "RESULT:- "
MESSAGE_4: .asciiz "WRONG SELECTION. TRY AGAIN."
MESSAGE_5: .asciiz "ENTER POWER: "
MESSAGE_6: .asciiz "DO YOU WANT TO CONTINUE (Y/N): "
MESSAGE_7: .asciiz "PROGRAM COUNT: "
MESSAGE_8: .asciiz "THANK YOU."
DIVIDE_BY_ZERO: .asciiz "INFINITY ? , YOU CANNOT DIVIDE BY 0."
NEXT_LINE: .asciiz "\n"
QUOTIENT: .asciiz "QUOTIENT: "
REMAINDER: .asciiz "REMAINDER: "
.text
main:
li $t9 , 0
Counter:
addi $t9 , $t9 , 1
loop:
	#print a string
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall
	#print a string
	li $v0 , 4	
	la $a0 , MESSAGE_1
	syscall
	la $v0 , 5	#User input
	syscall
	#moves input to t0
	move $t0 , $v0
	
	#ask for operation (+,-,*,/) & listens to input for operation
	li $v0 , 4	#sets syscall type to print a string
	la $a0 , MESSAGE_2
	syscall
	li $v0 , 12	#listens for User Input
	syscall
	#moves input to t1
	move $t1 , $v0
	
	#new line
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall 
	#checks to see what operation is to be preformed
	li $t3 , '^'	#loads char(^)
	beq $t1 , $t3 , Power	#branches if condition is true is ^
	
	li $t3 , '+'	#loads char (+)
	beq $t1 , $t3 , Add	#branches if condition is true is +
	
	li $t3 , '-'	#loads char(-)
	beq $t1 , $t3 , Sub	#branches if condition is true is -
	
	li $t3 , '*'	#loads char(*)
	beq $t1 , $t3 , Multi	#branches if condition is true is *
	
	li $t3 , '/'	#loads char(/)
	beq $t1 , $t3 , Divide	#branches if condition is true is /
	
	li $v0 , 4
	la $a0 , MESSAGE_4
	syscall 
	j loop
	
Add:
	#asks to input a int & listens to input 2nd int
	li $v0 , 4	#print a string
	la $a0 , MESSAGE_1
	syscall
	li $v0 , 5	#User input
	syscall
	#moves input to t2
	move $t2 , $v0
	
	add $t4 , $t0 , $t2
	#now prints results
	
	#Printing message
	li $v0 , 4 	#system call code for printing string is 4
	la $a0 , MESSAGE_3 	#loads address for string to be printed
	syscall
	
	#creates new line for aesthetics
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall 
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	#Add t0 int first int to be printed
	li $v0 , 1	#syscall # for printing int
	move $a0 , $t0	#$a0 register to be printed
	syscall

	#printing a space
	li $a0 , 32		#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall		

	#printing the user inputted operator
	move $a0 , $t1	#copy from register for time as loading would take more time
	li $v0 , 11 		#11 is the value from printing the character
	syscall	
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall		

	#Add t2 int first int to be printed
	li $v0 , 1	# needed to print an int
	move $a0 , $t2	#$a0 register to be printed
	syscall
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall	
	
	#printing the equals sign
	li $a0 , '='	#puts asiic equal into a0 return
	li $v0 , 11 	#11 syscall # needed to print a character
	syscall
		
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	#printing result stored in $t4 register
	li $v0 , 1		#syscall # needed to print an int
	move $a0 , $t4	#moves $t4 register stored value result to be printed
	syscall
	j loop_2	#terminates program
	
Sub:
	#asks to input a int & listens to input 2nd int
	li $v0 , 4	#print a string
	la $a0 , MESSAGE_1
	syscall
	li $v0 , 5	#User input
	syscall
	#moves input to t2
	move $t2 , $v0

	sub $t4 , $t0 , $t2		#unsigned subtraction
	
	#Printing thank you message
	li $v0 , 4 		#system call code for printing string is 4
	la $a0 , MESSAGE_3 	#loads address for string to be printed
	syscall
	
	#creates new line for aesthetics
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall 
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	#Add t0 int first int to be printed
	li $v0 , 1	#syscall # for printing int
	move $a0 , $t0	#$a0 register to be printed
	syscall

	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall		

	#printing the user inputted operator
	move $a0 , $t1	#copy from register for time as loading would take more time
	li $v0 , 11	#11 is the value from printing the character
	syscall	
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall		

	#Add t2 int first int to be printed
	li $v0 , 1	#syscall # needed to print an int
	move $a0 , $t2	#$a0 register to be printed
	syscall
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall	
	
	#printing the equals sign
	li $a0 , '='	#puts asiic equal into a0 return
	li $v0 , 11 	#11 syscall # needed to print a character
	syscall	
		
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	#printing result stored in $t4 register
	li $v0 , 1	#syscall # needed to print an int
	move $a0 , $t4	#moves $s3 register stored value result to be printed
	syscall
	j loop_2	#terminates program
	
Multi:
	#asks to input a int & listens to input 2nd int
	li $v0 , 4	#print a string
	la $a0 , MESSAGE_1
	syscall
	li $v0 , 5	#User input
	syscall
	#moves input to t2
	move $t2 , $v0
	
	mult $t0 , $t2	#multiplies the two numbers
	mflo $t4	#loads hi into register $t4

	#Printing thank you message
	li $v0 , 4 		#system call code for printing string is 4
	la $a0 , MESSAGE_3	#loads address for string to be printed
	syscall
	
	#creates new line for aesthetics
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall 
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	#Add t0 int first int to be printed
	li $v0 , 1	#syscall # for printing int
	move $a0 , $t0	#$a0 register to be printed
	syscall

	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall		

	#printing the user inputted operator
	move $a0 , $t1	#copy from register for time as loading would take more time
	li $v0 , 11 	#11 is the value from printing the character
	syscall	
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall		

	#Add t2 int first int to be printed
	li $v0 , 1	#syscall # needed to print an int
	move $a0 , $t2	#$a0 register to be printed
	syscall
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall	
	
	#printing the equals sign
	li $a0 , '='	#puts asiic equal into a0 return
	li $v0 , 11 	#11 syscall # needed to print a character
	syscall	
		
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	#printing result stored in $t4 register
	li $v0 , 1	# needed to print an int
	move $a0 , $t4	#moves $t4 register stored value result to be printed
	syscall
	j loop_2
	
Divide:
	#asks to input a int & listens to input 2nd int
	li $v0 , 4	#print a string
	la $a0 , MESSAGE_1
	syscall
	li $v0 , 5	#User input
	syscall
	#moves input to t2
	move $t2 , $v0
	
	beqz $t2 , DIVIDE_ZERO	#checks to see if div by zero
	div $t0 , $t2		#divides the two
	mflo $t4	
	mfhi $t5
	
	#Printing thank you message
	li $v0 , 4 		#system call code for printing string is 4
	la $a0 , MESSAGE_3	#loads address for string to be printed
	syscall
	
	#creates new line for aesthetics
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall 
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall	
	
	#Add t0 int first int to be printed
	li $v0, 1	#syscall # for printing int
	move $a0, $t0	#$a0 register to be printed
	syscall

	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall		

	#printing the user inputted operator
	move $a0 , $t1	#copy from register for time as loading would take more time
	li $v0 , 11 	#11 is the value from printing the character
	syscall	
	
	#printing a space
	li $a0, 32	#adds a space using asiic for space #=32
	li $v0, 11	#11 is syscall number needed to print char
	syscall		

	#Add t2 int first int to be printed
	li $v0 , 1	#syscall # needed to print an int
	move $a0 , $t2	#$a0 register to be printed
	syscall
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall	
	
	#printing the equals sign
	li $a0 , '='	#puts asiic equal into a0 return
	li $v0 , 11 	#11 syscall # needed to print a character
	syscall	
		
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11	#11 is syscall number needed to print char
	syscall	
	
	li $v0 , 4 		#system call code for printing string is 4
	la $a0 , QUOTIENT	#loads address for string to be printed
	syscall
	
	#printing result stored in $t4 register
	li $v0 , 1	#syscall # needed to print an int
	move $a0 , $t4	#moves $t4 register stored value result to be printed
	syscall
	
	#printing a space
	li $a0 , 32	#adds a space using asiic for space #=32
	li $v0 , 11 	#11 is syscall number needed to print char
	syscall	
	
	li $v0 , 4 		#system call code for printing string is 4
	la $a0 , REMAINDER 	#loads address for string to be printed
	syscall		
	
	#printing result stored in $t5 register
	li $v0 , 1	# needed to print an int
	move $a0 , $t5	#moves $t5 register stored value result to be printed
	syscall
	
	j loop_2

	DIVIDE_ZERO:
	li $v0 , 4		#syscall code for printing string
	la $a0 , DIVIDE_BY_ZERO	#loads string to be printed
	syscall 
	j loop_2

Power:
	li $v0 , 4 	
	la $a0 , MESSAGE_5
	syscall
	li $v0 , 5
	syscall
	move $t2 , $v0
	
	li $v0 , 4 
	la $a0 , MESSAGE_3
	syscall
	
	li $v0, 4
	la $a0, NEXT_LINE
	syscall 
	
	li $a0 , 32
	li $v0 , 11
	syscall	
	
	li $v0 , 1
	move $a0 , $t0
	syscall

	li $a0 , 32
	li $v0 , 11
	syscall		

	move $a0 , $t1
	li $v0 , 11
	syscall	

	li $a0 , 32
	li $v0 , 11
	syscall		

	li $v0 , 1
	move $a0 , $t2
	syscall

	li $a0 , 32
	li $v0 , 11
	syscall	
	
	li $a0 , '='
	li $v0 , 11
	syscall
	
	li $a0 , 32
	li $v0 , 11
	syscall	
	
	li $t4 , 1
	
	Power_1:
	mult $t4 , $t0
	mflo $t4
	addi $t2 , $t2 , -1
	bgtz $t2 , Power_1
	move $a0 , $t4
	li $v0 , 1
	syscall
	j loop_2

loop_2:
	#print a string
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall
	#print a string
	li $v0 , 4	
	la $a0 , MESSAGE_6
	syscall
	la $v0 , 12	#User input
	syscall
	#moves input to t6
	move $t6 , $v0
	li $t7 , 'y'
	beq $t6 , $t7 , Counter
	li $t7 , 'Y'
	beq $t6 , $t7 , Counter
	li $t7 , 'n'
	beq $t6 , $t7 , Terminate
	li $t7 , 'N'
	beq $t6 , $t7 , Terminate
	j loop_2
Terminate:
	#print a string
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall
	#print a string
	li $v0 , 4	
	la $a0 , MESSAGE_7
	syscall
	#printing result stored in $t8 register
	li $v0 , 1	# needed to print an int
	move $a0 , $t9	#moves $t9 register stored value result to be printed
	syscall
	li $v0 , 4
	la $a0 , NEXT_LINE
	syscall
	#print a string
	li $v0 , 4	
	la $a0 , MESSAGE_8
	syscall
	li $v0, 10	# exit
	syscall

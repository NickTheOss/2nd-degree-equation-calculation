.text
.globl __start
__start: 	

				li $t4, 1
				
loop:			la $a0, str1
				li $v0, 4
				syscall
				
				li $v0,6
				syscall
				
				mov.s $f12, $f0
				addi $sp, $sp, -4
				swc1 $f12, 0($sp)
				
				li $v0,2
				syscall
				
				la $a0, endl
				li $v0,4
				syscall
					
				la $a0, str3
				li $v0,4
				syscall
				
				li $v0,6
				syscall
				
				mov.s $f12, $f0
				addi $sp, $sp, -4
				swc1 $f12, 0($sp)
				
				li $v0,2
				syscall
				
				la $a0, endl
				li $v0,4
				syscall
				
				la $a0, str4
				li $v0,4
				syscall
					
				li $v0,6
				syscall
				
				mov.s $f12, $f0
				addi $sp, $sp, -4
				swc1 $f12, 0($sp)
				
				li $v0, 2
				syscall
				
				la $a0, endl
				li $v0,4
				syscall
				
				lwc1 $f12, 8($sp)
				mov.s $f1, $f12
				
				la $a0, str10
				li $v0,4
				syscall
				
				li $v0,2
				syscall
				
				
				
				la $a0, str2
				li $v0,4
				syscall
				
				lwc1 $f12, 4($sp)
				mov.s $f2, $f12
				li $v0,2
				syscall
				
				la $a0,str5
				li $v0,4
				syscall
				
				lwc1 $f12, 0($sp)
				mov.s $f3, $f12
				li $v0,2
				syscall
				
				la $a0, str11
				li $v0, 4
				syscall
				
				addi $sp, $sp, 12
				
				la $a0,endl
				li $v0,4
				syscall
				
				mul.s $f4, $f2, $f2 # $f4 = b^2
				li $t0, 4
			
				
				mtc1 $t0, $f5
				cvt.s.w $f6, $f5 # $f6 = 4
				
				mul.s $f7, $f1, $f3   # ag
				
				
				mul.s $f7, $f7, $f6    # $f7 = 4ag
				
				sub.s $f3, $f4, $f7 # $f3 = D
				sqrt.s $f4, $f3 # $f4 = riza D  
				
				li $t1, 2
				mtc1 $t1, $f5
				cvt.s.w $f6, $f5  
				mul.s $f6, $f6, $f1  # $f6 = 2a
				li $t1, -1
				mtc1 $t1, $f5
				cvt.s.w $f8, $f5
				mul.s $f8, $f8, $f2 # $f8 = -b
				mtc1 $zero, $f5
				cvt.s.w $f2, $f5
				
			    c.le.s $f2, $f3
				bc1t, doublex
				
				la $a0, no_x
				li $v0, 4
				syscall
				j msg
				
				
				
doublex:		add.s $f1, $f8, $f4
				div.s $f1, $f1, $f6
				sub.s $f2, $f8, $f4
				div.s $f2, $f2, $f6
				la $a0, str6
				li $v0,4
				syscall
				
				mov.s $f12, $f1
				li $v0,2
				syscall
				
				la $a0, endl
				li $v0, 4
				syscall
				
				la $a0, str7
				li $v0, 4
				syscall
				
				mov.s $f12, $f2s
				li $v0,2
				syscall
				
msg:			la $a0, cont
				li $v0, 4
				syscall
				
error:			li $v0,5
				syscall
				beq $v0, $zero, exit
				beq $v0, $t4, loop
				
				la $a0, errorstr
				li $v0,4
				syscall
				j error
				

										
exit:			la $a0, endl
				li $v0,4
				syscall


				la $a0, exit_success
				li $v0, 4
				syscall

				li $v0,10	
				syscall
				

.data

		str1: 		  .asciiz "Please give a float\n"
		str3:		  .asciiz "Please give second float\n"
		str4:		  .asciiz "Please give third float\n"
		str10:		  .asciiz "Input Equation is:  ("
		str2:		  .asciiz ")x^2 + ("
		str5:		  .asciiz ")x + ("
		str11:		  .asciiz ")"
		str6:		  .asciiz " x1 = "
		str7:		  .asciiz " x2 = "
		no_x:		  .asciiz " This equation has no solutions--> D<0"
		cont:		  .asciiz "\nDo you wish to continue? If so type '1' else type '0' to terminate\n"
		endl:		  .asciiz "\n"
		errorstr:		  .asciiz " Please type '1' or '0' ,other input numbers are considered as errors\n"
		exit_success: .asciiz "Program now terminates..\n"
##################################################################### 
# 
# CSCB58 Winter 2023 Assembly Final Project 
# University of Toronto, Scarborough 
# 
# Student: Ethan Chan, 1008153089, chanet14, eth.chan@mail.utoronto.ca 
# 
# Bitmap Display Configuration: 
# - Unit width in pixels: 8 (update this as needed)  
# - Unit height in pixels: 8 (update this as needed) 
# - Display width in pixels: 256 (update this as needed) 
# - Display height in pixels: 256 (update this as needed) 
# - Base Address for Display: 0x10008000 ($gp) 
# 
# Which milestones have been reached in this submission? 
# (See the assignment handout for descriptions of the milestones) 
# - Milestone 1/2/3 (choose the one the applies) 
# 
# Which approved features have been implemented for milestone 3? 
# (See the assignment handout for the list of additional features) 
# 1. (fill in the feature, if any) 
# 2. (fill in the feature, if any) 
# 3. (fill in the feature, if any) 
# ... (add more if necessary) 
# 
# Link to video demonstration for final submission: 
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it! 
# 
# Are you OK with us sharing the video with people outside course staff? 
# - No
# 
# Any additional information that the TA needs to know: 
# - (write here, if any) 
# 
##################################################################### 
.eqv  BASE_ADDRESS  0x10008000 
 
.text 
 	li $t0, BASE_ADDRESS # $t0 stores the base address for display 
 	li $t1, 0xff0000   # $t1 stores the red colour code 
 	li $t2, 0x00ff00   # $t2 stores the green colour code 
 	li $t3, 0x0000ff   # $t3 stores the blue colour code 
  
  	# settings: unit width and height = 8, display width and height = 256
  
 	sw $t1, 0($t0)  # paint the first (top-left) unit red.  
 	sw $t1, 12($t0)	# paint 3rd unit on first row red?
 	
 	# making a green character
 	#sw $t2, 64($t0)
 	#sw $t2, 256($t0)
 	
HandleKeypressW: # w was pressed
	#sw $v0, action
	addi $t3, $t3, 1
	j wait_key

HandleKeypressA:
	#sw $v0, action
	addi $t3, $t3, 2
	j wait_key
HandleKeypressS:
	#sw $v0, action
	addi $t3, $t3, 3
	j wait_key

HandleKeypressD:
 	#sw $t2, 260($t0)
 	#sw $t2, 264($t0)
 	addi $t3, $t3, 4
 	j wait_key

# put functions in here, before using main
.globl main
main:
 	# checking for keyboard input, which is stored 0xffff0000
 wait_key: 
 	#sw $t2, 260($t0) # draw
 	li $t9, 0xffff0000 # access the memory location of the key input
 	lw $t8, 0($t9) #load it into another register
 	beq $t8, 1, HandleKeypress # if a key was pressed, the value will be 1
 	j wait_key # go back to waiting for a keypress to happen
 	
HandleKeypress:

 	lw $t2, 4($t9) # assuming $t9 set to 0xffff0000
 	beq $t2, 0x77, HandleKeypressW # ASCII for 'w'
 	beq $t2, 0x61, HandleKeypressA # ASCII for 'a'
 	beq $t2, 0x73, HandleKeypressS # ASCII for 's'
 	beq $t2, 0x64, HandleKeypressD # ASCII for 'd'
 	beq $t2, 0x1b, QUIT # ASCII for 'ESC', to quit game
 	j wait_key # go back to waiting for a keypress

 QUIT:
 	# program continues to run until quit
 	j END
 	
 
 	
 	# to invoke sleep, load 32 into v0 and number of milleseconds into a0
	# li $v0, 32 
	# li $a0, 1000   # Wait one second (1000 milliseconds) 
 
END:
 	li $v0, 10 # terminate the program gracefully 
 	syscall 


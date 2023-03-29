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
.eqv PLAYER_COL 0x0000ff
.eqv HEAD_COL 0xcd853f
.eqv ARM_COL 0x00ff00 
.eqv BACKGROUND 0x000000

#.eqv PLY_MAX_X  # max x value that a player can move
#.eqv PLY_MAX_Y	  # max y vaule that a player can move
  	# settings: unit width and height = 8, display width and height = 256
 .data
.text 
 	li $t0, BASE_ADDRESS # $t0 stores the base address for display 
 	li $t1, 0x964B00   # $t1 stores the brown colour code 
 	li $t2, 0x00ff00   # $t2 stores the green colour code 
 	#li $t3, 0x0000ff   # $t3 stores the blue colour code 
  
 	#sw $t1, 0($t0)  # paint the first (top-left) unit red.  
 	#sw $t1, 12($t0)	# paint 3rd unit on first row red?
 	
 	# making a green character
 	#sw $t2, 64($t0)
 	#sw $t2, 256($t0)
 
 # draw platform 1
    	li $t9, 0       # loop counter
 	li $t3, 8       # unit width and height
    	li $t5, 3072   # y-coordinate of line
    	add $t6, $t0, $t5  # memory address of first pixel on line
    	addi $t6, $t6, 40 #adjust for x coord shift, do # of pixels * 8
# loop to draw a line
draw_plat1:
    sw $t1, 0($t6) # Set the pixel at the current memory address to red
    addi $t6, $t6, 4 # Move to the next pixel in the same row
    addi $t9, $t9, 1 # Increment the loop counter
    beq $t9, 7, set_plat2 # Exit loop when the line is complete
    j draw_plat1

# draw platfrm 2
set_plat2:
	li $t0, BASE_ADDRESS
    	li $t9, 0       # loop counter
    	li $t5, 1792   # y-coordinate of line
    	add $t6, $t0, $t5  # memory address of first pixel on line
    	addi $t6, $t6, 72 #adjust for x coord shift, do # of pixels * 8
draw_plat2:
    sw $t1, 0($t6) # Set the pixel at the current memory address to red
    addi $t6, $t6, 4 # Move to the next pixel in the same row
    addi $t9, $t9, 1 # Increment the loop counter
    beq $t9, 6, set_plat3 # Exit loop when the line is complete
    j draw_plat2
    
# draw platform 3
set_plat3:
	li $t0, BASE_ADDRESS
    	li $t9, 0       # loop counter
    	li $t5, 768   # y-coordinate of line
    	add $t6, $t0, $t5  # memory address of first pixel on line
    	addi $t6, $t6, 8 #adjust for x coord shift, do # of pixels * 8
draw_plat3:
    sw $t1, 0($t6) # Set the pixel at the current memory address to red
    addi $t6, $t6, 4 # Move to the next pixel in the same row
    addi $t9, $t9, 1 # Increment the loop counter
    beq $t9, 8, draw_ply_start # Exit loop when the line is complete
    j draw_plat3
	
# the character must be at least 3 units! 
draw_ply_start:
	li $t2, PLAYER_COL # get character colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	subi $t6, $t6, 128 # y coord of char (each line is 128)
	sub $t6, $t6, 16 # x coord (each pixel is 9)
	
	# draw character
	sw $t2, 0($t6) 	# base of character
	sw $t2, -128($t6) # character body
	sw $t4, -124($t6) # right arm
	sw $t4, -132($t6) # left arm
	sw $t3, -256($t6) # head of character
	addi $sp, $sp, -4 # make space on the stack
	sw $t6, 0($sp) # push the address of where the character starts onto the stack
 	j main
HandleKeypressW: # w was pressed
	lw $a0, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	# drawing
	
	# colouring old position black
	sw $t2, 0($a0) # character's foot
	sw $t2, -128($a0) # character body
	sw $t2, -124($a0) # right arm
	sw $t2, -132($a0) # left arm
	sw $t2, -256($a0) # head of character
	
	# drawing new character, everything moved one pixel up
	subi $a0, $a0, 128 # one pixel above
	sw $t1, 0($a0) # redraw the foot
	sw $t1, -128($a0) # character body
	sw $t4, -124($a0) # right arm
	sw $t4, -132($a0) # left arm
	sw $t3, -256($a0) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	j redraw

HandleKeypressA:
	lw $a0, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour

	# drawing
	# colouring old position black
	sw $t2, 0($a0) # character's foot
	sw $t2, -128($a0) # character body
	sw $t2, -124($a0) # right arm
	sw $t2, -132($a0) # left arm
	sw $t2, -256($a0) # head of character

	# draw a pixel one unit to the left
	subi $a0, $a0, 4 # one pixel to the left
	sw $t1, 0($a0) # character foot
	sw $t1, -128($a0) # character body
	sw $t4, -124($a0) # right arm
	sw $t4, -132($a0) # left arm
	sw $t3, -256($a0) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	j redraw

HandleKeypressS: # should i have a down button? or just rely on gravity?
	lw $a0, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	
	# drawing
	# colouring old position black
	sw $t2, 0($a0) # character's foot
	sw $t2, -128($a0) # character body
	sw $t2, -124($a0) # right arm
	sw $t2, -132($a0) # left arm
	sw $t2, -256($a0) # head of character

	# draw a pixel one unit down
	addi $a0, $a0, 128 # one pixel down
	sw $t1, 0($a0) # character foot
	sw $t1, -128($a0) # character body
	sw $t4, -124($a0) # right arm
	sw $t4, -132($a0) # left arm
	sw $t3, -256($a0) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	j redraw

HandleKeypressD:
	lw $a0, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	
	# drawing
	# colouring old position black
	sw $t2, 0($a0) # character's foot
	sw $t2, -128($a0) # character body
	sw $t2, -124($a0) # right arm
	sw $t2, -132($a0) # left arm
	sw $t2, -256($a0) # head of character

	# draw a pixel one unit to the right
	addi $a0, $a0, 4 # one pixel right
	sw $t1, 0($a0) # character foot
	sw $t1, -128($a0) # character body
	sw $t4, -124($a0) # right arm
	sw $t4, -132($a0) # left arm
	sw $t3, -256($a0) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, 4
	sw $a0, 0($sp)
	j redraw

# put functions in here, before using main
.globl main
main:
# change
redraw: 
 	#j END
 	# draw out character position
 	lw $t0, 0($sp) # pop the player address into $t0
	addi $sp, $sp, 4 # reclaim space 
	li $t1, 0x0000ff 
	sw $t1, 0($t0) #draw character
wait_key:	
 	li $t9, 0xffff0000 # access the memory location of the key input
 	lw $t8, 0($t9) #load it into another register
 	beq $t8, 1, HandleKeypress # if a key was pressed, the value will be 1
 	#j wait_key # go back to waiting for a keypress to happen
 	j wait_key
 	
HandleKeypress:
 	lw $t2, 4($t9) # assuming $t9 set to 0xffff0000
 	addi $sp, $sp, -4 # make space on stack
 	sw $t0, 0($sp) # push player's current address onto the stack
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


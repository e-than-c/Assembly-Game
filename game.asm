##################################################################### 
# 
# CSCB58 Winter 2023 Assembly Final Project 
# University of Toronto, Scarborough 
# 
# Student: Ethan Chan, 1008153089, chanet14, eth.chan@mail.utoronto.ca 
# 
# Bitmap Display Configuration: 
# - Unit width in pixels: 4 (update this as needed)  
# - Unit height in pixels: 4 (update this as needed) 
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
.eqv PLAT_COL 0x964B00
.eqv FIRE_COL 0xff0000 # stores red colour

#.eqv PLY_MAX_X  # max x value that a player can move
#.eqv PLY_MAX_Y	  # max y vaule that a player can move
  	# settings: unit width and height = 8, display width and height = 256
 .data
 platforms:		.word 3 # array to hold 3 addresses
.text 
	#la $t0, ADDRESS # load address into $t0
	#sw $t0, platforms
 	li $t0, BASE_ADDRESS # $t0 stores the base address for display 
 	li $t1, PLAT_COL   # $t1 stores the brown colour code 
 	li $t2, 0x00ff00   # $t2 stores the green colour code 
 	#li $t3, 0x0000ff   # $t3 stores the blue colour code 
 	
 	
 	#testing
 	#la $t0, 0x1000bf00
 	#addi $t0, $t0, 16128
 	#sw $t2, 0($t0)
  	#j END
 	#sw $t1, 0($t0)  # paint the first (top-left) unit red.  
 	#sw $t1, 12($t0)	# paint 3rd unit on first row red?
 	
 	# making a green character
 	#sw $t2, 64($t0)
 	#sw $t2, 256($t0)
 
 # draw platform 1
    	li $t9, 0       # loop counter
    	la $t6, 0x1000A828
    	la $t7, 0x1000A928
# loop to draw a line
draw_plat1: # bottom platform
    sw $t1, 0($t6) # top layer of platform to brown
    sw $t1, 0($t7) # second layer of platform
    addi $t6, $t6, 4 # Move to the next pixel in the top ow
    addi $t7, $t7, 4 # Move to the next pixel in bottom row
    addi $t9, $t9, 1 # Increment the loop counter
    beq $t9, 16, set_plat2 # Exit loop when the line is complete
    j draw_plat1

# draw platfrm 2
set_plat2: # centre platform
    	li $t9, 0       # loop counter
    	la $t6, 0x1000a774 # top row
    	la $t7, 0x1000a874 # bottom row
draw_plat2:
    sw $t1, 0($t6) # top layer of platform to brown
    sw $t1, 0($t7) # second layer of platform
    addi $t6, $t6, 4 # Move to the next pixel in the top ow
    addi $t7, $t7, 4 # Move to the next pixel in bottom row
    addi $t9, $t9, 1 # Increment the loop counter
    beq $t9, 12, set_plat3 # Exit loop when the line is complete
    j draw_plat2
    
# draw platform 3
set_plat3: # top platform, destination
    	li $t9, 0       # loop counter
    	la $t6, 0x10008fc0 # top row
    	la $t7, 0x100090c0 # bottom row
draw_plat3:
    sw $t1, 0($t6) # top layer of platform to brown
    sw $t1, 0($t7) # second layer of platform
    addi $t6, $t6, 4 # Move to the next pixel in the top ow
    addi $t7, $t7, 4 # Move to the next pixel in bottom row
    addi $t9, $t9, 1 # Increment the loop counter
    beq $t9, 8, fire # Exit loop when the line is complete
    j draw_plat3
    
fire: # damages character (turn red), does not disappear
    li $t0, 0xff0000 # stores red colour

    la $t6, 0x1000a758 # row above platform 2

        # drawing the cross
    sw $t0, -252($t6) # top right
    sw $t0, -260($t6) # top left
    sw $t0, 0($t6) # bottom of flame, yellow
    sw $t0, -4($t6) # bottom left
    sw $t0, 4($t6) # bottom right
    
flag:
    li $t0, 0xffffff # stores white olcour
    li $t1, 0x8968cd # stores lavendar
    li $t2, 0x800080
    la $t6, 0x10008ed4

        # drawing the flag
    sw $t0, -256($t6) # centre of flag
    sw $t0, -512($t6) # second top of flag
    sw $t1, -508($t6)
    sw $t2, -504($t6)
    
    sw $t0, -768($t6) # top of flag pole
    sw $t2, -764($t6)
    sw $t1, -760($t6)
    sw $t0, 0($t6) # bottom of flag
    
	
# the character must be at least 3 units! 
draw_ply_start:
	li $t2, PLAYER_COL # get character colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	
    	la $t6, 0x1000A728
	
	# draw character
	sw $t2, 0($t6) 	# base of character
	sw $t2, -256($t6) # character body
	sw $t4, -252($t6) # right arm
	sw $t4, -260($t6) # left arm
	sw $t3, -512($t6) # head of character

	addi $sp, $sp, -4 # make space on the stack
	sw $t6, 0($sp) # push the address of where the character starts onto the stack
 	j main
draw_old_ply:
    # intialization
    # pop colour of old position first
    lw $t2, 0($sp)
    addi $sp, $sp, 4
    # now pop player address off stack
    lw $s1, 0($sp) # pop player address off the stack
    addi $sp, $sp, 4 # add space back

    # colouring old position black
    sw $t2, 0($s1) # character's foot
    sw $t2, -256($s1) # character body
    sw $t2, -252($s1) # right arm
    sw $t2, -260($s1) # left arm
    sw $t2, -512($s1) # head of character

    # push player address back on the stack
    addi $sp, $sp, -4
    sw $s1, 0($sp)
    jr $ra
    
TOUCH_FIRE:
	#s1 should still have current player address
	li $t2, FIRE_COL
	sw $t2, 0($s1) # character's foot
    	sw $t2, -256($s1) # character body
    	sw $t2, -252($s1) # right arm
    	sw $t2, -260($s1) # left arm
    	sw $t2, -512($s1) # head of character
	j wait_key # character does not move
	
HandleKeypressW: # w was pressed
	# get address of top right corner
	li $a1, 0x100080fc
	
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	
	la $t5, -512($s1) # load character head 
	# check if character going out of bounds
	# currrent location < top boundary then do nothing
	blt $t5, $a1, wait_key
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	li $t6, PLAT_COL # platform colour
	
	# COLLISIONS
	# check if collide with PLATFORM
	lw $t7, -1024($s1) # no of pixels shifted + address of body part (head)
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, -764($s1) # right arm
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, -772($s1) # left arm
	beq $t6, $t7, wait_key # if platform, character does NOT move
	# since jumping up 3 rows
	lw $t7, -1280($s1)
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, -1020($s1)
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, -1028($s1)
	beq $t6, $t7, wait_key # if platform, character does NOT move
	
	
	# check if collide with FIRE
	li $k1, FIRE_COL
	lw $t7, -1024($s1) # no of pixels shifted + address of body part (head)
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -764($s1) # right arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -772($s1) # left arm
	beq $k1, $t7, TOUCH_FIRE
	
	# comment out to jump on fire to put it out
	lw $t7, -768($s1) # foot
	beq $k1, $t7, TOUCH_FIRE
	
	# draw old player position black
	# push the address to draw black
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	# push the colour to draw
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	jal draw_old_ply
	# pop the address back off the stack
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	
	# drawing new character, jump up two row
	subi $s1, $s1, 768 # one pixel above
	sw $t1, 0($s1) # redraw the foot
	sw $t1, -256($s1) # character body
	sw $t4, -252($s1) # right arm
	sw $t4, -260($s1) # left arm
	sw $t3, -512($s1) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	j redraw

HandleKeypressA:
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour

	
	# checking left boundary
	la $t5, -260($s1) # left arm
	# divide
	li $t6, 256
	div $t5, $t6
	mfhi $t7
	beq $t7, $zero, wait_key # instead of wait_key, need to push player address back on stack?S
	
	li $t6, PLAT_COL # platform colour
	# COLLISIONS
	# checking the destination pixel's colour
	lw $t8, -264($s1) # no of pixels shifted + address of body part (left arm)
	beq $t6, $t8, wait_key # if platform, character does NOT move
	lw $t8, -516($s1) # (for head)
	beq $t6, $t8, wait_key # if platform, character does NOT move
	lw $t8, -4($s1) # for foot
	beq $t6, $t8, wait_key # if platform, character does NOT move
	
	# check if collide with FIRE
	li $k1, FIRE_COL
	lw $t7, -264($s1) # no of pixels shifted + address of body part (head)
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -516($s1) # right arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -4($s1) # left arm
	beq $k1, $t7, TOUCH_FIRE
	
	
	# drawing
	# draw old player position black
	# push the address to draw black
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	# push the colour to draw
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	jal draw_old_ply
	# pop the address back off the stack
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space

	# draw a pixel one unit to the left
	subi $s1, $s1, 4 # one pixel to the left
	sw $t1, 0($s1) # redraw the foot
	sw $t1, -256($s1) # character body
	sw $t4, -252($s1) # right arm
	sw $t4, -260($s1) # left arm
	sw $t3, -512($s1) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	j redraw

HandleKeypressS: # should i have a down button? or just rely on gravity?
	# get address of bottom left corner
	li $a1, 0x1000bf00
	
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	
	# handling out of bounds bottom case
	la $t5, 0($s1) # get address of foot
	blt $a1, $t5, wait_key
	
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	li $t6, PLAT_COL # platform colour
	
	# COLLISIONS
	# checking the destination pixel's colour
	lw $t7, 256($s1) # no of pixels shifted + address of body part
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, 4($s1) # right arm
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, -4($s1) # left arm
	beq $t6, $t7, wait_key # if platform, character does NOT move
	
	# check if collide with FIRE
	li $k1, FIRE_COL
	lw $t7, 256($s1) # no of pixels shifted + address of body part (head)
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, 4($s1) # right arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -4($s1) # left arm
	beq $k1, $t7, TOUCH_FIRE
	
	
	# drawing
	# draw old player position black
	# push the address to draw black
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	# push the colour to draw
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	jal draw_old_ply
	# pop the address back off the stack
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space

	# draw a pixel one unit down
	addi $s1, $s1, 256 # one pixel down
	sw $t1, 0($s1) # redraw the foot
	sw $t1, -256($s1) # character body
	sw $t4, -252($s1) # right arm
	sw $t4, -260($s1) # left arm
	sw $t3, -512($s1) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	j redraw

HandleKeypressD:
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	
	# check right boundary
	la $t5, -252($s1) # right arm
	li $t7, 256 # set $t7 to width
        div $t5, $t7
        mfhi $k0
        addi $t7, $t7, -4
        beq $k0, $t7, wait_key
        
        li $t6, PLAT_COL # platform colour
	
	# COLLISIONS
	# checking the destination pixel's colour
	lw $t8, -248($s1) # no of pixels shifted + address of body part
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t8, -508($s1) # (for head)
	beq $t6, $t8, wait_key # if platform, character does NOT move
	lw $t8, 4($s1) # for foot
	beq $t6, $t8, wait_key # if platform, character does NOT move
	
	# check if collide with FIRE
	li $k1, FIRE_COL
	lw $t7, -248($s1) # no of pixels shifted + address of body part (head)
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -508($s1) # right arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, 4($s1) # left arm
	beq $k1, $t7, TOUCH_FIRE
	
	# drawing
	# draw old player position black
	# push the address to draw black
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	# push the colour to draw
	addi $sp, $sp, -4
	sw $t2, 0($sp)
	jal draw_old_ply
	# pop the address back off the stack
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space

	# draw a pixel one unit to the right
	addi $s1, $s1, 4 # one pixel right
	sw $t1, 0($s1) # redraw the foot
	sw $t1, -256($s1) # character body
	sw $t4, -252($s1) # right arm
	sw $t4, -260($s1) # left arm
	sw $t3, -512($s1) # head of character
	
	# push updated address back on the stack
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	j redraw

HandleKeypressP:
	# should clear the screen and start from the top
	# reset character to starting position
	# get character address from the stack
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
	li $t2, BACKGROUND # get background colour
	# drawing
	# colouring old position black
	sw $t2, 0($s1) # character's foot
	sw $t2, -256($s1) # character body
	sw $t2, -252($s1) # right arm
	sw $t2, -260($s1) # left arm
	sw $t2, -512($s1) # head of character
	# redraw character in starting position
	j draw_ply_start
# put functions in here, before using main
#gravity: 
delay: 
	li $v0, 32
	li $a0, 60
	syscall	
	jr $ra

.globl main
main:
# change
redraw: 
 	# draw out character position
 	lw $t0, 0($sp) # pop the player address into $t0
	addi $sp, $sp, 4 # reclaim space 
	
	li $t2, PLAYER_COL # get character colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	# draw character
	sw $t2, 0($t0) 	# base of character
	sw $t2, -256($t0) # character body
	sw $t4, -252($t0) # right arm
	sw $t4, -260($t0) # left arm
	sw $t3, -512($t0) # head of character
wait_key:
 		
 	li $t9, 0xffff0000 # access the memory location of the key input
 	lw $t8, 0($t9) #load it into another register
 	bne $t8, 1, gravity # uncomment this to enable gravity
 	j HandleKeypress # uncomment this to enable gravity
 	#beq $t8, 1, HandleKeypress # comment this back when enabling gravity
 	#j wait_key # comment this back when enabling gravity
gravity:
	jal delay	
	# if a key was not pressed:
 	# implement gravity here? while no key is pressed, move down a row?
 	# gravity
	# get address of bottom left corner
	
	li $a1, 0x1000bf00
	
	# handling out of bounds bottom case
	la $t5, 0($t0) # get address of foot
	blt $a1, $t5, wait_key
	
	# get colours
	li $t1, PLAYER_COL # get player colour
	li $t2, BACKGROUND # get background colour
	li $t3, HEAD_COL # get head colour
	li $t4, ARM_COL # get arm colour
	li $t6, PLAT_COL # platform colour
	
	# COLLISIONS
	# checking the destination pixel's colour
	lw $t7, 256($t0) # no of pixels shifted + address of body part
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, 4($t0) # right arm
	beq $t6, $t7, wait_key # if platform, character does NOT move
	lw $t7, -4($t0) # left arm
	beq $t6, $t7, wait_key # if platform, character does NOT move
	
	# check if collide with FIRE
	li $k1, FIRE_COL
	lw $t7, 256($s1) # no of pixels shifted + address of body part (head)
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, 4($s1) # right arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -4($s1) # left arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, 256($s1) # foot
	beq $k1, $t7, TOUCH_FIRE
		
	# drawing
	# colouring old position black
	sw $t2, 0($t0) # character's foot
	sw $t2, -256($t0) # character body
	sw $t2, -252($t0) # right arm
	sw $t2, -260($t0) # left arm
	sw $t2, -512($t0) # head of character

	# draw a pixel one unit down
	addi $t0, $t0, 256 # one pixel down
	sw $t1, 0($t0) # redraw the foot
	sw $t1, -256($t0) # character body
	sw $t4, -252($t0) # right arm
	sw $t4, -260($t0) # left arm
	sw $t3, -512($t0) # head of character
	
	# push the new address of character, affected by gravity back onto stack
	addi $sp, $sp, -4
	sw $t0, 0($sp)
 	j redraw
 	
HandleKeypress:
 	lw $t2, 4($t9) # assuming $t9 set to 0xffff0000
 	addi $sp, $sp, -4 # make space on stack
 	sw $t0, 0($sp) # push player's current address onto the stack
 	beq $t2, 0x77, HandleKeypressW # ASCII for 'w'
 	beq $t2, 0x61, HandleKeypressA # ASCII for 'a'
 	beq $t2, 0x73, HandleKeypressS # ASCII for 's'
 	beq $t2, 0x64, HandleKeypressD # ASCII for 'd'
 	beq $t2, 0x70, HandleKeypressP # ASCII for 'p'
 	beq $t2, 0x1b, QUIT # ASCII for 'ESC', to quit game
 	j wait_key # go back to waiting for a keypress

 QUIT:
 	# program continues to run until quit
 	j END
 	
 
 	
 	# to invoke sleep, load 32 into v0 and number of milleseconds into a0
	# li $v0, 32 
	# li $s1, 1000   # Wait one second (1000 milliseconds) 
 
END:
 	li $v0, 10 # terminate the program gracefully 
 	syscall 


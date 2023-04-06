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
.eqv DMG_COL 0x4B0082 # dark purple
.eqv IM_COL 0xffb6c1  # pink
.eqv RM_COL 0xffff00 # yellow
 .data
 HEARTS: 	.word 3 # global variable, start with 3 hearts
.text 
draw_hearts:
	# set no of hearts to 3
	la $t0, HEARTS # get address
	lw $t1, 0($t0) # accessing HEARTS
	li $t1, 3 # game starts with 3 hearts
	sw $t1, 0($t0) # save updated value into hearts
	
	li $t8, FIRE_COL
	la $t9, BASE_ADDRESS
	
	# drawing first heart
	# top left row
	sw $t8, 4($t9)
	sw $t8, 8($t9)
	sw $t8, 12($t9)	
	# centre piece + row
	sw $t8, 260($t9)
	sw $t8, 264($t9)
	sw $t8, 268($t9)			
	# actual centre dip
	sw $t8, 272($t9)
	sw $t8, 276($t9)
	# not part of centre
	sw $t8, 280($t9)
	sw $t8, 284($t9)
	sw $t8, 288($t9)
	# top right row
	sw $t8, 24($t9)	
	sw $t8, 28($t9)	
	sw $t8, 32($t9)			
	# top left column
	sw $t8, 256($t9)
	sw $t8, 512($t9)	
	sw $t8, 768($t9)
	# left diagonal
	sw $t8, 1028($t9)	
	sw $t8, 1288($t9)
	sw $t8, 1552($t9)
	# right diagonal
	sw $t8, 1556($t9)
	sw $t8, 1308($t9)
	sw $t8, 1056($t9)	
	# top right column
	sw $t8, 804($t9)
	sw $t8, 548($t9)				
   	sw $t8, 292($t9)
   	# filling in the rest
   	# second full row
   	sw $t8, 516($t9)
   	sw $t8, 520($t9)
   	sw $t8, 524($t9)
   	sw $t8, 528($t9)
   	sw $t8, 532($t9)
   	sw $t8, 536($t9)
   	sw $t8, 540($t9)
   	sw $t8, 544($t9)	
   	# third full rowgo to 804
   	sw $t8, 772($t9)
   	sw $t8, 776($t9)
   	sw $t8, 780($t9)
   	sw $t8, 784($t9)
   	sw $t8, 788($t9)
   	sw $t8, 792($t9)
   	sw $t8, 796($t9)
   	sw $t8, 800($t9)
   	# fourth row to 1056
   	sw $t8, 1032($t9)
   	sw $t8, 1036($t9)
      	sw $t8, 1040($t9)
   	sw $t8, 1044($t9)
   	sw $t8, 1048($t9)
   	sw $t8, 1052($t9) 	
   	# fifth row to 1308
   	sw $t8, 1292($t9)
   	sw $t8, 1296($t9)
   	sw $t8, 1300($t9)
   	sw $t8, 1304($t9)
   	
   	# heart # 2
	la $t9, 0x10008030
	# top left row
	sw $t8, 4($t9)
	sw $t8, 8($t9)
	sw $t8, 12($t9)	
	# centre piece + row
	sw $t8, 260($t9)
	sw $t8, 264($t9)
	sw $t8, 268($t9)			
	# actual centre dip
	sw $t8, 272($t9)
	sw $t8, 276($t9)
	# not part of centre
	sw $t8, 280($t9)
	sw $t8, 284($t9)
	sw $t8, 288($t9)
	# top right row
	sw $t8, 24($t9)	
	sw $t8, 28($t9)	
	sw $t8, 32($t9)			
	# top left column
	sw $t8, 256($t9)
	sw $t8, 512($t9)	
	sw $t8, 768($t9)
	# left diagonal
	sw $t8, 1028($t9)	
	sw $t8, 1288($t9)
	sw $t8, 1552($t9)
	# right diagonal
	sw $t8, 1556($t9)
	sw $t8, 1308($t9)
	sw $t8, 1056($t9)	
	# top right column
	sw $t8, 804($t9)
	sw $t8, 548($t9)				
   	sw $t8, 292($t9)
   	# filling in the rest
   	# second full row
   	sw $t8, 516($t9)
   	sw $t8, 520($t9)
   	sw $t8, 524($t9)
   	sw $t8, 528($t9)
   	sw $t8, 532($t9)
   	sw $t8, 536($t9)
   	sw $t8, 540($t9)
   	sw $t8, 544($t9)	
   	# third full rowgo to 804
   	sw $t8, 772($t9)
   	sw $t8, 776($t9)
   	sw $t8, 780($t9)
   	sw $t8, 784($t9)
   	sw $t8, 788($t9)
   	sw $t8, 792($t9)
   	sw $t8, 796($t9)
   	sw $t8, 800($t9)
   	# fourth row to 1056
   	sw $t8, 1032($t9)
   	sw $t8, 1036($t9)
      	sw $t8, 1040($t9)
   	sw $t8, 1044($t9)
   	sw $t8, 1048($t9)
   	sw $t8, 1052($t9) 	
   	# fifth row to 1308
   	sw $t8, 1292($t9)
   	sw $t8, 1296($t9)
   	sw $t8, 1300($t9)
   	sw $t8, 1304($t9)
   	
   	# third heart
   	
   	la $t9, 0x10008060
	
	# drawing first heart
	# top left row
	sw $t8, 4($t9)
	sw $t8, 8($t9)
	sw $t8, 12($t9)	
	# centre piece + row
	sw $t8, 260($t9)
	sw $t8, 264($t9)
	sw $t8, 268($t9)			
	# actual centre dip
	sw $t8, 272($t9)
	sw $t8, 276($t9)
	# not part of centre
	sw $t8, 280($t9)
	sw $t8, 284($t9)
	sw $t8, 288($t9)
	# top right row
	sw $t8, 24($t9)	
	sw $t8, 28($t9)	
	sw $t8, 32($t9)			
	# top left column
	sw $t8, 256($t9)
	sw $t8, 512($t9)	
	sw $t8, 768($t9)
	# left diagonal
	sw $t8, 1028($t9)	
	sw $t8, 1288($t9)
	sw $t8, 1552($t9)
	# right diagonal
	sw $t8, 1556($t9)
	sw $t8, 1308($t9)
	sw $t8, 1056($t9)	
	# top right column
	sw $t8, 804($t9)
	sw $t8, 548($t9)				
   	sw $t8, 292($t9)
   	# filling in the rest
   	# second full row
   	sw $t8, 516($t9)
   	sw $t8, 520($t9)
   	sw $t8, 524($t9)
   	sw $t8, 528($t9)
   	sw $t8, 532($t9)
   	sw $t8, 536($t9)
   	sw $t8, 540($t9)
   	sw $t8, 544($t9)	
   	# third full rowgo to 804
   	sw $t8, 772($t9)
   	sw $t8, 776($t9)
   	sw $t8, 780($t9)
   	sw $t8, 784($t9)
   	sw $t8, 788($t9)
   	sw $t8, 792($t9)
   	sw $t8, 796($t9)
   	sw $t8, 800($t9)
   	# fourth row to 1056
   	sw $t8, 1032($t9)
   	sw $t8, 1036($t9)
      	sw $t8, 1040($t9)
   	sw $t8, 1044($t9)
   	sw $t8, 1048($t9)
   	sw $t8, 1052($t9) 	
   	# fifth row to 1308
   	sw $t8, 1292($t9)
   	sw $t8, 1296($t9)
   	sw $t8, 1300($t9)
   	sw $t8, 1304($t9)
   	j platform
	
erase_heart:

	# pop address of the  heart to erase from stack
	lw $t9, 0($sp)
	addi $sp, $sp, 4
   	li $t8, BACKGROUND
	
	# drawing first heart
	# top left row
	sw $t8, 4($t9)
	sw $t8, 8($t9)
	sw $t8, 12($t9)	
	# centre piece + row
	sw $t8, 260($t9)
	sw $t8, 264($t9)
	sw $t8, 268($t9)			
	# actual centre dip
	sw $t8, 272($t9)
	sw $t8, 276($t9)
	# not part of centre
	sw $t8, 280($t9)
	sw $t8, 284($t9)
	sw $t8, 288($t9)
	# top right row
	sw $t8, 24($t9)	
	sw $t8, 28($t9)	
	sw $t8, 32($t9)			
	# top left column
	sw $t8, 256($t9)
	sw $t8, 512($t9)	
	sw $t8, 768($t9)
	# left diagonal
	sw $t8, 1028($t9)	
	sw $t8, 1288($t9)
	sw $t8, 1552($t9)
	# right diagonal
	sw $t8, 1556($t9)
	sw $t8, 1308($t9)
	sw $t8, 1056($t9)	
	# top right column
	sw $t8, 804($t9)
	sw $t8, 548($t9)				
   	sw $t8, 292($t9)
   	# filling in the rest
   	# second full row
   	sw $t8, 516($t9)
   	sw $t8, 520($t9)
   	sw $t8, 524($t9)
   	sw $t8, 528($t9)
   	sw $t8, 532($t9)
   	sw $t8, 536($t9)
   	sw $t8, 540($t9)
   	sw $t8, 544($t9)	
   	# third full rowgo to 804
   	sw $t8, 772($t9)
   	sw $t8, 776($t9)
   	sw $t8, 780($t9)
   	sw $t8, 784($t9)
   	sw $t8, 788($t9)
   	sw $t8, 792($t9)
   	sw $t8, 796($t9)
   	sw $t8, 800($t9)
   	# fourth row to 1056
   	sw $t8, 1032($t9)
   	sw $t8, 1036($t9)
      	sw $t8, 1040($t9)
   	sw $t8, 1044($t9)
   	sw $t8, 1048($t9)
   	sw $t8, 1052($t9) 	
   	# fifth row to 1308
   	sw $t8, 1292($t9)
   	sw $t8, 1296($t9)
   	sw $t8, 1300($t9)
   	sw $t8, 1304($t9)
   	jr $ra
platform:
 	li $t0, BASE_ADDRESS # $t0 stores the base address for display 
 	li $t1, PLAT_COL   # $t1 stores the brown colour code 
 	li $t2, 0x00ff00   # $t2 stores the green colour code 
 
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
    	la $t6, 0x1000ac74 # top row
    	la $t7, 0x1000ab74 # bottom row
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

    la $t6, 0x1000A664 #row above platform 2 

    sw $t0, -252($t6) # top right
    sw $t0, -260($t6) # top left
    sw $t0, 0($t6) # bottom of flame, yellow
    sw $t0, -4($t6) # bottom left
    sw $t0, 4($t6) # bottom right
    
flag:
    li $t0, 0xffffff # stores white olcour
    la $t6, 0x1000A71C

        # drawing the flag
    sw $t0, -256($t6) # centre of flag
    sw $t0, -512($t6) # second top of flag
    sw $t0, -508($t6) # was another col
    sw $t0, -504($t6) # was another col
    
    sw $t0, -768($t6) # top of flag pole
    sw $t0, -764($t6) # was another col
    sw $t0, -760($t6) # was another col
    sw $t0, 0($t6) # bottom of flag
    
# "interactive objects with properties"
draw_sub_heart:
	li $t2, 0x4B0082 # dark purple
	la $t6, 0x10009e5c # fix this address
	# powerup is two blocks tall
	sw $t2, -256($t6)
	#sw $t2, 0($t6) # draw the dark purple pick up
draw_immune_heart:
	# does NOT regenerate, simply makes you not lose a heart for ONE touch
	la $t6, 0x10009e68 # fix this address    
	li $t2, IM_COL # pink
	sw $t2, 0($t6)
draw_rem_fire:
	la $t6, 0x1000a754 # fix this address    
	li $t2, RM_COL # pink
	sw $t2, 0($t6)
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
 # functions
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
sub_heart: 
    	la $t1, HEARTS # get address
	lw $t2, 0($t1) # accessing HEARTS
	addi $t2, $t2, -1 # lose one heart, so next time touch fire will lose a second
	sw $t2, 0($t1) # save updated value into hearts
	jr $ra
add_heart: 
    	la $t1, HEARTS # get address
	lw $t2, 0($t1) # accessing HEARTS
	addi $t2, $t2, 1 # gain one heart, so next time touch fire will look like same num
	sw $t2, 0($t1) # save updated value into hearts
	jr $ra
erase_fire:
	# removes fire from the game
    li $t1, BACKGROUND# load black 
    la $t6, 0x1000A664 # adddress

    sw $t1, -252($t6) # top right
    sw $t1, -260($t6) # top left
    sw $t1, 0($t6) # bottom of flame, yellow
    sw $t1, -4($t6) # bottom left
    sw $t1, 4($t6) # bottom right
    jr $ra
	
	   
TOUCH_FIRE:
	# when touch fire, turn character red and reset to start?
	li $t1, BACKGROUND
	li $t2, FIRE_COL
	sw $t2, 0($s1) # character's foot
    	sw $t2, -256($s1) # character body
    	sw $t2, -252($s1) # right arm
    	sw $t2, -260($s1) # left arm
    	sw $t2, -512($s1) # head of character
	
    	# delay for a second to see the character is red
    	li $v0, 32
	li $a0, 150
	syscall	

	# draw old player position black
	# push the address to draw black
	addi $sp, $sp, -4
	sw $s1, 0($sp)
	# push the colour to draw
	addi $sp, $sp, -4
	sw $t1, 0($sp)
	jal draw_old_ply
	# pop the address back off the stack
	lw $s1, 0($sp) # pop player address off the stack
	addi $sp, $sp, 4 # reclaim the space
handle_hearts:
    	li $t3, 2 # num hearts remaining
    	li $t4, 1 # num hearts remaining
    	li $t7, 3
    	# make player lose a heart
    	la $t0, HEARTS # get address
	lw $t1, 0($t0) # accessing HEARTS
	addi $t1, $t1, -1 # lose one heart cuz touched fire
	sw $t1, 0($t0) # save new value into hearts
	beq $t1, $t7, draw_ply_start # dont erase any hearts
	beq $t1, $t3, erase_heart_3 # now have only 2 hearts
	beq $t1, $t4, erase_heart_2 # now only have 1 heart
	ble $t1, $zero, game_over # if no more hearts, game is over
	# know which heart to erase
erase_heart_2:
	# address of heart 2 load into t3
	# push address
	la $t7,	0x10008030
	addi $sp, $sp, -4
	sw $t7, 0($sp)
	jal erase_heart
	#j draw_ply_start
erase_heart_3:
	# address of heart 3
	la $t3, 0x10008060
	addi $sp, $sp, -4
	sw $t3, 0($sp)
    	jal erase_heart
   
    	j draw_ply_start
	
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
	
	# check if collision with FLAG (white)
	li $t0, 0xffffff 

	lw $t7, -1024($s1) # no of pixels shifted + address of body part (head)
	beq $t0, $t7, game_win # if flag
	lw $t7, -764($s1) # right arm
	beq $t0, $t7, game_win# if flag
	lw $t7, -772($s1) # left arm
	beq $t0, $t7, game_win # if flag
	# 3 pixels up
	lw $t7, -1280($s1)
	beq $t0, $t7, game_win
	lw $t7, -1020($s1)
	beq $t0, $t7, game_win #
	lw $t7, -1028($s1)
	beq $t0, $t7, game_win # i
	
	lw $t9, 256($s1) # pixel currently standing on
  	 # check if currently standing on a platform
  	 beq $t9, $t6, continueW # if on platform allow jump
   	 beq $t9, $t8, continueW # if on fire, allow jumping
   	 j wait_key
	
continueW:	
	# check if collide with FIRE
	li $k1, FIRE_COL
	lw $t7, -1024($s1) # no of pixels shifted + address of body part (head)
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -764($s1) # right arm
	beq $k1, $t7, TOUCH_FIRE
	lw $t7, -772($s1) # left arm
	beq $k1, $t7, TOUCH_FIRE
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
	
	# check if collide with double damage
	li $t6, DMG_COL # change from platform colour to double damage colour
	lw $t8, -264($s1) # no of pixels shifted + address of body part (left arm)
	beq $t6, $t8, jump_sub_heart_A # 
	lw $t8, -516($s1) # (for head)
	beq $t6, $t8, jump_sub_heart_A # 
	lw $t8, -4($s1) # foot
	beq $t6, $t8, jump_sub_heart_A # 
	# check if collide with immune damage
	li $t6, IM_COL
	beq $t6, $t8, jump_add_heart_A # 
	lw $t8, -516($s1) # (for head)
	beq $t6, $t8, jump_add_heart_A # 
	lw $t8, -4($s1) # foot
	beq $t6, $t8, jump_add_heart_A # 
	# check if collide with erase fire
	li $t6, RM_COL
	beq $t6, $t8, jump_erase_fire_A# 
	lw $t8, -516($s1) # (for head)
	beq $t6, $t8, jump_erase_fire_A# 
	lw $t8, -4($s1) # foot
	beq $t6, $t8, jump_erase_fire_A# 
	j continueA
	
jump_sub_heart_A:
	jal sub_heart
	j continueA
jump_add_heart_A:
	jal add_heart
	j continueA
jump_erase_fire_A:
	jal erase_fire
continueA:	
	# check if collide with FLAG (white)
	li $t0, 0xffffff # stores flag colour
	lw $t8, -264($s1) # no of pixels shifted + address of body part (left arm)
	beq $t0, $t8, game_win # if flag
	lw $t8, -516($s1) # (for head)
	beq $t0, $t8, game_win # if flag
	lw $t8, -4($s1) # for foot
	beq $t0, $t8, game_win # if platform, flag
	
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
	blt $a1, $t5, game_over # fall off map, game over
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
	
	# check if collide with FLAG
	li $t0, 0xffffff # stores flag colour
	lw $t7, 256($s1) # no of pixels shifted + address of body part
	beq $t0, $t7, game_win
	lw $t7, 4($s1) # right arm
	beq $t0, $t7, game_win
	lw $t7, -4($s1) # left arm
	beq $t0, $t7, game_win
	
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
	
	# check if collide with double damage
	li $t6, DMG_COL # change from platform colour to double damage colour
	lw $t8, -248($s1) # no of pixels shifted + address of body part (left arm)
	beq $t6, $t8, jump_sub_heart_D # 
	lw $t8, -508($s1) # (for head)
	beq $t6, $t8, jump_sub_heart_D # 
	lw $t8, 4($s1) # for foot
	beq $t6, $t8, jump_sub_heart_D # 
	# check if collide with immune dmg
	li $t6, IM_COL # change from platform colour to double damage colour
	lw $t8, -248($s1) # no of pixels shifted + address of body part (left arm)
	beq $t6, $t8, jump_add_heart_D # 
	lw $t8, -508($s1) # (for head)
	beq $t6, $t8, jump_add_heart_D # 
	lw $t8, 4($s1) # for foot
	beq $t6, $t8, jump_add_heart_D # 
	# check if collide with erase fire
	li $t6, RM_COL # change from platform colour to double damage colour
	lw $t8, -248($s1) # no of pixels shifted + address of body part (left arm)
	beq $t6, $t8, jump_erase_fire_D# 
	lw $t8, -508($s1) # (for head)
	beq $t6, $t8, jump_erase_fire_D# 
	lw $t8, 4($s1) # for foot
	beq $t6, $t8, jump_erase_fire_D 
	
	j continueD
jump_sub_heart_D:
	jal sub_heart
	j continueD
jump_add_heart_D:
	jal add_heart
	j continueD
jump_erase_fire_D:
	jal erase_fire
	
continueD:		
	# check if collide with FLAG
	li $t0, 0xffffff # stores flag colour
	
	lw $t8, -248($s1) # for right arm
	beq $t0, $t7, game_win 
	lw $t8, -508($s1) # (for head)
	beq $t0, $t8, game_win
	lw $t8, 4($s1) # for foot
	beq $t0, $t8, game_win
	
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
	j draw_hearts
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
	
	# if collide with purple pixel, remove a heart with sub_heart, and then jump to handle_hearts
	# handle_hearts will erase and calcualte the appropiate hearts
	# 0x4B0082 # dark purple
	# only check foot
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
	
	li $a1, 0x1000bf00
	
	# handling out of bounds bottom case
	la $t5, 0($t0) # get address of foot
	blt $a1, $t5, game_over
	
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
	
	# check if collide with double damage
   	li $k1, DMG_COL
   	lw $t7, 256($t0) # no of pixels shifted + address of body part (head)
 	beq $k1, $t7, jump_double_dmg_G
 	lw $t7, 4($t0) # right arm
    	beq $k1, $t7, jump_double_dmg_G
    	lw $t7, -4($t0) # left arm
   	beq $k1, $t7, jump_double_dmg_G

    	# check if collide with immune to fire
    	li $k1, IM_COL
    	lw $t7, 256($t0) # no of pixels shifted + address of body part (head)
    	beq $k1, $t7, jump_im_fire_G
    	lw $t7, 4($t0) # right arm
    	beq $k1, $t7, jump_im_fire_G
    	lw $t7, -4($t0) # left arm
    	beq $k1, $t7, jump_im_fire_G

    	# check collision with erasing fire
    	li $k1, RM_COL
    	lw $t7, 256($t0) # no of pixels shifted + address of body part (head)
    	beq $k1, $t7, jump_erase_fire_G
    	lw $t7, 4($t0) # right arm
    	beq $k1, $t7, jump_erase_fire_G
    	lw $t7, -4($t0) # left arm
    	beq $k1, $t7, jump_erase_fire_G

jump_double_dmg_G:
    	jal sub_heart
    	j continueG
jump_im_fire_G:
    	jal add_heart
    	j continueG
jump_erase_fire_G:
   	jal erase_fire
continueG:
	# handle collision with FLAG
	li $s3, 0xffffff # stores flag colour
	lw $t7, 256($t0) # no of pixels shifted + address of body part
	beq $s3, $t7, game_over 
	lw $t7, 4($t0) # right arm
	beq $s3, $t7, game_over
	lw $t7, -4($t0) # left arm
	beq $s3, $t7, game_over
	
	
	# drawing
	# colouring old position black
	li $t2, BACKGROUND # get background colour
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
 	
game_over:
	#li $t3, 0xffffff # stores flag colour
	#beq $t0, $t3, game_win # if game over cuz touch flag, make green
	# gravity uses the $s3 register
	#beq $s3, $t3, game_win
	li $t1, FIRE_COL # store red into t1 if lost
	j QUIT

game_win:
	li $t1, ARM_COL # store green to colour game over
QUIT:
 # clear the screen, colour everything black
	la $t4, 0x10008000
	la $t5, 0x1000bffc  # end address
	li $t3, BACKGROUND
	
clear_screen:
 	sw $t3, 0($t4) # colour pixel black
	addi $t4, $t4, 4 # increment
	beq $t4, $t5, draw_game_over # keep colouring everything black until reach the last address
 	# program continues to run until quit
 	j clear_screen
 	
draw_game_over:
	la $t2, 0x10009838
	# t1 should already be storing the appropiate colour, either FIRE_COL or ARM_COL
	# letter G
	sw $t1, -8($t2)
	sw $t1, -4($t2)
	sw $t1, 0($t2)
	sw $t1, 4($t2)
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	
	# down part of G
	# from -8 add 256 each time
	sw $t1, 248($t2)
	sw $t1, 504($t2)
	sw $t1, 760($t2)
	sw $t1, 1016($t2)
	sw $t1, 1272($t2)
	sw $t1, 1528($t2)
	
	# bottom horizontal of G
	sw $t1, 1532($t2)
	sw $t1, 1536($t2)
	sw $t1, 1540($t2)
	sw $t1, 1544($t2)
	sw $t1, 1548($t2)
	
	# going back up
	sw $t1, 1292($t2)
	sw $t1, 1036($t2)
	sw $t1, 780($t2)
	sw $t1, 776($t2)
	
	# writing the A
	la $t2, 0x10009858
	
	# left side of A
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# connector part of A
	sw $t1, 4($t2)
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	sw $t1, 16($t2)
	
	# right side of A
	sw $t1, 272($t2)
	sw $t1, 528($t2)
	sw $t1, 784($t2)
	sw $t1, 1040($t2)
	sw $t1, 1296($t2)
	sw $t1, 1552($t2)
		
	# middle connector of A
	sw $t1, 772($t2)
	sw $t1, 776($t2)
	sw $t1, 780($t2)
	
	# writing m
	la $t2, 0x10009878
	
	# left column of M
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# centre of m
	sw $t1, 260($t2)
	sw $t1, 520($t2)
	sw $t1, 780($t2)
	sw $t1, 528($t2)
	sw $t1, 276($t2)
	
	# right side of m
	la $t2, 0x10009890
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# letter e
	la $t2, 0x1000989c
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# top row of e
	sw $t1, 4($t2)
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	sw $t1, 16($t2)
	
	# middle row of e
	sw $t1, 772($t2)
	sw $t1, 776($t2)
	sw $t1, 780($t2)
	
	# bottom row of e
	sw $t1, 1540($t2)
	sw $t1, 1544($t2)
	sw $t1, 1548($t2)	
	sw $t1, 1552($t2)
	
	# writing OVER
	la $t2, 0x1000A330
	# top row of O
	sw $t1, 0($t2)
	sw $t1, 4($t2)
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	sw $t1, 16($t2)
	
	# left column of O
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# bottom row of O
	sw $t1, 1540($t2)
	sw $t1, 1544($t2)
	sw $t1, 1548($t2)	
	sw $t1, 1552($t2)
	
	
	# right column of O
	la $t2, 0x1000A344
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# letter V
	la $t2, 0x1000A354
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1284($t2)
	
	sw $t1, 1544($t2)
	
	sw $t1, 1292($t2)
	sw $t1, 1040($t2)
	sw $t1, 16($t2)
	sw $t1, 272($t2)
	sw $t1, 528($t2)
	sw $t1, 784($t2)
	
	# letter E
	la $t2, 0x1000A374
	
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# top row of e
	sw $t1, 4($t2)
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	sw $t1, 16($t2)
	
	# middle row of e
	sw $t1, 772($t2)
	sw $t1, 776($t2)
	sw $t1, 780($t2)
	
	# bottom row of e
	sw $t1, 1540($t2)
	sw $t1, 1544($t2)
	sw $t1, 1548($t2)	
	sw $t1, 1552($t2)
	
	# letter R
	la $t2, 0x1000A394
	
	# right column of R
	sw $t1, 0($t2)
	sw $t1, 256($t2)
	sw $t1, 512($t2)
	sw $t1, 768($t2)
	sw $t1, 1024($t2)
	sw $t1, 1280($t2)
	sw $t1, 1536($t2)
	
	# top row of R
	sw $t1, 4($t2)
	sw $t1, 8($t2)
	sw $t1, 12($t2)
	sw $t1, 268($t2)
	sw $t1, 524($t2)
	
	sw $t1, 780($t2)
	sw $t1, 776($t2)
	sw $t1, 772($t2)
	
	# diagonal of R
	sw $t1, 1028($t2)
	sw $t1, 1288($t2)
	sw $t1, 1548($t2)
	
 	
 
END:
 	li $v0, 10 # terminate the program gracefully 
 	syscall 


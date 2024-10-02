extends BasicMovingCharacter2D

@export var move_left_action = "move_left"
@export var move_right_action = "move_right"
@export var jump_action = "jump"


func _unhandled_input(event):
	# Horizontal movement
	if event.is_action(move_left_action):
		if event.is_pressed():
			direction = -1
		elif Input.is_action_pressed(move_right_action):
			direction = 1
		else:
			direction = 0
	elif event.is_action(move_right_action):
		if event.is_pressed():
			direction = 1
		elif Input.is_action_pressed(move_left_action):
			direction = -1
		else:
			direction = 0
	# Vertical movement
	if event.is_action_pressed(jump_action):
		jump()
	elif event.is_action_released(jump_action):
		cancel_jump()

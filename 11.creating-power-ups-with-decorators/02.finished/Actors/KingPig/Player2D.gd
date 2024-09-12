class_name Player2D
extends WallJumpingCharacter2D

@export var move_left_action = "move_left"
@export var move_right_action = "move_right"
@export var move_down_action = "move_down"
@export var jump_action = "jump"


@onready var jump_command := $Commands/JumpCommand
@onready var move_left_command := $Commands/MoveLeftCommand
@onready var move_right_command := $Commands/MoveRightCommand
@onready var stop_command := $Commands/StopCommand


func _unhandled_input(event):
	# Horizontal movement
	if event.is_action(move_left_action):
		if event.is_pressed():
			move_left_command.execute()
		elif Input.is_action_pressed(move_right_action):
			move_right_command.execute()
		else:
			stop_command.execute()
	elif event.is_action(move_right_action):
		if event.is_pressed():
			move_right_command.execute()
		elif Input.is_action_pressed(move_left_action):
			move_left_command.execute()
		else:
			stop_command.execute()
	# Vertical movement
	if event.is_action_pressed(jump_action):
		# Pass through logic
		if Input.is_action_pressed(move_down_action):
			enable_pass_through()
		else:
			jump_command.execute()
	elif event.is_action_released(jump_action):
		jump_command.unexecute()
	
	if event.is_action_released(move_down_action):
		disable_pass_through()

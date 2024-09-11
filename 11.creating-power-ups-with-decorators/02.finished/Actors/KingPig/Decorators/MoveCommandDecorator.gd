extends CommandDecorator

@export var speed_multiplier := 1.5

var original_direction: int


func execute() -> void:
	decorated_command.execute()
	original_direction = decorated_command.receiver.direction
	decorated_command.receiver.direction *= speed_multiplier


func remove_decoration() -> void:
	decorated_command.receiver.direction = original_direction
	if original_direction < 0:
		decorated_command.receiver.move_left_command = decorated_command
	else:
		decorated_command.receiver.move_right_command = decorated_command
	queue_free()

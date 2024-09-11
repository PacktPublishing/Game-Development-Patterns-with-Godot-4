extends CommandDecorator

@export var jump_strength_multiplier := 1.5


func execute() -> void:
	var original_jump_strength: float = decorated_command.receiver.jump_strength
	decorated_command.receiver.jump_strength *= jump_strength_multiplier
	decorated_command.execute()
	decorated_command.receiver.jump_strength = original_jump_strength


func remove_decoration() -> void:
	decorated_command.receiver.jump_command = decorated_command
	queue_free()

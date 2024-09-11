extends CommandDecorator

@export var extra_attack := 3

func execute() -> void:
	var original_attack = decorated_command.receiver.attack_strength
	decorated_command.receiver.attack_strength += extra_attack
	decorated_command.execute()
	decorated_command.receiver.attack_strength = original_attack


#func remove_decoration() -> void:
	#decorated_command.receiver.attack_command = decorated_command
	#queue_free()

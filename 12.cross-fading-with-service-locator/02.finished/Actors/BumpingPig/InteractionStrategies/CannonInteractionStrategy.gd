extends InteractionStrategy


func execute() -> void:
	context.light_cannon_command.cannon = interacted_area.get_parent()
	context.light_cannon_command.execute()

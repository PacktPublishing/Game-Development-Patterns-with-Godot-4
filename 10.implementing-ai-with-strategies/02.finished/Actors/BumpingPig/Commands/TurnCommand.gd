extends Command

@export var direction: int = -1

func execute() -> void:
	receiver.turn(direction)

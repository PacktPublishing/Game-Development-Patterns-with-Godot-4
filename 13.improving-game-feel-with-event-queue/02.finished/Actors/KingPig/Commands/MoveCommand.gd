extends Command


@export var direction := -1

func execute() -> void:
	receiver.move(direction)

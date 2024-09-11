extends Command


@export var direction := -1

func execute() -> void:
	receiver.direction = direction


func unexecute() -> void:
	receiver.direction = 0

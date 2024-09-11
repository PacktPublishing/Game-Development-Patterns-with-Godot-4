extends Command


@export var direction := -1

func execute() -> void:
	receiver.direction = direction * 2


func unexecute() -> void:
	receiver.direction = 0

extends Command


@export var direction := -1

func execute():
	receiver.move(direction)
	

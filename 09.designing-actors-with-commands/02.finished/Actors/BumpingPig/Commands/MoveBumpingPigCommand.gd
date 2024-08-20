extends BumpingPigCommand


@export var direction := -1

func execute():
	receiver.body.direction = direction
	

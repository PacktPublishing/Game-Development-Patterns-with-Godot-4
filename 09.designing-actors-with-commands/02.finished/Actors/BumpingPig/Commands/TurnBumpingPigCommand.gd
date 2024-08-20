extends BumpingPigCommand

var direction := 1

func execute() -> void:
	receiver.body.turn()

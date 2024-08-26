extends Command


func execute() -> void:
	receiver.jump()


func unexecute() -> void:
	receiver.cancel_jump()

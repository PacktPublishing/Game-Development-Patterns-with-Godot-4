extends Command

@export var impulse := Vector2(600, -600)

var throw_force := impulse

func execute() -> void:
	receiver.throw(throw_force)

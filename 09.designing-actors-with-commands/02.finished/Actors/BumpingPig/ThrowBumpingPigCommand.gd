extends BumpingPigCommand

@export var impulse := Vector2(600, -600)

var throw_force := impulse

func execute() -> void:
	throw_force.x = -receiver.sprites.scale.x * impulse.x
	receiver.throw(throw_force)

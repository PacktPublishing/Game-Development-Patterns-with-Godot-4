extends Command

@export var impulse := Vector2(600, -600)

@onready var throw_force := impulse

func execute() -> void:
	receiver.throw(throw_force)
	receiver.vision_area.call_deferred("set_monitoring", true)

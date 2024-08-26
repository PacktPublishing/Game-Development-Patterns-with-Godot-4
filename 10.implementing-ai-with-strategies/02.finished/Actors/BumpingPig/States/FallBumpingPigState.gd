extends BumpingPigState


func _ready() -> void:
	set_physics_process(false)


func _physics_process(delta: float) -> void:
	if context.body.is_on_floor():
		context.state = previous_state


func enter() -> void:
	context.animation_tree.enable_condition("fall")
	set_physics_process(true)
	previous_state = previous_state.previous_state


func exit() -> void:
	set_physics_process(false)
	context.animation_tree.disable_condition("fall")


func get_hurt(damage: int) -> void:
	context.health -= damage
	context.state = context.find_child("HitState")


func move(direction: int) -> void:
	if not direction == 0:
		turn(direction)
		context.body.direction = direction


func stop() -> void:
	context.body.direction = 0


func turn(direction: int) -> void:
	if direction > 0:
		context.sprites.scale.x = -1
	elif direction < 0:
		context.sprites.scale.x = 1

extends BumpingPigState


func enter() -> void:
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	context.animation_tree.enable_condition("run")


func exit() -> void:
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.animation_tree.disable_condition("run")


func get_hurt(damage: int) -> void:
	context.health -= damage
	context.state = context.find_child("HitState")


func move(direction: int) -> void:
	if not direction == 0:
		context.body.direction = direction


func stop() -> void:
	context.body.direction = 0
	context.state = context.find_child("BombIdleState")


func turn(direction: int) -> void:
	if direction > 0:
		context.sprites.scale.x = -1
	elif direction < 0:
		context.sprites.scale.x = 1


func throw(throw_force: Vector2) -> void:
	context.state = context.find_child("BombThrowState")
	await context.animation_tree.animation_finished
	var bomb: Bomb = context.bomb_factory.create()
	bomb.apply_central_impulse(throw_force)


func _on_body_direction_changed(new_direction: int) -> void:
	if new_direction > 0:
		context.sprites.scale.x = -1
	elif new_direction < 0:
		context.sprites.scale.x = 1
	if new_direction == 0:
		context.state = context.find_child("BombIdleState")

extends BumpingPigState


func enter() -> void:
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	context.animation_tree.enable_condition("idle")


func exit() -> void:
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.animation_tree.disable_condition("idle")


func throw(throw_force: Vector2) -> void:
	context.state = context.find_child("ThrowState")
	await context.animation_tree.animation_finished
	var throwable_object: RigidBody2D = context.throwable_factory.create()
	throwable_object.apply_central_impulse(throw_force)


func get_hurt(damage: int) -> void:
	context.body.stats.lives -= damage
	context.state = context.find_child("HitState")


func move(direction: int) -> void:
	if not direction == 0:
		turn(direction)
		context.body.direction = direction
		context.state = context.find_child("CarryRunState")


func turn(direction: int) -> void:
	if direction > 0:
		context.sprites.scale.x = -1
	elif direction < 0:
		context.sprites.scale.x = 1


func _on_body_direction_changed(new_direction: int) -> void:
	if context.body.direction > 0:
		context.sprites.scale.x = -1
	elif context.body.direction < 0:
		context.sprites.scale.x = 1
	if not context.body.direction == 0:
		context.state = context.find_child("CarryRunState")

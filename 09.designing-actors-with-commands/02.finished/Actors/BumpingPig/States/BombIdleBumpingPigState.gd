extends BumpingPigState


func enter() -> void:
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	context.animation_tree.enable_condition("idle")


func exit() -> void:
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.animation_tree.disable_condition("idle")


func throw(impulse: Vector2) -> void:
	context.state = context.find_child("BombThrowState")
	await context.animation_tree.animation_finished
	var bomb: Bomb = context.bomb_factory.create()
	bomb.apply_central_impulse(impulse)


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func _on_body_direction_changed(new_direction: int) -> void:
	if context.body.direction > 0:
		context.sprites.scale.x = -1
	elif context.body.direction < 0:
		context.sprites.scale.x = 1
	if not context.body.direction == 0:
		context.state = context.find_child("BombRunState")

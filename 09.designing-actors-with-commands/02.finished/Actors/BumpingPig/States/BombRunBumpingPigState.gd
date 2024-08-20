extends BumpingPigState


func enter() -> void:
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	context.animation_tree.enable_condition("run")


func exit() -> void:
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.animation_tree.disable_condition("run")


func _on_body_direction_changed(new_direction: int) -> void:
	if new_direction > 0:
		context.sprites.scale.x = -1
	elif new_direction < 0:
		context.sprites.scale.x = 1
	if new_direction == 0:
		context.state = context.find_child("BombIdleState")

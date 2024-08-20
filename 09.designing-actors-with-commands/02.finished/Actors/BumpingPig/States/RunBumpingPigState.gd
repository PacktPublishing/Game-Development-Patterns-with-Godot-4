extends BumpingPigState


func enter() -> void:
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	context.animation_tree.enable_condition("run")


func exit() -> void:
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.animation_tree.disable_condition("run")


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func jump() -> void:
	context.body.jump()
	context.state = context.find_child("JumpState")


func attack() -> void:
	context.state = context.find_child("AttackState")


func pick_bomb(bomb: Bomb) -> void:
	bomb.queue_free()
	context.state = context.find_child("BombPickingState")


func _on_body_direction_changed(new_direction: int) -> void:
	if new_direction > 0:
		context.sprites.scale.x = -1
	elif new_direction < 0:
		context.sprites.scale.x = 1
	if new_direction == 0:
		context.state = context.find_child("IdleState")

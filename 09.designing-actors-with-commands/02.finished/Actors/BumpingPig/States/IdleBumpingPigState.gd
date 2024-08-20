extends BumpingPigState


func enter() -> void:
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	if not context.body.jumped.is_connected(_on_body_jumped):
		context.body.jumped.connect(_on_body_jumped)
	if not context.vision_area.area_entered.is_connected(_vision_area_area_entered):
		context.vision_area.area_entered.connect(_vision_area_area_entered)
	context.animation_tree.enable_condition("idle")


func exit() -> void:
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.body.jumped.disconnect(_on_body_jumped)
	context.vision_area.area_entered.disconnect(_vision_area_area_entered)
	context.animation_tree.disable_condition("idle")


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func jump() -> void:
	context.body.jump()


func _on_body_direction_changed(new_direction: int) -> void:
	if context.body.direction > 0:
		context.sprites.scale.x = -1
	elif context.body.direction < 0:
		context.sprites.scale.x = 1
	if not context.body.direction == 0:
		context.state = context.find_child("RunState")


func _on_body_jumped() -> void:
	context.state = context.find_child("JumpState")


func _vision_area_area_entered(area: Area2D) -> void:
	context.state = context.find_child("AttackState")

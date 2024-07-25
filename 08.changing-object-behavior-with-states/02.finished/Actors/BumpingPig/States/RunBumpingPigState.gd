extends BumpingPigState


func enter() -> void:
	if not context.vision_area.area_entered.is_connected(_vision_area_area_entered):
		context.vision_area.area_entered.connect(_vision_area_area_entered)
	if not context.body.direction_changed.is_connected(_on_body_direction_changed):
		context.body.direction_changed.connect(_on_body_direction_changed)
	context.animation_tree.enable_condition("run")


func exit() -> void:
	context.vision_area.area_entered.disconnect(_vision_area_area_entered)
	context.body.direction_changed.disconnect(_on_body_direction_changed)
	context.animation_tree.disable_condition("run")


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func _on_body_direction_changed(new_direction: int) -> void:
	if context.body.direction > 0:
		context.sprites.scale.x = -1
	elif context.body.direction < 0:
		context.sprites.scale.x = 1
	if context.body.direction == 0:
		context.state = context.find_child("IdleState")


func _vision_area_area_entered(area: Area2D) -> void:
	context.state = context.find_child("AttackState")

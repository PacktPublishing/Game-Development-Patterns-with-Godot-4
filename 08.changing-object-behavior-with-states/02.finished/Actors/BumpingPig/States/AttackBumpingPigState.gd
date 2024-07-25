extends BumpingPigState


func enter() -> void:
	if not context.vision_area.area_exited.is_connected(_vision_area_area_exited):
		context.vision_area.area_exited.connect(_vision_area_area_exited)
	
	var attack_animation : Animation = context.animation_tree.get_animation("attack")
	attack_animation.loop_mode = Animation.LOOP_LINEAR
	
	context.animation_tree.enable_condition("attack")
	context.body.set_physics_process(false)


func exit() -> void:
	context.vision_area.area_exited.disconnect(_vision_area_area_exited)
	
	context.animation_tree.disable_condition("attack")
	context.body.set_physics_process(true)


func get_hurt() -> void:
	context.state = context.find_child("HitState")

func _vision_area_area_exited(area: Area2D) -> void:
	var attack_animation : Animation = context.animation_tree.get_animation("attack")
	attack_animation.loop_mode = Animation.LOOP_NONE
	
	await context.animation_tree.animation_finished
	context.state = previous_state

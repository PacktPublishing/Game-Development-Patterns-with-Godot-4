extends BumpingPigState


func enter() -> void:
	context.animation_tree.enable_condition("attack")
	context.body.set_physics_process(false)
	await context.animation_tree.animation_finished
	context.state = previous_state


func exit() -> void:
	context.animation_tree.disable_condition("attack")
	context.body.set_physics_process(true)


func get_hurt() -> void:
	context.state = context.find_child("HitState")

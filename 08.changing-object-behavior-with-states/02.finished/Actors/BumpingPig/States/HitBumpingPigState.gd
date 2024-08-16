extends BumpingPigState


func enter() -> void:
	context.animation_tree.enable_condition("hit")
	context.body.set_physics_process(false)
	
	context.score.increase_score()
	await context.animation_tree.animation_finished
	if context.health > 0:
		context.state = previous_state
	else:
		context.score.increase_score()
		context.state = context.find_child("DeadState")


func exit() -> void:
	context.body.set_physics_process(true)
	context.animation_tree.disable_condition("hit")

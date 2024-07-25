extends BumpingPigState


func enter() -> void:
	context.body.set_physics_process(false)
	context.animation_tree.enable_condition("dead")
	for loot in context.loots.get_children():
		loot.drop()
	await context.animation_tree.animation_finished
	context.queue_free()


func exit() -> void:
	context.body.set_physics_process(true)
	context.animation_tree.disable_condition("dead")

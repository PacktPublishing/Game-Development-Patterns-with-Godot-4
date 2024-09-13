extends BumpingPigState


func enter() -> void:
	context.animation_tree.enable_condition("attack")
	context.body.set_physics_process(false)
	await context.animation_tree.animation_finished
	context.state = previous_state


func exit() -> void:
	context.animation_tree.disable_condition("attack")
	context.body.set_physics_process(true)


func get_hurt(damage: int) -> void:
	context.body.stats.lives -= damage
	context.state = context.find_child("HitState")


func turn(direction: int) -> void:
	if direction > 0:
		context.sprites.scale.x = -1
	elif direction < 0:
		context.sprites.scale.x = 1

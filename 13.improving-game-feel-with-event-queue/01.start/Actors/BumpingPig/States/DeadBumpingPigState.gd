extends BumpingPigState


func enter() -> void:
	context.body.set_physics_process(false)
	for loot in context.loots.get_children():
		loot.drop()

extends BumpingPigState


func enter() -> void:
	context.body.direction = 0
	context.animation_tree.enable_condition("bomb_picked")
	await context.animation_tree.animation_finished
	context.state = context.find_child("BombIdleState")


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func exit() -> void:
	context.animation_tree.disable_condition("bomb_picked")
	context.animation_tree.condition_path = "parameters/StateMachine/conditions/%s"

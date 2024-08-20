extends BumpingPigState


var previous_direction := 1

func enter() -> void:
	previous_direction = context.body.direction
	context.body.direction = 0
	context.animation_tree.enable_condition("bomb_picked")
	await context.animation_tree.animation_finished
	context.state = context.find_child("BombIdleState")


func exit() -> void:
	context.animation_tree.disable_condition("bomb_picked")
	context.animation_tree.condition_path = "parameters/StateMachine/conditions/%s"

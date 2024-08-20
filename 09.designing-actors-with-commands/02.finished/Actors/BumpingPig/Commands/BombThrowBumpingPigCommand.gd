extends BumpingPigState

var previous_direction := 1

func enter() -> void:
	previous_direction = context.body.direction
	context.body.direction = 0
	context.animation_tree.enable_condition("throw")
	await context.animation_tree.animation_finished
	context.state = context.find_child("IdleState")


func exit() -> void:
	context.body.direction = previous_direction
	context.animation_tree.disable_condition("throw")
	context.animation_tree.condition_path = "parameters/conditions/%s"

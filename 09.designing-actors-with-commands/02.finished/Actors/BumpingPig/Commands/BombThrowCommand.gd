extends BumpingPigState

var previous_direction := 1

func enter() -> void:
	previous_direction = context.body.direction
	context.body.direction = 0
	context.animation_tree.enable_condition("throw")
	await context.animation_tree.animation_finished
	if previous_direction == 0:
		context.state = context.find_child("IdleState")
	else:
		context.state = context.find_child("RunState")


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func exit() -> void:
	context.animation_tree.disable_condition("throw")
	context.animation_tree.condition_path = "parameters/conditions/%s"
	context.body.direction = previous_direction
	

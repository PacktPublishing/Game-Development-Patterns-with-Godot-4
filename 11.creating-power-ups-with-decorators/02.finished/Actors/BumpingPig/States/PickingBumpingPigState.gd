extends BumpingPigState

var previous_direction := 0

func enter() -> void:
	previous_direction = context.body.direction
	context.body.direction = 0
	context.animation_tree.enable_condition("%s_picked" % context.picking_object_type)
	await context.animation_tree.animation_finished
	context.state = context.find_child("CarryRunState")
	context.body.direction = previous_direction


func get_hurt(damage: int) -> void:
	context.body.stats.lives -= damage
	context.state = context.find_child("HitState")


func exit() -> void:
	context.animation_tree.disable_condition("%s_picked" % context.picking_object_type)
	if context.picking_object_type == "bomb":
		context.animation_tree.condition_path = "parameters/StateMachine/conditions/%s"
	elif context.picking_object_type == "crate":
		context.animation_tree.condition_path = "parameters/StateMachine 2/conditions/%s"

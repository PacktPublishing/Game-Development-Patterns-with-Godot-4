class_name PassThroughCharacter2D
extends BasicMovingCharacter2D

@export_flags_2d_physics var pass_through_layers = 2

func enable_pass_through():
	set_collision_mask_value(pass_through_layers, false)


func disable_pass_through():
	set_collision_mask_value(pass_through_layers, true)

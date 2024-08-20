extends BumpingPigState


func _ready() -> void:
	set_physics_process(false)


func _physics_process(delta: float) -> void:
	if context.body.velocity.y >= 0:
		context.state = context.find_child("FallState")


func enter() -> void:
	context.animation_tree.enable_condition("jump")
	set_physics_process(true)


func exit() -> void:
	set_physics_process(false)
	context.animation_tree.disable_condition("jump")


func get_hurt() -> void:
	context.state = context.find_child("HitState")

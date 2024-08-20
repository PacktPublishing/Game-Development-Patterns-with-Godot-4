extends BumpingPigState


func enter() -> void:
	context.animation_tree.enable_condition("idle")


func exit() -> void:
	context.animation_tree.disable_condition("idle")


func get_hurt() -> void:
	context.state = context.find_child("HitState")


func move(direction: int) -> void:
	if not direction == 0:
		turn(direction)
		context.body.direction = direction
		context.state = context.find_child("RunState")


func turn(direction: int) -> void:
	if direction > 0:
		context.sprites.scale.x = -1
	elif direction < 0:
		context.sprites.scale.x = 1


func jump() -> void:
	context.body.jump()
	context.state = context.find_child("JumpState")


func attack() -> void:
	context.state = context.find_child("AttackState")

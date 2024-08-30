extends BumpingPigState


func enter() -> void:
	context.animation_tree.enable_condition("run")


func exit() -> void:
	context.animation_tree.disable_condition("run")


func get_hurt(damage: int) -> void:
	context.health -= damage
	context.state = context.find_child("HitState")


func move(direction: int) -> void:
	if not direction == 0:
		turn(direction)
		context.body.direction = direction


func stop() -> void:
	context.body.direction = 0
	context.state = context.find_child("IdleState")


func jump() -> void:
	context.body.jump()
	context.state = context.find_child("JumpState")


func attack() -> void:
	context.state = context.find_child("AttackState")


func turn(direction: int) -> void:
	if direction > 0:
		context.sprites.scale.x = -1
	elif direction < 0:
		context.sprites.scale.x = 1


func pick(object: Node2D) -> void:
	object.queue_free()
	context.state = context.find_child("PickingState")

extends BumpingPigState

var previous_direction := 0
var cannon: Cannon

@onready var light_on_timer = $LightOnTimer

func enter() -> void:
	previous_direction = context.body.direction
	context.body.direction = 0
	context.animation_tree.enable_condition("light_match")
	await context.animation_tree.animation_finished
	context.animation_tree.condition_path = "parameters/StateMachine 3/conditions/%s"
	light_on_timer.start()


func exit() -> void:
	context.animation_tree.condition_path = "parameters/conditions/%s"
	context.animation_tree.disable_condition("light_match")
	context.body.direction = previous_direction


func get_hurt(damage: int) -> void:
	context.body.stats.lives -= damage
	context.state = context.find_child("HitState")


func _on_light_on_timer_timeout() -> void:
	context.animation_tree.enable_condition("light_cannon")
	await context.animation_tree.animation_finished
	cannon.shoot()
	context.animation_tree.disable_condition("light_cannon")
	context.state = previous_state

extends Node
class_name BumpingPigState

var context: BumpingPig
var previous_state: BumpingPigState


func enter() -> void:
	pass


func exit() -> void:
	pass


func get_hurt(damage: int) -> void:
	pass


func move(direction: int) -> void:
	pass


func stop() -> void:
	pass


func jump() -> void:
	pass


func cancel_jump() -> void:
	pass


func attack() -> void:
	pass


func throw(throw_force: Vector2) -> void:
	pass


func turn(direction: int) -> void:
	pass


func pick_bomb(bomb: Bomb) -> void:
	pass

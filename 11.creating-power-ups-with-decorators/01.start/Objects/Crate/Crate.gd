extends RigidBody2D
class_name Crate

signal broke

@export var health = 3

@onready var animation_player = $AnimationPlayer


func _on_hurt_box_2d_hurt(_damage: int) -> void:
	damage(_damage)


func damage(_damage: int) -> void:
	health -= _damage
	if health < 1:
		shatter()
	else:
		animation_player.play("hit")


func shatter():
	broke.emit()
	animation_player.play("break")


func _on_body_entered(body: Node) -> void:
	shatter()

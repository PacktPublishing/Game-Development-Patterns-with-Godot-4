extends Node2D

@export var health = 3
@onready var animation_player = $AnimationPlayer


func jump():
	animation_player.play("jump")


func _on_vision_area_2d_area_entered(area):
	animation_player.play("look")


func _on_crate_tree_exited():
	queue_free()


func _on_hurt_box_2d_hurt(damage):
	health -= damage
	if health < 1:
		animation_player.play("break")
	else:
		animation_player.play("hit")

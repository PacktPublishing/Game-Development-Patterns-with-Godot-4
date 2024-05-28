extends RigidBody2D

@onready var animator = $AnimationPlayer

func explode():
	animator.play("explode")
	sleeping = true


func _on_vision_area_2d_area_entered(area):
	explode()

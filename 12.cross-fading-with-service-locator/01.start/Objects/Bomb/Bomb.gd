extends RigidBody2D
class_name Bomb

@onready var animator = $AnimationPlayer


func explode() -> void:
	animator.play("explode")


func _on_vision_area_2d_area_entered(area: Area2D) -> void:
	if not area == $VisibleArea2D:
		explode()

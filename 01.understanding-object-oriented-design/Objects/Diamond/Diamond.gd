extends RigidBody2D


func _on_interactive_area_2d_interaction_available():
	queue_free()
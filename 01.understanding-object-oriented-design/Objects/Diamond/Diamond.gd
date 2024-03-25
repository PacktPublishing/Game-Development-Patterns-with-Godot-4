extends RigidBody2D

@export var pop_label_scene = preload("res://Interface/PopLabel/PopLabel.tscn")
@export var score = 175


func _on_interactive_area_2d_interaction_available():
	var pop_label = pop_label_scene.instantiate()
	find_parent("Level").find_child("PopLabels").add_child(pop_label)
	pop_label.pop(str(score), global_position)
	queue_free()

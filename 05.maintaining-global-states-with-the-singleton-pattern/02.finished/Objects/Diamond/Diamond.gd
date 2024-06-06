extends RigidBody2D

@onready var score_points = $ScorePoint


func _on_interactive_area_2d_interaction_available():
	score_points.increase_score()
	queue_free()

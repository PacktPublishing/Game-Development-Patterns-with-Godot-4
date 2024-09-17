extends Node2D
class_name Diamond


@export var decorator: StatsDecorator

@onready var score_points := $RigidBody2D/ScorePoint
@onready var animation_player := $AnimationPlayer


func _on_interactive_area_2d_interaction_available():
	PowerUpsSingleton.add_power_up(decorator)
	score_points.increase_score()
	queue_free()

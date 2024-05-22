extends Node2D


@onready var animation_player := $AnimationPlayer
@onready var label := $PivotMarker2D/Label

func pop(text: String, pop_position: Vector2) -> void:
	global_position = pop_position
	label.text = text
	animation_player.play("pop")

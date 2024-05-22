class_name Level
extends Node2D

@onready var player = $PlayerCharacter2D
@onready var fade = $CanvasLayer/ColorRect/AnimationPlayer


func _ready():
	fade.play("fade_in")


func _on_player_character_2d_died():
	get_tree().reload_current_scene()

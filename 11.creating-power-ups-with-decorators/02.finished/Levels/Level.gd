class_name Level
extends Node2D

@onready var player = $PlayerCharacter2D
@onready var fade = $CanvasLayer/ColorRect/AnimationPlayer


func _ready():
	player.global_position = find_child(TeleportData.target_portal_name).global_position
	player.fade_in()
	fade.play("fade_in")
	PowerUps.player = player


func _on_player_character_2d_died():
	get_tree().reload_current_scene()


func _on_door_opened() -> void:
	player.fade_out()
	fade.play("fade_out")

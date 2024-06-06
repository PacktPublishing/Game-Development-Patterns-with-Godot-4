extends Node2D

signal opened
signal closed

@export_file("*.tscn") var target_scene = "res://Levels/Level.tscn"

@onready var animation_player = $AnimationPlayer


func _ready() -> void:
	set_process_unhandled_input(false)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		load_next_scene()


func load_next_scene(next_scene = target_scene):
	animation_player.play("open")
	opened.emit()
	await animation_player.animation_finished
	animation_player.play("close")
	await animation_player.animation_finished
	closed.emit()
	get_tree().change_scene_to_file(next_scene)


func _on_area_2d_area_entered(area: Area2D) -> void:
	set_process_unhandled_input(true)


func _on_area_2d_area_exited(area: Area2D) -> void:
	set_process_unhandled_input(false)

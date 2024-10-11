extends Control

const CONTROL_SETTINGS_FILE_PATH = "user://control_settings.json"

@export var background_music: AudioStream

@onready var fade := $CanvasLayer/ColorRect/AnimationPlayer

func _ready():
	find_child("RemapButton").grab_focus()
	fade.play("fade_in")

	BackgroundMusic.play(background_music)


func _on_back_button_pressed():
	save_input_settings()
	fade.play("fade_out")
	await fade.animation_finished
	get_tree().change_scene_to_file("res://Screens/MainMenu/MainMenu.tscn")


func save_input_settings():
	var file = FileAccess.open(CONTROL_SETTINGS_FILE_PATH, FileAccess.WRITE)
	var dictionary = {}
	for child in $RemappingControl/VBoxContainer.get_children():
		var action = child.get_child(1).binding_action
		dictionary[action] = InputMap.action_get_events(action)[0].physical_keycode
	file.store_string(JSON.stringify(dictionary))

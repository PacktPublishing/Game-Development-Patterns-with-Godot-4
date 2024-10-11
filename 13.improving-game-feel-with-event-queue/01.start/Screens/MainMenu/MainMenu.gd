extends Control

const CONTROL_SETTINGS_FILE_PATH = "user://control_settings.json"

@export_file("*.tscn") var start_scene_path = "res://Levels/Level1.tscn"
@export_file("*.tscn") var controls_scene_path = "res://Interface/InputRemap/InputRemap.tscn"

@export var background_music: AudioStream


func _ready():
	$VBoxContainer/StartButton.grab_focus()
	load_input_map()
	
	BackgroundMusic.play(background_music)


func load_input_map():
	if not FileAccess.file_exists(CONTROL_SETTINGS_FILE_PATH):
		return

	var file = FileAccess.open(CONTROL_SETTINGS_FILE_PATH, FileAccess.READ)
	var dictionary = JSON.parse_string(file.get_as_text())
	for action in dictionary.keys():
		var event = InputEventKey.new()
		event.physical_keycode = dictionary[action]
		InputMap.action_erase_events(action)
		InputMap.action_add_event(action, event)


func _on_start_button_pressed():
	get_tree().change_scene_to_file(start_scene_path)


func _on_quit_button_pressed():
	get_tree().quit()


func _on_controls_button_pressed():
	get_tree().change_scene_to_file(controls_scene_path)

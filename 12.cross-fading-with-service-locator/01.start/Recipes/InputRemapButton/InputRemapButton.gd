extends Button

@export var binding_action = "attack"


func _ready():
	set_process_input(false)
	for event in InputMap.action_get_events(binding_action):
		if event is InputEventKey:
			text = event.as_text_physical_keycode()
			break


func _toggled(toggled_on):
	if toggled_on:
		release_focus()
		set_process_input(true)
	else:
		set_process_input(false)
		grab_focus()


func _input(event):
	if not event is InputEventMouse:
		InputMap.action_erase_events(binding_action)
		InputMap.action_add_event(binding_action, event)
		text = event.as_text_physical_keycode()
		button_pressed = false

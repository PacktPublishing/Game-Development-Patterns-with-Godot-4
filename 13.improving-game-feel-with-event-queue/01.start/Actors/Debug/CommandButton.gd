extends Button

@export_node_path("Command") var command_path
@onready var command: Command = get_node(command_path)


func _on_button_down() -> void:
	command.execute()


func _on_button_up() -> void:
	command.unexecute()

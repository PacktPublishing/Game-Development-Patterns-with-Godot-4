extends Command
class_name CommandDecorator

@onready var timer := $Timer

var decorated_command: Command


func execute() -> void:
	decorated_command.execute()


func unexecute() -> void:
	decorated_command.unexecute()


func add_decoration(command: Command) -> void:
	decorated_command = command
	receiver = decorated_command.receiver
	timer.start()


func remove_decoration() -> void:
	pass


func _on_timer_timeout() -> void:
	remove_decoration()

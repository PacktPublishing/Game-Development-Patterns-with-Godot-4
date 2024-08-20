extends Node


var commands: Node
var command: BumpingPigCommand

func _on_jump_button_pressed() -> void:
	command = commands.get_node("JumpCommand")
	command.execute()


func _on_move_left_button_pressed() -> void:
	command = commands.get_node("MoveLeftCommand")
	command.execute()


func _on_move_right_button_pressed() -> void:
	command = commands.get_node("MoveRightCommand")
	command.execute()


func _on_stop_button_pressed() -> void:
	command = commands.get_node("StopCommand")
	command.execute()


func _on_attack_button_pressed() -> void:
	command = commands.get_node("AttackCommand")
	command.execute()


func _on_bumping_enemy_2d_bumped() -> void:
	command = commands.get_node("TurnCommand")
	command.execute()


func _on_turn_button_pressed() -> void:
	command = commands.get_node("TurnCommand")
	command.execute()


func _on_throw_bomb_button_pressed() -> void:
	command = commands.get_node("ThrowCommand")
	command.execute()

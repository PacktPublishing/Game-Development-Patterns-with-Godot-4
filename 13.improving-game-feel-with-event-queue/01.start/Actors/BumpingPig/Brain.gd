extends Node
class_name BumpingPigBrain

@export_node_path("BumpingPig") var actor_path
@onready var actor = get_node(actor_path)

@export_node_path("Node") var commands_path
@onready var commands := get_node(commands_path)

var interaction_strategy: InteractionStrategy

@onready var attack_command: Command = commands.get_node("AttackCommand")
@onready var jump_command: Command = commands.get_node("JumpCommand")
@onready var pick_command: Command = commands.get_node("PickCommand")
@onready var throw_command: Command = commands.get_node("ThrowCommand")
@onready var turn_left_command: Command = commands.get_node("TurnLeftCommand")
@onready var turn_right_command: Command = commands.get_node("TurnRightCommand")
@onready var move_left_command: Command = commands.get_node("MoveLeftCommand")
@onready var move_right_command: Command = commands.get_node("MoveRightCommand")
@onready var stop_command: Command = commands.get_node("StopCommand")
@onready var light_cannon_command: Command = commands.get_node("LightCannonCommand")

@onready var bump_left_queue := [turn_right_command, move_right_command]
@onready var bump_right_queue := [turn_left_command, move_left_command]


func _on_bumping_enemy_2d_bumped() -> void:
	if actor.body.direction > 0:
		for command in bump_right_queue:
			command.execute()
	else:
		for command in bump_left_queue:
			command.execute()


func _on_vision_area_2d_area_entered(area: Area2D) -> void:
	interaction_strategy = area.interaction_strategy
	interaction_strategy.context = self
	interaction_strategy.interacted_area = area
	interaction_strategy.execute()


func _on_throw_vision_area_2d_area_entered(area: Area2D) -> void:
	if not area.is_in_group("player"):
		return
	var throw_direction: int = sign(actor.body.global_position.direction_to(area.global_position).x)
	throw_command.throw_force.x = throw_command.impulse.x * throw_direction
	
	throw_command.execute()
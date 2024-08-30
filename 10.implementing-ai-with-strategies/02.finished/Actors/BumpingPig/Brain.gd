extends Node
class_name BumpingPigBrain

@export_node_path("BumpingPig") var actor_path
@onready var actor = get_node(actor_path)

@export_node_path("Node") var commands_path
@onready var commands := get_node(commands_path)

@export_node_path("Node") var strategies_path
@onready var strategies := get_node(strategies_path)

var interaction_strategy: InteractionStrategy

@onready var attack_command: Command = commands.get_node("AttackCommand")
@onready var jump_command: Command = commands.get_node("JumpCommand")
@onready var pick_command: Command = commands.get_node("PickCommand")
@onready var throw_command: Command = commands.get_node("ThrowCommand")
@onready var turn_left_command: Command = commands.get_node("TurnLeftCommand")
@onready var turn_right_command: Command = commands.get_node("TurnRightCommand")
@onready var move_left_command: Command = commands.get_node("MoveLeftCommand")
@onready var move_right_command: Command = commands.get_node("MoveRightCommand")

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
	interaction_strategy = strategies.get_node(area.interaction_strategy_name)
	interaction_strategy.interacted_area = area
	interaction_strategy.execute()
	actor.vision_area.area_entered.disconnect(_on_vision_area_2d_area_entered)


func _on_throw_vision_area_2d_area_entered(area: Area2D) -> void:
	actor.find_child("ThrowVisionArea2D").area_entered.disconnect(_on_throw_vision_area_2d_area_entered)
	var throw_direction: int = actor.body.global_position.direction_to(area.global_position).x
	var throw_force := Vector2(600 * throw_direction, -600)
	
	throw_command.throw_force = throw_force
	throw_command.execute()
	actor.vision_area.area_entered.connect(_on_vision_area_2d_area_entered)

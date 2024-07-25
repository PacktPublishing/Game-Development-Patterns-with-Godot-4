extends Node2D
class_name BumpingPig

@export var initial_direction = -1
@export var max_health = 3

@onready var body = $BumpingEnemy2D
@onready var vision_area = $BumpingEnemy2D/Sprites/VisionArea2D
@onready var animation_tree = $AnimationTree
@onready var sprites = $BumpingEnemy2D/Sprites
@onready var score = $BumpingEnemy2D/ScorePoint
@onready var loots = $BumpingEnemy2D/Loots

@onready var health = max_health
@onready var state: BumpingPigState : set = set_state


func _ready() -> void:
	for state in $States.get_children():
		state.context = self
	set_state(find_child("IdleState"))
	body.direction = initial_direction


func set_state(new_state: BumpingPigState) -> void:
	print(new_state.name)
	if state:
		state.exit()
		new_state.previous_state = state
	state = new_state
	state.enter()


func _on_hurt_area_2d_hurt(damage: int) -> void:
	health -= damage
	state.get_hurt()

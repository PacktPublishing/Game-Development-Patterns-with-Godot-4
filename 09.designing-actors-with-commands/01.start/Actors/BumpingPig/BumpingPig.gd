extends Node2D
class_name BumpingPig

@export var initial_direction = -1
@export var max_health = 3

@onready var body = $BumpingEnemy2D
@onready var bomb_vision_area = $BumpingEnemy2D/Sprites/BombVisionArea2D
@onready var animation_tree = $AnimationTree
@onready var sprites = $BumpingEnemy2D/Sprites
@onready var score = $BumpingEnemy2D/ScorePoint
@onready var loots = $BumpingEnemy2D/Loots
@onready var bomb_factory = $BumpingEnemy2D/Sprites/BombFactory

@onready var health = max_health
@onready var state: BumpingPigState : set = set_state


func _ready() -> void:
	for state in $States.get_children():
		state.context = self
	set_state(find_child("IdleState"))
	
	move(initial_direction)


func set_state(new_state: BumpingPigState) -> void:
	if state:
		state.exit()
		new_state.previous_state = state
	state = new_state
	state.enter()


func _on_hurt_area_2d_hurt(damage: int) -> void:
	state.get_hurt(damage)


func move(direction: int) -> void:
	state.move(direction)


func stop() -> void:
	state.stop()


func throw(throw_force: Vector2) -> void:
	state.throw(throw_force)


func jump() -> void:
	state.jump()


func cancel_jump() -> void:
	state.cancel_jump()


func pick_bomb(bomb: Bomb) -> void:
	state.pick_bomb(bomb)


func attack() -> void:
	state.attack()


func turn(direction: int) -> void:
	state.turn(direction)


func _on_bumping_enemy_2d_bumped() -> void:
	turn(body.direction)

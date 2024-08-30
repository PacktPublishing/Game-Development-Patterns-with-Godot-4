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
@onready var throwable_factory = $BumpingEnemy2D/Sprites/ThrowableObjectFactory

@onready var health = max_health
@onready var state: BumpingPigState : set = set_state

var picking_object_type := ""

func _ready() -> void:
	for state in $States.get_children():
		state.context = self
	for command in $Commands.get_children():
		command.receiver = self
	for strategy in $Strategies.get_children():
		strategy.context = $Brain
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


func pick(object: Node2D) -> void:
	state.pick(object)


func attack() -> void:
	state.attack()


func turn(direction: int) -> void:
	state.turn(direction)

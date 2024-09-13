extends Resource
class_name Stats

@export var gravity := 2000.0 : set = set_gravity, get = get_gravity
@export var speed := 500.0 : set = set_speed, get = get_speed
@export var jump_strength := 800.0 : set = set_jump_strength, get = get_jump_strength
@export var max_lives := 3 : set = set_max_lives, get = get_max_lives
@export var lives := 0 : set = set_lives, get = get_lives
@export var attack_strength := 1 : set = set_attack_strength, get = get_attack_strength
@export var wall_jump_strength := Vector2(800, -800) : set = set_wall_jump_strength, get = get_wall_jump_strength
@export var slide_gravity_factor := 0.2 : set = set_slide_gravity_factor, get = get_slide_gravity_factor
@export var horizontal_gravity := 8000 : set = set_horizontal_gravity, get = get_horizontal_gravity
@export var max_slide_speed := 200 : set = set_max_slide_speed, get = get_max_slide_speed


func set_gravity(new_gravity: float) -> void:
	gravity = new_gravity


func get_gravity() -> float:
	return gravity


func set_speed(new_speed: float) -> void:
	speed = new_speed


func get_speed() -> float:
	return speed


func set_jump_strength(new_jump_strength: float) -> void:
	jump_strength = new_jump_strength


func get_jump_strength() -> float:
	return jump_strength


func set_max_lives(new_max_lives: int) -> void:
	max_lives = new_max_lives


func get_max_lives() -> int:
	return max_lives


func set_lives(new_lives) -> void:
	lives = new_lives


func get_lives() -> int:
	return lives


func set_attack_strength(new_attack_strength: int) -> void:
	attack_strength = new_attack_strength


func get_attack_strength() -> int:
	return attack_strength


func set_wall_jump_strength(new_wall_jump_strength: Vector2) -> void:
	wall_jump_strength = new_wall_jump_strength


func get_wall_jump_strength() -> Vector2:
	return wall_jump_strength


func set_slide_gravity_factor(new_slide_gravity_factor: float) -> void:
	slide_gravity_factor = new_slide_gravity_factor


func get_slide_gravity_factor() -> float:
	return slide_gravity_factor


func set_horizontal_gravity(new_horizontal_gravity: float) -> void:
	horizontal_gravity = new_horizontal_gravity


func get_horizontal_gravity() -> float:
	return horizontal_gravity


func set_max_slide_speed(new_max_slide_speed: float) -> void:
	max_slide_speed = new_max_slide_speed


func get_max_slide_speed() -> float:
	return max_slide_speed

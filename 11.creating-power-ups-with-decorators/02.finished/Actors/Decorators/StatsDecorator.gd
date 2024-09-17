extends Stats
class_name StatsDecorator

var decorated_stats: Stats


func set_gravity(new_gravity: float) -> void:
	if not decorated_stats:
		super(new_gravity)
	else:
		decorated_stats.gravity = new_gravity


func get_gravity() -> float:
	return decorated_stats.gravity if decorated_stats else super()


func set_speed(new_speed: float) -> void:
	if not decorated_stats:
		super(new_speed)
	else:
		decorated_stats.speed = new_speed


func get_speed() -> float:
		return decorated_stats.speed if decorated_stats else super()


func set_jump_strength(new_jump_strength: float) -> void:
	if not decorated_stats:
		super(new_jump_strength)
	else:
		decorated_stats.jump_strength = new_jump_strength


func get_jump_strength() -> float:
	return decorated_stats.jump_strength if decorated_stats else super()


func set_max_lives(new_max_lives: int) -> void:
	if not decorated_stats:
		super(new_max_lives)
	else:
		decorated_stats.max_lives = new_max_lives


func get_max_lives() -> int:
	return decorated_stats.max_lives if decorated_stats else super()


func set_lives(new_lives) -> void:
	if not decorated_stats:
		super(new_lives)
	else:
		decorated_stats.lives = new_lives


func get_lives() -> int:
	return decorated_stats.lives if decorated_stats else super()


func set_attack_strength(new_attack_strength: int) -> void:
	if not decorated_stats:
		super(new_attack_strength)
	else:
		decorated_stats.attack_strength = new_attack_strength


func get_attack_strength() -> int:
	return decorated_stats.attack_strength if decorated_stats else super()


func set_wall_jump_strength(new_wall_jump_strength: Vector2) -> void:
	if not decorated_stats:
		super(new_wall_jump_strength)
	else:
		decorated_stats.wall_jump_strength = new_wall_jump_strength


func get_wall_jump_strength() -> Vector2:
	return decorated_stats.wall_jump_strength if decorated_stats else super()


func set_slide_gravity_factor(new_slide_gravity_factor: float) -> void:
	if not decorated_stats:
		super(new_slide_gravity_factor)
	else:
		decorated_stats.slide_gravity_factor = new_slide_gravity_factor


func get_slide_gravity_factor() -> float:
	return decorated_stats.slide_gravity_factor if decorated_stats else super()


func set_horizontal_gravity(new_horizontal_gravity: float) -> void:
	if not decorated_stats:
		super(new_horizontal_gravity)
	else:
		decorated_stats.horizontal_gravity = new_horizontal_gravity


func get_horizontal_gravity() -> float:
	return decorated_stats.horizontal_gravity if decorated_stats else super()


func set_max_slide_speed(new_max_slide_speed: float) -> void:
	if not decorated_stats:
		super(new_max_slide_speed)
	else:
		decorated_stats.max_slide_speed = new_max_slide_speed


func get_max_slide_speed() -> float:
	return decorated_stats.max_slide_speed if decorated_stats else super()

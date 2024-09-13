extends StatsDecorator
class_name JumpStatsDecorator

@export var jump_multiplier := 1.5


func get_jump_strength() -> float:
	return decorated_stats.jump_strength * jump_multiplier if decorated_stats else jump_strength

extends StatsDecorator
class_name SpeedStatsDecorator

@export var speed_multiplier := 1.1


func get_speed() -> float:
	return decorated_stats.speed * speed_multiplier if decorated_stats else speed_multiplier

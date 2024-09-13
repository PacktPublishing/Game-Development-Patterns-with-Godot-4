extends StatsDecorator
class_name AttackStatsDecorator

@export var bonus_attack := 3

func get_attack_strength() -> int:
	return decorated_stats.attack_strength + bonus_attack if decorated_stats else attack_strength

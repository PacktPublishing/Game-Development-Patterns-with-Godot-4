extends Node
class_name PowerUps

@onready var timer := $Timer
var player: KingPigPlayer2D

var decorators_list: Array[StatsDecorator] = []


func add_power_up(decorator: StatsDecorator) -> void:
	decorator.decorated_stats = player.stats
	player.stats = decorator
	decorators_list.append(decorator)
	timer.start()


func remove_power_up() -> void:
	if decorators_list.size() > 0:
		var decorator := decorators_list.pop_back() as StatsDecorator
		player.stats = decorator.decorated_stats
	else:
		timer.stop()


func _on_timer_timeout() -> void:
	remove_power_up()

extends Node

@onready var timer := $Timer
var player: KingPigPlayer2D


func add_power_up(decorator: StatsDecorator) -> void:
	decorator.decorated_stats = player.stats
	player.stats = decorator
	timer.start()


func remove_power_up() -> void:
	var decorator: Stats = player.stats
	if decorator is StatsDecorator:
		player.stats = decorator.decorated_stats
	else:
		timer.stop()


func _on_timer_timeout() -> void:
	remove_power_up()

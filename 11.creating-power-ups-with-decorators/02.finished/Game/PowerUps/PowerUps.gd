extends Node

var player: KingPigPlayer2D


func add_power_up(decorator_scene: PackedScene) -> void:
	var decorator = decorator_scene.instantiate()

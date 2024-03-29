extends "res://Objects/Crate/Crate.gd"


@export var loot_scene := preload("res://Objects/Diamond/Diamond.tscn")
@export_range(0.0, 1.0) var drop_rate := 0.3


func drop() -> void:
	var luck := randf()
	
	if luck >= drop_rate:
		var loot: Node2D = loot_scene.instantiate()
		loot.global_position = global_position
		find_parent("Level").find_child("Diamonds").add_child(loot)


func shatter():
	drop()
	super()

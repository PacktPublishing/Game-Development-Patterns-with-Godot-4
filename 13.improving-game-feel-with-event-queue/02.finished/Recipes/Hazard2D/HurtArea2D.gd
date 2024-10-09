extends Area2D

signal hurt(damage)

@export var defense = 0
@export_enum("Not Player", "Player", "Neutral") var team = 0


func get_hurt(hit_area):
	if not hit_area.team == team:
		hurt.emit(max(0, hit_area.damage - defense))

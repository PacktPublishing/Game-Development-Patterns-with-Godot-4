extends Area2D

signal hit_landed(damage)

@export var damage = 1
@export_enum("Not Player", "Player", "Neutral") var team = 0


func hit(hurt_area):
	if not hurt_area.team == team:
		hit_landed.emit(max(0, damage - hurt_area.defense))
		hurt_area.get_hurt(self)


func _on_area_entered(area2D):
	hit(area2D)

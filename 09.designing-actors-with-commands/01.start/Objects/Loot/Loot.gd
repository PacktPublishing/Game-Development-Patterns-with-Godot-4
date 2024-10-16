extends Marker2D
class_name Loot

@export_range(0.0, 1.0) var drop_rate = 0.3

@onready var factory = $Node2DFactory


func drop():
	var luck = randf_range(0.0, 1.0)
	if luck <= drop_rate:
		factory.create()

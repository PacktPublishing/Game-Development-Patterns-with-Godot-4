extends "res://Objects/Crate/Crate.gd"


func drop() -> void:
	for loot in $Loots.get_children():
		loot.drop()
	

func shatter():
	drop()
	super()

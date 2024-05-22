extends "res://Actors/BumpingPig/BumpingPig.gd"


@onready var loot = $BumpingEnemy2D/Loot2D


func die():
	loot.drop()
	super()

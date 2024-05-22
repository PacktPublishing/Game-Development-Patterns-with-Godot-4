extends "res://Objects/Crate/Crate.gd"


@onready var loot = $CharacterBody2D/Loot2D


func shatter():
	loot.drop()
	super()

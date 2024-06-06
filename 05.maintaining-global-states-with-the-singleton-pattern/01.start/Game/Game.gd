extends Node

@onready var score_label = $InterfaceCanvasLayer/ScoreLabel


func _ready():
	update_score_label()


func update_score_label():
	score_label.text = "%s"

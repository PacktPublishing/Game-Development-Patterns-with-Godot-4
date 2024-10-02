extends Node2D

@export var amount := 100

@onready var factory = $Node2DFactory


func increase_score(_score := amount, _pop_score = true):
	Score.current += _score
	var game = find_parent("Game")
	if game:
		game.update_score_label()
	if _pop_score:
		pop_label(str(_score))


func pop_label(label_text: String) -> void:
	var pop_label = factory.create()
	pop_label.pop(label_text, global_position)

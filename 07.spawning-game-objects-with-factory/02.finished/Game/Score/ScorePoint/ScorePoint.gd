extends Node2D

@export var amount = 100

@onready var factory = $Node2DFactory


func increase_score(_score = amount, _pop_score = true):
	Score.current += _score
	var game = find_parent("Game")
	if game:
		game.update_score_label()
	if _pop_score:
		pop_label()


func pop_label():
	var pop_label = factory.create()
	pop_label.pop(str(amount), global_position)

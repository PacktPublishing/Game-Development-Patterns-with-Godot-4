extends Node2D

@export var amount = 100
@export var pop_label_scene = preload("res://Interface/PopLabel/PopLabel.tscn")

@onready var factory = $GameObjectFactory


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

extends Node

@onready var score_label = $InterfaceCanvasLayer/ScoreLabel
@onready var player = $WorldCanvasLayer/Level/PlayerCharacter2D
@onready var lives_interface = $InterfaceCanvasLayer/LivesTextureRect


func _ready():
	update_score_label()
	setup_lives_interface()


func setup_lives_interface():
	player.lives_decreased.connect(lives_interface._on_player_lives_decreased)
	player.lives_increased.connect(lives_interface._on_player_lives_increased)


func update_score_label():
	score_label.text = "%s" % Score.current

extends TextureRect


@onready var lives_container = $LivesBoxContainer
@onready var lives = lives_container.get_child_count()


func hit_hearts():
	var heart = lives_container.get_child(lives - 1)
	heart.hit()
	lives -= 1


func recover_hearts():
	var heart = lives_container.get_child(lives - 1)
	heart.recover
	lives += 1


func _on_player_lives_increased(amount):
	for i in amount:
		recover_hearts()


func _on_player_lives_decreased(amount):
	for i in amount:
		hit_hearts()

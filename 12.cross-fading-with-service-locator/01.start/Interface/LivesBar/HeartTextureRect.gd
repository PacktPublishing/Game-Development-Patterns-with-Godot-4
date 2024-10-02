extends TextureRect


@onready var animation_player = $AnimationPlayer


func hit():
	animation_player.play("hit")


func recover():
	animation_player.play("recover")

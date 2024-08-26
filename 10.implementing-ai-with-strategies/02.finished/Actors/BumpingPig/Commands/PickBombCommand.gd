extends Command


var bomb: Bomb


func execute() -> void:
	receiver.pick_bomb(bomb)

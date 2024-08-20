extends BumpingPigCommand


func execute() -> void:
	receiver.state = receiver.find_child("AttackState")

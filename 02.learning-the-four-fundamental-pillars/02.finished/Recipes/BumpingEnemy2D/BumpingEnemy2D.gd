class_name BumpingEnemy2D
extends BasicMovingCharacter2D


func _physics_process(delta):
	super(delta)
	if is_on_wall():
		bump()


func bump():
	direction *= -1

class_name BumpingEnemy2D
extends BasicMovingCharacter2D

signal bumped

func _physics_process(delta):
	super(delta)
	if is_on_wall():
		bumped.emit()

class_name BumpingEnemy2D
extends BasicMovingCharacter2D

signal bumped

func _physics_process(delta):
	super(delta)
	if is_on_wall():
		direction = get_wall_normal().x
		bumped.emit()

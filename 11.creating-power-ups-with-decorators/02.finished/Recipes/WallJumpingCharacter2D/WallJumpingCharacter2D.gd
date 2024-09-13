class_name WallJumpingCharacter2D
extends PassThroughCharacter2D

enum WallStates{NOT_ON_WALL, WALL_SLIDING, WALL_JUMPING}


@onready var wall_detector = $WallDetectorRayCast2D

var wall_state = WallStates.NOT_ON_WALL


func _physics_process(delta):
	wall_detector.enabled = not direction == 0
	if direction < 0:
		wall_detector.scale.x = -1
	else:
		wall_detector.scale.x = 1
	
	match wall_state:
		WallStates.NOT_ON_WALL:
			if wall_detector.wall_colliding and is_on_wall_only():
				if direction == -get_wall_normal().x:
					wall_state = WallStates.WALL_SLIDING
			super(delta)
			return
		WallStates.WALL_SLIDING:
			velocity.y += (stats.gravity * delta)
			if not direction == 0 and wall_detector.wall_colliding and is_on_wall_only():
				if direction == -get_wall_normal().x:
					velocity.y += (stats.gravity * delta) * stats.slide_gravity_factor
			if not direction == -get_wall_normal().x:
				wall_state = WallStates.NOT_ON_WALL
			if is_on_floor() or not wall_detector.wall_colliding:
				wall_state = WallStates.NOT_ON_WALL
			velocity.y = min(velocity.y, stats.max_slide_speed)
		WallStates.WALL_JUMPING:
			velocity.y += stats.gravity * delta
			velocity.x += (stats.horizontal_gravity * delta) * direction
			if wall_detector.wall_colliding and velocity.y > 0:
				wall_state = WallStates.WALL_SLIDING
			if is_on_floor() or not wall_detector.wall_colliding:
				wall_state = WallStates.NOT_ON_WALL
	move_and_slide()


func jump():
	if wall_state == WallStates.WALL_SLIDING:
		wall_jump()
	elif wall_state == WallStates.NOT_ON_WALL:
		super()


func wall_jump():
	velocity.y = stats.wall_jump_strength.y
	velocity.x = stats.wall_jump_strength.x * -direction
	wall_state = WallStates.WALL_JUMPING

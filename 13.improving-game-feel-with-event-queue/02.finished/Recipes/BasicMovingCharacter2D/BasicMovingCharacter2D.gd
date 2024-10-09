class_name BasicMovingCharacter2D
extends CharacterBody2D

signal direction_changed(new_direction: int)
signal jumped

@export var stats: Stats

@export var direction = 0:
	set(new_direction):
		direction = new_direction
		direction_changed.emit(new_direction)


func _physics_process(delta):
	velocity.y += stats.gravity * delta
	velocity.x = direction * stats.speed
	move_and_slide()


func move(_direction: int) -> void:
	direction = _direction


func stop() -> void:
	direction = 0


func jump() -> void:
	if is_on_floor():
		velocity.y = -stats.jump_strength
		jumped.emit()


func cancel_jump() -> void:
	if not is_on_floor() and velocity.y < 0.0:
		velocity.y = 0.0

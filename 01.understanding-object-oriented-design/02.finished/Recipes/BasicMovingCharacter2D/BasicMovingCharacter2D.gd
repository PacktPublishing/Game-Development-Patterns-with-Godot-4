class_name BasicMovingCharacter2D
extends CharacterBody2D

@export var speed = 500.0
@export var direction = 0
@export var gravity = 2000.0
@export var jump_strength = 800.0


func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = direction * speed
	move_and_slide()


func jump():
	if is_on_floor():
		velocity.y = -jump_strength


func cancel_jump():
	if not is_on_floor() and velocity.y < 0.0:
		velocity.y = 0.0

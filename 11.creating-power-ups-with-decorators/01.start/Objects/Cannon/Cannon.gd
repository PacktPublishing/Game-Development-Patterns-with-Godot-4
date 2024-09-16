extends Node2D
class_name Cannon


@export var shooting_speed := 600.0

@onready var cannon_ball_factory := $CannonBallFactory
@onready var animaiton_player := $AnimationPlayer


func fire() -> void:
	var ball := cannon_ball_factory.create() as RigidBody2D
	var shooting_velocity := Vector2(shooting_speed, 0.0)
	ball.apply_impulse(shooting_velocity)

func shoot() -> void:
	animaiton_player.play("shoot")

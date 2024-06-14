extends Node2D

signal broke

@export var health = 3

@export var gravity = 4000

@onready var animation_player = $AnimationPlayer
@onready var body = $CharacterBody2D
@onready var ray = $CharacterBody2D/RayCast2D


func _physics_process(delta):
	if not ray.is_colliding():
		body.velocity.y += gravity * delta
	body.move_and_slide()


func _on_hurt_box_2d_hurt(damage):
	health -= damage
	if health < 1:
		broke.emit()
		animation_player.play("break")
	else:
		animation_player.play("hit")
	

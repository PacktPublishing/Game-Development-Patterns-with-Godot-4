extends Node2D

@export var initial_direction = -1
@export var max_health = 3

@onready var body = $BumpingEnemy2D
@onready var animation_player = $AnimationPlayer
@onready var sprites = $BumpingEnemy2D/Sprites
@onready var animated_sprites = $BumpingEnemy2D/Sprites/AnimatedSprite2D

@onready var health = max_health

enum STATES{RUN, IDLE, DEAD}

var state = STATES.RUN

func _ready():
	body.direction = initial_direction


func _physics_process(delta):
	match state:
		STATES.IDLE:
			animated_sprites.play("idle")
		STATES.RUN:
			animated_sprites.play("run")
		STATES.DEAD:
			body.direction = 0
	
	if body.direction > 0:
		sprites.scale.x = -1
	elif body.direction < 0:
		sprites.scale.x = 1


func die():
	animation_player.play("die")
	state = STATES.DEAD


func hit(damage):
	health -= damage
	if health >= 1:
		animation_player.play("hit")
	else:
		die()


func _on_hurt_area_2d_hurt(damage):
	hit(damage)


func _on_animated_sprite_2d_animation_finished():
	match animated_sprites.animation:
		"hit":
			state = STATES.RUN

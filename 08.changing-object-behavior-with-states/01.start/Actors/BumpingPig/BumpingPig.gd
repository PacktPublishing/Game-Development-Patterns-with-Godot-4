extends Node2D

@export var initial_direction = -1
@export var max_health = 3

@onready var body = $BumpingEnemy2D
@onready var animation_player = $AnimationPlayer
@onready var sprites = $BumpingEnemy2D/Sprites
@onready var animated_sprites = $BumpingEnemy2D/Sprites/AnimatedSprite2D
@onready var score = $BumpingEnemy2D/ScorePoint
@onready var loots = $BumpingEnemy2D/Loots

@onready var health = max_health

enum STATES{RUN, IDLE, HIT, DEAD, ATTACK}

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
		STATES.ATTACK:
			body.set_physics_process(false)
			animation_player.play("attack")
			await animation_player.animation_finished
			state = STATES.RUN
			body.set_physics_process(true)
		STATES.HIT:
			animation_player.play("hit")
			
	
	if body.direction > 0:
		sprites.scale.x = -1
	elif body.direction < 0:
		sprites.scale.x = 1


func die():
	for loot in loots.get_children():
		loot.drop()
	animation_player.play("die")
	state = STATES.DEAD


func hit(damage):
	health -= damage
	if health >= 1:
		score.increase_score()
		state = STATES.HIT
		await animation_player.animation_finished
		state = STATES.RUN
	else:
		score.increase_score()
		die()


func _on_hurt_area_2d_hurt(damage):
	hit(damage)


func _on_vision_area_2d_area_entered(area: Area2D) -> void:
	state = STATES.ATTACK


func _on_animation_player_animation_changed(old_name: StringName, new_name: StringName) -> void:
	var exclamation_balloon = $BumpingEnemy2D/Sprites/ExclamationBalloon
	exclamation_balloon.visible = new_name == "attack"

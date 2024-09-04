extends Player2D
class_name KingPigPlayer2D

signal died
signal lives_increased(amount)
signal lives_decreased(amount)

@export var lives = 3

@onready var animated_sprites = $Sprites/AnimatedSprite2D
@onready var sprites = $Sprites
@onready var current_lives = lives:
	set(value):
		value = clampi(value, 0, 3)
		if value > current_lives:
			lives_increased.emit(value - current_lives)
		elif value < current_lives:
			lives_decreased.emit(current_lives - value)
		current_lives = value
@onready var hit_box = $HitArea2D
@onready var animation_player = $AnimationPlayer

var fall_speed = 0.0

func _ready() -> void:
	for command in $Commands.get_children():
		command.receiver = self


func _physics_process(delta):
	super(delta)
	
	if direction > 0:
		sprites.scale.x = 1
		hit_box.scale.x = 1
	elif direction < 0:
		sprites.scale.x = -1
		hit_box.scale.x = -1
	
	var animation = animated_sprites.animation
	if is_on_floor():
		if not direction == 0.0:
			animation = "run"
		else:
			animation = "idle"
	else:
		if velocity.y >= 0.0:
			animation = "fall"
			fall_speed = velocity.y
		else:
			animation = "jump"
		
	if fall_speed > 0.0 and is_on_floor():
		animation = "ground"
	animated_sprites.play(animation)


func _unhandled_input(event):
	if event.is_action("attack"):
		if event.is_pressed():
			if is_on_floor():
				attack()
	super(event)


func attack() -> void:
	animation_player.play("attack")


func fade_in():
	animation_player.play("fade_in")


func fade_out():
	animation_player.play("fade_out")


func _on_animated_sprite_2d_animation_finished():
	if animated_sprites.animation == "ground":
		fall_speed = 0.0
		animated_sprites.play("idle")
	elif animated_sprites.animation == "hit":
		set_physics_process(true)
		set_process_unhandled_input(true)
		animated_sprites.play("idle")


func _on_hurt_area_2d_hurt(damage):
	set_physics_process(false)
	set_process_unhandled_input(false)
	direction = 0
	current_lives -= damage
	if current_lives < 1:
		animated_sprites.play("dead")
		animation_player.play("dead")
		await animation_player.animation_finished
		died.emit()
	else:
		animated_sprites.play("hit")

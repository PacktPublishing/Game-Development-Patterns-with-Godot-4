extends RigidBody2D

@onready var animation_player := $AnimationPlayer
@onready var timer := $VanishTimer
@onready var hit_area := $HitArea2D


func _on_hit_area_2d_hit_landed(damage: Variant) -> void:
	queue_free()


func _on_body_entered(body: Node) -> void:
	if timer.is_stopped():
		timer.start()


func _on_timer_timeout() -> void:
	animation_player.play("vanish")

extends Area2D
class_name AmbienceArea2D

@export var background_music: AudioStream

var previous_background_music: AudioStream


func _on_area_entered(area: Area2D) -> void:
	previous_background_music = BackgroundMusic.current_player.stream
	BackgroundMusic.play(background_music)


func _on_area_exited(area: Area2D) -> void:
	BackgroundMusic.play(previous_background_music)

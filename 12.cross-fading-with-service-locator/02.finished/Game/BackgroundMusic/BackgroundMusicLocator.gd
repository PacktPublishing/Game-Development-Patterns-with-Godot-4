extends Node
class_name BackgroundMusicLocator

@export var fade_time := 0.3
@onready var current_player: AudioStreamPlayer = $AudioStreamPlayer


func play(new_song: AudioStream, _fade_time: = fade_time) -> void:
	var new_player := AudioStreamPlayer.new()
	new_player.stream = new_song
	new_player.volume_db = linear_to_db(0.1)
	add_child(new_player)
	new_player.playing = true
	new_player.seek(current_player.get_playback_position())
	
	var target_volume = current_player.volume_db
	var tween := get_tree().create_tween()
	tween.tween_property(current_player, "volume_db", linear_to_db(0.0), _fade_time)
	tween.tween_property(new_player, "volume_db", target_volume, _fade_time)
	await tween.finished
	current_player.queue_free()
	current_player = new_player

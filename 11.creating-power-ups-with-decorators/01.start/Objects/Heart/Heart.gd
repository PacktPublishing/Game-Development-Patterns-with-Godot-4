extends Node2D

@export var heal_amount := 1


func heal(character: KingPigPlayer2D) -> void:
	character.current_lives += heal_amount
	

func _on_interactive_area_2d_area_entered(area: Area2D) -> void:
	var player = area.find_parent("PlayerCharacter2D")
	heal(player)
	queue_free()

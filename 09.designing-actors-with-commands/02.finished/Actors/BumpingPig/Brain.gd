extends Node


var actor


func _on_vision_area_2d_area_entered(area: Area2D) -> void:
	actor.attack()


func _on_bomb_vision_area_2d_area_entered(area: Area2D) -> void:
	actor.pick_bomb(area.owner)
	actor.find_child("ThrowVisionArea2D").area_entered.connect(_on_throw_vision_area_2d_area_entered)


func _on_throw_vision_area_2d_area_entered(area: Area2D) -> void:
	actor.find_child("ThrowVisionArea2D").area_entered.disconnect(_on_throw_vision_area_2d_area_entered)
	var direction: float = sign(actor.global_position.direction_to(area.global_position).x)
	
	var impulse := Vector2(600 * direction, -600)
	
	actor.throw(impulse)


func _on_bumping_enemy_2d_bumped() -> void:
	actor.turn()

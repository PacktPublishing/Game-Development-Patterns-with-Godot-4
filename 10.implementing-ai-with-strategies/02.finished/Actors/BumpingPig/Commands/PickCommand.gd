extends Command


var object: Node2D


func execute() -> void:
	receiver.vision_area.call_deferred("set_monitoring", false)
	receiver.pick(object)

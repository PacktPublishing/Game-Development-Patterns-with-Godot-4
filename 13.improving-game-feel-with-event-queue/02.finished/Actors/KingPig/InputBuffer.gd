extends Node
class_name InputBuffer

@export var expiration_time := 0.1

@onready var timer := $Timer

var event_queue: Array[InputEvent] = []


func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventKey:
		return
	if event.is_echo():
		return
	event_queue.append(event)
	if timer.is_stopped():
		timer.start(expiration_time)


func clear_queue() -> void:
	event_queue.clear()


func process_queue() -> void:
	event_queue.pop_front()


func process_by_action_name(input_event_action: String) -> InputEventKey:
	var event_index: int
	for index in range(event_queue.size()):
		if event_queue[index].is_action(input_event_action):
			event_index = index
			break
	return event_queue.pop_at(event_index)

func has_action(input_action_name: String) -> bool:
	var has_action := false
	for event in event_queue:
		if event.is_action(input_action_name):
			has_action = true
			break
	return has_action


func _on_timer_timeout() -> void:
	if event_queue.size() > 0:
		process_queue()

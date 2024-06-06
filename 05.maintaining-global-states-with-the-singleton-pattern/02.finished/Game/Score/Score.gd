extends Node

var current = 0:
	set(value):
		current = value
		if value > high:
			high = value

var high = 0


func reset():
	current = 0

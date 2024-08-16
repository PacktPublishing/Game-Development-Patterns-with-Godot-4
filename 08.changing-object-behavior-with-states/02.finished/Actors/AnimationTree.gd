extends AnimationTree


func set_condition(condition: StringName, value: bool) -> void:
	set("parameters/conditions/%s" % condition, value)


func enable_condition(condition: StringName) -> void:
	set_condition(condition, true)
	if get_owner().name == "BumpingPig2":
		print(condition, " enabled")


func disable_condition(condition:StringName) -> void:
	set_condition(condition, false)
	if get_owner().name == "BumpingPig2":
		print(condition, " disabled")

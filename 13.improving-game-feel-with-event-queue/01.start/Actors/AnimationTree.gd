extends AnimationTree

var condition_path := "parameters/conditions/%s"

func set_condition(condition: StringName, value: bool) -> void:
	set(condition_path % condition, value)


func enable_condition(condition: StringName) -> void:
	set_condition(condition, true)


func disable_condition(condition:StringName) -> void:
	set_condition(condition, false)

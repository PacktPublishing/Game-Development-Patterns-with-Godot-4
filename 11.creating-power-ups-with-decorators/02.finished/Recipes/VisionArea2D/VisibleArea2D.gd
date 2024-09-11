extends Area2D


@export_file("*InteractionStrategy.gd") var interaction_strategy_file

@onready var interaction_strategy: InteractionStrategy = load(interaction_strategy_file).new()

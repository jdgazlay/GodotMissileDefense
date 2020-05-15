extends Node2D

export(int) var rockets := 10 setget set_rockets


func set_rockets(value) -> void:
	rockets = value

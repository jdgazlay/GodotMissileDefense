extends Node2D

signal building_damaged(building)

onready var animation_player := $AnimationPlayer as AnimationPlayer

var building_names = [
	'Building1',
	'Building2',
	'Building3',
	'Building4',
	'Building5',
]

var buildings_damaged : = []


func building_damaged(building_name: String) -> void:
	if not building_name in buildings_damaged:
		animation_player.play(building_name + ' damaged')
		buildings_damaged.append(building_name)
		emit_signal("building_damaged", building_name)
	


func _on_Building1_area_entered(area: Area2D) -> void:
	building_damaged(building_names[0])


func _on_Building2_area_entered(area: Area2D) -> void:
	building_damaged(building_names[1])


func _on_Building3_area_entered(area: Area2D) -> void:
	building_damaged(building_names[2])


func _on_Building4_area_entered(area: Area2D) -> void:
	building_damaged(building_names[3])


func _on_Building5_area_entered(area: Area2D) -> void:
	building_damaged(building_names[4])

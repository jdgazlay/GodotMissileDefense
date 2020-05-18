extends Control

export(int) var rockets := 0 setget set_rockets
export(int) var level := 1 setget set_level

var rocket_levels = [10, 20, 35, 50]

# warning-ignore:unused_class_variable
var level_map = {
	1: {
		'spawn_timer_sec': 4,
		'spawn_rate': 1,
	},
	2: {
		'spawn_timer_sec': 4,
		'spawn_rate': 2,
	},
	3: {
		'spawn_timer_sec': 3,
		'spawn_rate': 2,
	},
	4: {
		'spawn_timer_sec': 3,
		'spawn_rate': 3,
	}
}

var buildings_damaged : = []

onready var level_label := $VBoxContainer/CenterContainer/LevelLabel as Label
onready var rocket_label := $VBoxContainer/CenterContainer2/RocketLabel as Label


func set_rockets(value) -> void:
	rockets = value
	rocket_label.text = str(rockets)

	for i in len(rocket_levels):
		if rockets < rocket_levels[i]:
			self.level = i + 1
			return


func set_level(value) -> void:
	level = value
	level_label.text = str(level)

func _on_City_building_damaged(building: String) -> void:
	buildings_damaged.append(building)

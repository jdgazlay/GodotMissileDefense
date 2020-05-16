extends Node2D

var spawn_timer: Timer
onready var rocket_spawners = $Spawners.get_children()
onready var city_targets = $City/targets.get_children()
onready var Rocket := preload("res://src/scenes/Rocket.tscn")
onready var stats = $Stats


func _ready() -> void:
	randomize()
	spawn_timer = Timer.new();
	spawn_timer.connect("timeout", self, "spawn_attack_rockets")
	add_child(spawn_timer)
	spawn_timer.start(2)


func spawn_attack_rockets() -> void:
	"""
	spawns random rockets with ground targets
	"""
	var spawn_timer_sec = stats.level_map[stats.level].spawn_timer_sec
	var spawn_rate = stats.level_map[stats.level].spawn_rate


	
	
	for i in spawn_rate:
		var spawner := rocket_spawners[randi() % len(rocket_spawners)] as Area2D
		var target := city_targets[randi() % len(city_targets)] as Area2D
		var rocket = Rocket.instance()
		rocket.target = target.global_position
		rocket.position = spawner.global_position
		rocket.set_collision_layer_bit(1, true)
		rocket.set_collision_mask_bit(0, true)
		rocket.get_node("Area2D").set_collision_layer_bit(1, true)
		rocket.get_node("Area2D").set_collision_mask_bit(0, true)
		add_child(rocket)

	stats.set_rockets(stats.rockets + spawn_rate)
	spawn_timer.start(stats.level_map[stats.level].spawn_timer_sec)
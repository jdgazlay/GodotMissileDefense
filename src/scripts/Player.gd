extends KinematicBody2D

onready var screen_size := get_viewport_rect().size
onready var turret = $turret
onready var gun_barrel = $turret/turret_body/Gun
var launch := false
onready var Rocket = preload("res://src/scenes/Rocket.tscn")
onready var animation_player := $AnimationPlayer as AnimationPlayer


func _physics_process(delta: float) -> void:
	turret.look_at(get_global_mouse_position())


func _process(delta):
	if Input.is_action_pressed("click"):
		launch_rocket()
		launch = false
	

func launch_rocket() -> void:
	var rocket = Rocket.instance()
	rocket.target = get_global_mouse_position()
	rocket.position = gun_barrel.global_position
	rocket.acceleration = 1000
	rocket.set_collision_layer_bit(0, 1)
	rocket.set_collision_mask_bit(1, 1)
	rocket.get_node("Area2D").set_collision_layer_bit(0, 1)
	rocket.get_node("Area2D").set_collision_mask_bit(1, 1)
	animation_player.play("Fire")
	get_tree().current_scene.add_child(rocket)
	rocket.look_at(rocket.target)
extends KinematicBody2D

var target: Vector2
export(int) var acceleration := 100
export(int) var max_speed := 100
var _velocity: Vector2
onready var Explosion = preload("res://Explosion.tscn")

func _physics_process(delta: float) -> void:
	look_at(target)
	_velocity = move_and_slide(_velocity)
	
	

func _process(delta: float) -> void:
	_velocity += position.direction_to(target) * acceleration * delta
	
	if global_position.distance_to(target) <= 20:
		explode()
	pass
	


func explode():
	var explosion = Explosion.instance()
	var animation = explosion.get_node("AnimationPlayer") as AnimationPlayer
	explosion.position = global_position
	get_tree().current_scene.add_child(explosion)
	queue_free()


func _on_Area2D_area_entered(area: Area2D) -> void:
	explode()

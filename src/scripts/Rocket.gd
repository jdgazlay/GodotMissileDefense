extends KinematicBody2D

var target: Vector2
export(int) var acceleration := 100
var _velocity: Vector2
onready var Explosion = preload("res://src/scenes/Explosion.tscn")

func _physics_process(_delta: float) -> void:
	look_at(target)
	_velocity = move_and_slide(_velocity)
	
	

func _process(delta: float) -> void:
	_velocity += position.direction_to(target) * acceleration * delta
	
	if global_position.distance_to(target) <= 20:
		explode()
	pass
	


func explode():
	var explosion = Explosion.instance()
	explosion.position = global_position
	get_tree().current_scene.add_child(explosion)
	queue_free()


func _on_Area2D_area_entered(_area: Area2D) -> void:
	call_deferred('explode')

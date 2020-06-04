extends Area2D

onready var particle : = $Particles2D as Particles2D

func _ready() -> void:
	set_collision_layer_bit(0, 1)
	set_collision_mask_bit(1, 1)
	particle.emitting = true;


func _on_AnimationPlayer_animation_finished(_anim_name: String) -> void:
	queue_free()

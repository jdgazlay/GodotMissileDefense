extends Node2D

onready var anim_player : = $AnimationPlayer as AnimationPlayer

func play_screen_shake() -> void:
	if not anim_player.is_playing():
		anim_player.play("screen_shake")

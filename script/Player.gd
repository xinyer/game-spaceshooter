extends KinematicBody2D


func _process(delta):
	global_position.x = lerp(global_position.x, get_viewport().get_mouse_position().x, 0.1)

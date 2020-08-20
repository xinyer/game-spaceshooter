extends KinematicBody2D


signal create_bullet(bullet, pos)

var bullet = preload("res://scene/Bullet.tscn")

func _process(delta):
	global_position.x = lerp(global_position.x, get_viewport().get_mouse_position().x, 0.1)
	pass

func _input(event):
	if event.is_action_pressed("shoot"):
		emit_signal("create_bullet", bullet, global_position)
	pass

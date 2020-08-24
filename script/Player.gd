extends Sprite


signal node_instance(bullet, pos)

var bullet = preload("res://scene/Bullet.tscn")
var destory_particles = preload("res://scene/PlayerDestoryParticles.tscn")


func _ready():
	Global.player_health = 3
	if Global.world != null:
		connect("node_instance", Global.world, "_node_instance")
	pass

func _exit_tree():
	Global.player_health = 0
	pass

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()
	
	if mouse_position.x < 0:
		mouse_position.x = 0
	elif mouse_position.x > 90:
		mouse_position.x = 90
	
	if mouse_position.y < 0:
		mouse_position.y = 0
	elif mouse_position.y > 160:
		mouse_position.y = 160
		
	global_position.x = lerp(global_position.x, mouse_position.x, 0.1)
	global_position.y = lerp(global_position.y, mouse_position.y, 0.1)
	pass


func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy"):
		AudioManager.play("Hit")
		Global.player_health -= 1
		$HitAnimationPlayer.play("hit")
		if (Global.player_health == 0):
			AudioManager.play("Explosion")
			emit_signal("node_instance", destory_particles, global_position)
			if Global.camera != null:
				Global.camera.small_shake()
			queue_free()
			get_tree().change_scene("res://scene/Main.tscn")
	pass


func _on_ShootTimer_timeout():
	emit_signal("node_instance", bullet, global_position)
	AudioManager.play("Shoot")
	pass

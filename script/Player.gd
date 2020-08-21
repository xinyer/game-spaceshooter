extends Sprite


signal create_bullet(bullet, pos)
signal create_player_destory_particles(destroy_paticles, position)

var bullet = preload("res://scene/Bullet.tscn")
var destory_particles = preload("res://scene/PlayerDestoryParticles.tscn")

func _ready():
	if Global.world != null:
		print("bbb")
		connect("create_player_destory_particles", Global.world, "_on_Create_player_destory_particle")
	pass

func _process(delta):
	global_position.x = lerp(global_position.x, get_viewport().get_mouse_position().x, 0.1)
	pass

func _input(event):
	if event.is_action_pressed("shoot"):
		emit_signal("create_bullet", bullet, global_position)
	pass


func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy"):
		emit_signal("create_player_destory_particles", destory_particles, global_position)
		queue_free()
	pass

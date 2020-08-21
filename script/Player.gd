extends Sprite


signal node_instance(bullet, pos)

var bullet = preload("res://scene/Bullet.tscn")
var destory_particles = preload("res://scene/PlayerDestoryParticles.tscn")

func _ready():
	if Global.world != null:
		connect("node_instance", Global.world, "_node_instance")
	pass

func _process(delta):
	global_position.x = lerp(global_position.x, get_viewport().get_mouse_position().x, 0.1)
	pass

func _input(event):
	if event.is_action_pressed("shoot"):
		emit_signal("node_instance", bullet, global_position)
	pass


func _on_HitBox_area_entered(area):
	if area.is_in_group("Enemy"):
		emit_signal("node_instance", destory_particles, global_position)
		queue_free()
	pass

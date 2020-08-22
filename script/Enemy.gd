extends Sprite

var speed = 40
var destory_particles = preload("res://scene/EnemyDestoryParticles.tscn")

signal node_instance(destroy_paticles, position)


func _ready():
	if Global.world != null:
		connect("node_instance", Global.world, "_node_instance")
	pass

func _process(delta):
	global_position.y += speed * delta
	pass


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Bullet") or area.is_in_group("Player"):
		AudioManager.play("Explosion")
		emit_signal("node_instance", destory_particles, global_position)
		queue_free()
	pass

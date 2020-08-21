extends Sprite

var speed = 40
var destory_particles = preload("res://scene/EnemyDestoryParticles.tscn")

signal create_enemy_destory_particles(destroy_paticles, position)


func _ready():
	if Global.world != null:
		connect("create_enemy_destory_particles", Global.world, "_on_Create_enemy_destory_particle")
	pass

func _process(delta):
	global_position.y += speed * delta
	pass


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Bullet") or area.is_in_group("Player"):
		emit_signal("create_enemy_destory_particles", destory_particles, global_position)
		queue_free()
	pass

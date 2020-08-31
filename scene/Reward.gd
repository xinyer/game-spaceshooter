extends Sprite

var speed = 40
var health = 5
var point = 100

var destory_particles = preload("res://scene/EnemyDestoryParticles.tscn")

signal node_instance(destroy_paticles, position)


func _ready():
	if Global.world != null:
		connect("node_instance", Global.world, "_node_instance")
	
#	if $BloodProgressBar != null:
#		$BloodProgressBar.max_value = health
	pass
	
	
func _process(delta):
	global_position.y += speed * delta
	$BloodProgressBar.value = health
	
	if global_position.y > 200:
		queue_free()
	pass


func _on_HitBox_area_entered(area):
	if area.is_in_group("Bullet") or area.is_in_group("Player"):
		health -= 1
		if health <= 0:
			AudioManager.play("Explosion")
			emit_signal("node_instance", destory_particles, global_position)
			if Global.camera != null:
				Global.camera.small_shake()
			Global.score += point
			queue_free()
	pass

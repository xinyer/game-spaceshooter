extends Sprite

var speed = 40


func _process(delta):
	global_position.y += speed * delta
	pass


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Bullet"):
		queue_free()
	pass

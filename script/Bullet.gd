extends Sprite


var speed = 100


func _process(delta):
	global_position.y -= speed * delta
	if global_position.y < 0:
		queue_free()
	pass


func _on_HitBox_area_entered(area):
	queue_free()
	pass

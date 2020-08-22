extends ParallaxBackground


export(int) var speed

var y_offset = 0

func _process(delta):
	y_offset += speed * delta
	set_scroll_offset(Vector2(0, y_offset))
	pass

extends Node2D


var enemy = preload("res://scene/Enemy.tscn")


func _on_Player_create_bullet(bullet, pos):
	var bullet_instance = bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = pos
	pass


func _on_EnemyTimer_timeout():
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.global_position = Vector2(rand_range(0, get_viewport_rect().size.x), 0)
	pass

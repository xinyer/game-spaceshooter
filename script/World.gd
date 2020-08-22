extends Node2D

var enemys = [preload("res://scene/Enemy1.tscn"), preload("res://scene/Enemy2.tscn"), preload("res://scene/Enemy3.tscn")]


func _ready():
	Global.world = self
	pass


func _exit_tree():
	Global.world = null
	pass

func _on_Player_create_bullet(bullet, pos):
	var bullet_instance = bullet.instance()
	add_child(bullet_instance)
	bullet_instance.global_position = pos
	pass


func _on_EnemyTimer_timeout():
	var index = randi() % enemys.size()
	var enemy_instance = enemys[index].instance()
	add_child(enemy_instance)
	enemy_instance.global_position = Vector2(rand_range(10, get_viewport_rect().size.x-10), 0)
	pass

func _node_instance(node, position):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = position
	pass

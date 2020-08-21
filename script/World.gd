extends Node2D


var enemy = preload("res://scene/Enemy.tscn")


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
	var enemy_instance = enemy.instance()
	add_child(enemy_instance)
	enemy_instance.global_position = Vector2(rand_range(0, get_viewport_rect().size.x), 0)
	pass

func _on_Create_enemy_destory_particle(destroy_paticles, position):
	var destory_particles_instance = destroy_paticles.instance()
	add_child(destory_particles_instance)
	destory_particles_instance.global_position = position
	pass


func _on_Create_player_destory_particles(destroy_paticles, position):
	var instance = destroy_paticles.instance()
	add_child(instance)
	instance.global_position = position
	pass

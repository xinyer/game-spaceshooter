extends Node


func play(_name: String):
	var sfx = find_node(_name)
	if sfx is AudioStreamPlayer:
		sfx.play()
	pass

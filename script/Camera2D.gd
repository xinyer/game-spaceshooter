extends Camera2D

func _ready():
	Global.camera = self
	pass


func _exit_tree():
	Global.camera = null
	pass	


func small_shake():
	$ScreenShake.start(0.1, 15, 4, 0)
	pass

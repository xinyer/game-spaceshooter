extends CanvasLayer

func _process(delta):
	$HealthSprite.frame = Global.player_health
	$ScoreLabel.text = str(Global.score)
	pass

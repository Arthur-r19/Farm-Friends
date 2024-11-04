extends Button

func _on_pressed():
	LevelManager.restartGame()
	GlobalLivesManager.restart_lives()

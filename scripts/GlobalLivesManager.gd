extends Node

var lives = 3

var GAME_OVER = "res://scenes/game_over_screen.tscn"

func loose_life():
	lives -= 1
	if(lives<=0):
		get_tree().change_scene_to_file(GAME_OVER)

func restart_lives():
	lives = 3

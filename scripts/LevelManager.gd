extends Node

var current_level = -1

# LEVELS
var LEVEL_0 = "res://scenes/level0.tscn"
var LEVEL_1 = "res://scenes/level1.tscn"
var LEVEL_2 = "res://scenes/level2.tscn"

func next_level():
	#print('parabens')
	current_level = (current_level + 1) % 3
	match current_level:
		0:
			get_tree().change_scene_to_file(LEVEL_0)
		1:
			get_tree().change_scene_to_file(LEVEL_1)
		2:
			get_tree().change_scene_to_file(LEVEL_2)

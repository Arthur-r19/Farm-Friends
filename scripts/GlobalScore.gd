extends Node
enum GameMode {EVEN, ODD}
var score = 0

var game_mode = GameMode.EVEN

func calc_score():
	var minutes_to_seconds = GlobalTimer.minutes * 60
	var seconds = minutes_to_seconds + GlobalTimer.seconds
	score += int((seconds/90.0) * 200)

func catch_apple(number):
	if number % 2 == game_mode:
		score += 50
	else:
		GlobalLivesManager.loose_life()

func restart_score():
	score = 0
	
func get_game_mode_string():
	match game_mode:
		GameMode.EVEN:
			return "PARES"
		GameMode.ODD:
			return "IMPARES"

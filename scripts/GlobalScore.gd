extends Node
var score = 0

func calc_score():
	var minutes_to_seconds = GlobalTimer.minutes * 60
	var seconds = minutes_to_seconds + GlobalTimer.seconds
	score += int((seconds/90.0) * 200)

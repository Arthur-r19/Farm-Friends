extends CanvasLayer
@onready var score: Label = %Score
@onready var mode: Label = %Mode


func _process(delta: float) -> void:
	score.text = "SCORE: " + str(GlobalScore.score) + " pts"
	mode.text = "COLETE APENAS AS MAÇÃS: " + GlobalScore.get_game_mode_string()
	load_lives()

	
func load_lives():
	$HBoxContainer2.size.x = GlobalLivesManager.lives * 64

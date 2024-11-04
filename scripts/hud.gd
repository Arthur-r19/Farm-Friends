extends CanvasLayer
@onready var score: Label = $HBoxContainer4/Score


func _ready() -> void:
	load_lives()

func _process(delta: float) -> void:
	score.text = "SCORE: " + str(GlobalScore.score) + " pts"
	if Input.is_action_just_pressed('reset'):
		_on_button_pressed()

func _on_button_pressed() -> void:
	GlobalPositions.reload()
	get_tree().reload_current_scene()
	GlobalLivesManager.loose_life()
	
func load_lives():
	$HBoxContainer2.size.x = GlobalLivesManager.lives * 64

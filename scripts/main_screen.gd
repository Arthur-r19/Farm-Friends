extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_normal_game_pressed() -> void:
	LevelManager.next_level()
	pass # Replace with function body.


func _on_bonus_game_pressed() -> void:
	LevelManager.bonus_level()
	pass # Replace with function body.

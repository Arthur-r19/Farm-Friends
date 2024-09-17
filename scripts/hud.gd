extends CanvasLayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed('reset'):
		_on_button_pressed()

func _on_button_pressed() -> void:
	GlobalPositions.reload()
	get_tree().reload_current_scene()

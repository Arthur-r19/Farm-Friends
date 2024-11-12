extends Label

@onready var timer: Timer = $Timer
var timeout_scene = load("res://scenes/time_over_screen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(int(timer.time_left)) + " s"


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(timeout_scene)
	pass

extends Node2D

var apple_scene = preload("res://scenes/apple.tscn")
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalScore.game_mode = randi_range(0,1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var apple = apple_scene.instantiate()
	apple.position.x = randi_range(1, 4) * 320 - 160
	add_child(apple)

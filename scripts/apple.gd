extends Node2D

@export var number:int=0
@onready var label: Label = $Label
const GRAVITY = 80
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	number = randi_range(1, 9)
	label.text = str(number)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += delta * GRAVITY
	if position.y > 640:
		queue_free()
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	GlobalScore.catch_apple(number)
	queue_free()
	pass # Replace with function body.

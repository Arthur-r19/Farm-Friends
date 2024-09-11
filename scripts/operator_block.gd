extends PushableBox
class_name OperatorBlock

enum OPERATORS{SUM, SUBTRACTION, MULTIPLICATION, DIVISION}
@export var operator: OPERATORS
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	var sprite = load("res://assets/my assets/" + str(OPERATORS.keys()[operator])+".png")
	sprite_2d.texture = sprite


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

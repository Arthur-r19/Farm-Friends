extends PushableBox
class_name OperatorBlock

enum OPERATORS{SUM, SUBTRACTION, MULTIPLICATION, DIVISION, EQUALS}
@export var operator: OPERATORS
@onready var sprite: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	set_operator_texture()

func set_operator_texture():
	match operator:
		OPERATORS.SUM:
			sprite.set_texture(Assets.SUM_TEXTURE)
		OPERATORS.SUBTRACTION:
			sprite.set_texture(Assets.SUBTRACTION_TEXTURE)
		OPERATORS.MULTIPLICATION:
			sprite.set_texture(Assets.MULTIPLICATION_TEXTURE)
		OPERATORS.DIVISION:
			sprite.set_texture(Assets.DIVISION_TEXTURE)
		OPERATORS.EQUALS:
			sprite.set_texture(Assets.EQUALS_TEXTURE)

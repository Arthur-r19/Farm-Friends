extends PushableBox
class_name NumberBlock

enum NUMBERS {ZERO,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE}
@export var number: NUMBERS
@onready var sprite: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	set_operator_texture()

func set_operator_texture():
	match number:
		NUMBERS.ZERO:
			sprite.set_texture(Assets.ZERO_TEXTURE)
		NUMBERS.ONE:
			sprite.set_texture(Assets.ONE_TEXTURE)
		NUMBERS.TWO:
			sprite.set_texture(Assets.TWO_TEXTURE)
		NUMBERS.THREE:
			sprite.set_texture(Assets.THREE_TEXTURE)
		NUMBERS.FOUR:
			sprite.set_texture(Assets.FOUR_TEXTURE)
		NUMBERS.FIVE:
			sprite.set_texture(Assets.FIVE_TEXTURE)
		NUMBERS.SIX:
			sprite.set_texture(Assets.SIX_TEXTURE)
		NUMBERS.SEVEN:
			sprite.set_texture(Assets.SEVEN_TEXTURE)
		NUMBERS.EIGHT:
			sprite.set_texture(Assets.EIGHT_TEXTURE)
		NUMBERS.NINE:
			sprite.set_texture(Assets.NINE_TEXTURE)

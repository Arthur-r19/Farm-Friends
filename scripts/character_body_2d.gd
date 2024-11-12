extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			sprite_2d.play(&"right")
		else:
			sprite_2d.play(&"left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite_2d.pause()

	move_and_slide()

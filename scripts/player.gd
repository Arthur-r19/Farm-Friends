extends CharacterBody2D

enum STATE {
	IDLE,
	WALK,
	ATTACK
}

@export var PUSH_FORCE: int = 99
@export var SPEED = 300.0

@onready var ray_cast_2d: RayCast2D = $Axis/RayCast2D


var current_state = STATE.IDLE
var input_direction = Vector2.DOWN


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	input_direction = get_input_direction()
	if Input.is_action_just_pressed("interact"):
		var obj = ray_cast_2d.get_collider()
		if obj and obj is PushableBox:
			var push_direction := get_push_direction(obj.position) 
			obj.push_recursive(PUSH_FORCE, push_direction)
			
	match current_state:
		STATE.IDLE:
			idle_state()
		STATE.WALK:
			walk_state()

func idle_state() -> void:
	# CONDITIONS TO CHANGE STATE
	# IDLE -> WALK
	if input_direction != Vector2.ZERO:
		#animation_state.travel("walk")
		current_state = STATE.WALK
		return
func walk_state() -> void:
	# WALK STATE ACTIONS
	if input_direction:
		velocity = input_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	
	# CONDITIONS TO CHANGE STATE
	# WALK -> IDLE
	if velocity == Vector2.ZERO and input_direction == Vector2.ZERO:
		current_state = STATE.IDLE
		return

func get_input_direction() -> Vector2:
	return Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	
func get_push_direction(obj_position: Vector2) -> Vector2:
	var direc := (obj_position - position).normalized()
	if direc.x > sqrt(2)/2:
		return Vector2.RIGHT
	elif direc.x < -sqrt(2)/2:
		return Vector2.LEFT
	elif direc.y > 0:
		return Vector2.DOWN
	else:
		return Vector2.UP

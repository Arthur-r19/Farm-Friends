extends StaticBody2D
class_name PushableBox

@export var tilemap : TileMapLayer
@export var PUSH_SPEED: float = 0.1


@onready var ray_right: RayCast2D = $ray_right
@onready var ray_bottom: RayCast2D = $ray_bottom
@onready var ray_left: RayCast2D = $ray_left
@onready var ray_top: RayCast2D = $ray_top

var tilemap_position: Vector2
var tween
func _ready() -> void:
	tilemap_position = tilemap.local_to_map(position)
	position = tilemap.map_to_local(tilemap_position)
	print('position:', position)
	print('tilemap_position:',tilemap_position)
	pass
	
func push(quantity: int, direction: Vector2) -> void:
	push_recursive(quantity, direction)

func push_recursive(n: int, direction: Vector2) -> void:
	print('position:', position)
	print('tilemap_position:',tilemap_position)
	if n == 0:
		return
	
	var next_tilemap_position = tilemap_position+direction
	if tilemap.is_wall(next_tilemap_position) or is_another_object_in_same_direction(direction):
		return
	
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.connect('finished', tween_finished)
	tween.tween_property(self, "position", tilemap.map_to_local(next_tilemap_position), PUSH_SPEED)
	await tween.finished
	tilemap_position = tilemap.local_to_map(position)
	push_recursive(n-1, direction)
	
func tween_finished() -> void:
	tween.kill()
	pass
	
func is_another_object_in_same_direction(direction: Vector2)->bool:
	if direction.x >0 && ray_right.get_collider() is PushableBox:
		return true
	elif direction.x <0 && ray_left.get_collider() is PushableBox:
		return true
	elif direction.y >0 && ray_bottom.get_collider() is PushableBox:
		return true
	elif direction.y <0 && ray_top.get_collider() is PushableBox:
		return true
	return false
		
	
	

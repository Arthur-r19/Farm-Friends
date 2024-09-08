extends StaticBody2D
class_name PushableBox

@export var tilemap : TileMapLayer
@export var PUSH_SPEED: float = 0.1

var tilemap_position: Vector2
var tween
func _ready() -> void:
	tilemap_position = tilemap.local_to_map(position)
	position = tilemap.map_to_local(tilemap_position)
	pass
	
func push(quantity: int, direction: Vector2) -> void:
	push_recursive(quantity, direction)

func push_recursive(n: int, direction: Vector2) -> void:
	if n == 0:
		return
	
	var next_tilemap_position = tilemap_position+direction
	if tilemap.is_wall(next_tilemap_position):
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
	print('finished')
	tween.kill()
	pass

extends StaticBody2D
class_name PushableBox

@export var PUSH_SPEED: float = 0.1

@onready var tilemap: TileMapLayer = %TileMapWalls

var tilemap_position: Vector2
var tween
func _ready() -> void:
	tilemap_position = tilemap.local_to_map(position)
	position = tilemap.map_to_local(tilemap_position)
	GlobalPositions.update_block_position(self, tilemap_position, tilemap_position)
	pass
	
func push(quantity: int, direction: Vector2) -> void:
	push_recursive(quantity, direction)

func push_recursive(n: int, direction: Vector2) -> void:
	if n == 0:
		return
	
	var old_tilemap_position = tilemap_position
	var next_tilemap_position = tilemap_position+direction
	if tilemap.is_wall(next_tilemap_position) or GlobalPositions.block_positions.has(next_tilemap_position):
		return
	
	if tween:
		tween.kill()
	
	tween = create_tween()
	tween.connect('finished', tween_finished)
	tween.tween_property(self, "position", tilemap.map_to_local(next_tilemap_position), PUSH_SPEED)
	await tween.finished
	tilemap_position = tilemap.local_to_map(position)
	
	GlobalPositions.update_block_position(self, old_tilemap_position, tilemap_position)
	push_recursive(n-1, direction)
	
func tween_finished() -> void:
	tween.kill()
	pass
	
	
	
	

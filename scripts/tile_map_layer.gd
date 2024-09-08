extends TileMapLayer

@export var walls_layer_id: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func get_map_position(pos : Vector2) -> Vector2:
	return Vector2.ZERO

func is_wall(map_pos: Vector2) -> bool:
	var cell_data = get_cell_tile_data(map_pos)
	if cell_data and cell_data.get_collision_polygons_count(walls_layer_id) > 0:
		return true
	return false

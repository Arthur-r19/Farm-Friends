extends TileMapLayer

func _ready() -> void:
	visible = false

func is_wall(map_pos: Vector2) -> bool:
	var cell_data = get_cell_source_id(map_pos) #get_cell_tile_data(map_pos)
	if cell_data == 0:
		return true
	return false

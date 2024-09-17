@tool
extends Node2D
class_name BlockIdentifier

enum BLOCK_TYPES {OPERATOR,NUMBER}
enum NUMBERS {ZERO,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE}
enum OPERATORS {SUM, SUBTRACTION, MULTIPLICATION, DIVISION, EQUALS}

@export_category("Identifier Parameters")
@export var block_type: BLOCK_TYPES = BLOCK_TYPES.OPERATOR:
	set(value):
		if value == block_type : return
		block_type = value
		notify_property_list_changed()

var block_content:int
var tilemap_position: Vector2
var active: bool = false

@onready var tile_map_walls: TileMapLayer = %TileMapWalls


func _get_property_list():
	if Engine.is_editor_hint():
		var properties =[]
		if block_type == BLOCK_TYPES.NUMBER:
			properties.append({
			"name": &"block_content",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": "ZERO,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE",
			"usage": PROPERTY_USAGE_DEFAULT,
			})
		if block_type == BLOCK_TYPES.OPERATOR:
			properties.append({
			"name": &"block_content",
			"type": TYPE_INT,
			"hint": PROPERTY_HINT_ENUM,
			"hint_string": "SUM,SUBTRACTION,MULTIPLICATION,DIVISION, EQUALS",
			"usage": PROPERTY_USAGE_DEFAULT, #PROPERTY_USAGE_EDITOR | PROPERTY_USAGE_STORAGE | PROPERTY_USAGE_SCRIPT_VARIABLE,
			})
		return properties

func _ready() -> void:
	tilemap_position = tile_map_walls.local_to_map(position)
	position = tile_map_walls.map_to_local(tilemap_position)
	GlobalPositions.update_identifier_position(self, tilemap_position)
	
func check(block: PushableBox):
	if block is OperatorBlock and block_type == BLOCK_TYPES.OPERATOR and block.operator == block_content:
		set_active(true)
	elif block is NumberBlock and block_type == BLOCK_TYPES.NUMBER and block.number == block_content:
		set_active(true)
	else:
		set_active(false)

func set_active(value: bool):
	if value == true:
		#self.modulate = Color(0, 1, 0, 1)
		pass
	else:
		#self.modulate = Color(1, 0, 0, 1)
		pass
	active = value

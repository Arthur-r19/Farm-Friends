extends Node

var identifier_positions = {}
var block_positions = {}

func update_identifier_position(parent: BlockIdentifier, position: Vector2):
	identifier_positions[position] = parent

func update_block_position(parent: PushableBox, old_position: Vector2, new_position: Vector2):
	block_positions.erase(old_position)
	block_positions[new_position] = parent
	#print('Blocks: ',block_positions)
	
func _process(delta: float) -> void:
	if Engine.get_process_frames() % 5 == 0:
		for position in identifier_positions:
			if block_positions.has(position):
				identifier_positions[position].check(block_positions[position])
				continue
			identifier_positions[position].set_active(false)
			
		

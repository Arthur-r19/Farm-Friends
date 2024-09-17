extends Node

var identifier_positions = {}
var block_positions = {}

func update_identifier_position(parent: BlockIdentifier, position: Vector2):
	identifier_positions[position] = parent

func update_block_position(parent: PushableBox, old_position: Vector2, new_position: Vector2):
	block_positions.erase(old_position)
	block_positions[new_position] = parent


func push_block(player_position: Vector2, push_position: Vector2):
	if block_positions.has(player_position + push_position):
		block_positions[player_position + push_position].push_recursive(99, push_position)

func _process(_delta: float) -> void:
	if Engine.get_process_frames() % 5 == 0:
		var all_true = true
		for position in identifier_positions:
			if block_positions.has(position):
				identifier_positions[position].check(block_positions[position])
				if not identifier_positions[position].active:
					all_true = false
				continue
			identifier_positions[position].set_active(false)
			all_true = false
		if all_true and identifier_positions.size() > 0:
			reload()
			LevelManager.next_level()

func reload():
	identifier_positions = {}
	block_positions = {}

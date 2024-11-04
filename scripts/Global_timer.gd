extends Node

var minutes = 1
var seconds = 30
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pass_second():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
		elif minutes == 0:
			GlobalLivesManager.loose_life()
			self.restart_clock()
			GlobalPositions.reload()
			LevelManager.restartLevel()
	seconds -= 1
	
func restart_clock():
	minutes = 1
	seconds = 30

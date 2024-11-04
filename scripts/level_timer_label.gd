extends Label

@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = str("%02d" % GlobalTimer.minutes) + ":" + str("%02d" % GlobalTimer.seconds)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = str("%02d" % GlobalTimer.minutes) + ":" + str("%02d" % GlobalTimer.seconds)


func _on_timer_timeout() -> void:
	GlobalTimer.pass_second()

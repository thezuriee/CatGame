extends Node

@onready var label = $Label
@onready var timer = $Timer2

@export var time = 60

signal pause

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = time+1
	timer.start()

func countdown():
	var timeLeft = timer.time_left
	return timeLeft
	
func _process(delta: float) -> void:
	label.text = "%02d" % countdown()
	
	if countdown() <= 0:
		gameover()

func gameover():
	get_tree().paused = true
	print("paused")
	label.hide()
	pause.emit()

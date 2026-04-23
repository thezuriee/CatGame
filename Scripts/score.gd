extends Node2D

var score = 0

@onready var label = $Label
@onready var audio = $fart

func _on_sprite_2d_clicked() -> void:
	score += 1
	if score == 67:
		audio.play()
		print("farted")

func _process(delta: float) -> void:
	label.text = "your score:\n" + str(score)


func _on_timer_pause() -> void:
	self.position = Vector2(position.x, 258)

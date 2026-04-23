extends Sprite2D

var viewportSize
var randX
var randY

signal clicked

@onready var audio = $meow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewportSize = get_viewport_rect().size
	randX = randi_range(0, viewportSize.x)
	randY = randi_range(0, viewportSize.y)
	
	self.position = Vector2(randX+(0.15), randY+(0.15))

func _area2d_input(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		randX = randi_range(0, viewportSize.x)
		randY = randi_range(0, viewportSize.y)
		
		self.position = Vector2(randX, randY)
		
		audio.play()
		clicked.emit()


func _on_timer_pause() -> void:
	self.hide()

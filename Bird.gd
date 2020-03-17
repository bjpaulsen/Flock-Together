extends Area2D

var mouse_pos = get_global_mouse_position()
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	position.x = rng.randi_range(-2400, 1400)
	position.y = rng.randi_range(-1800, 2000)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(mouse_pos)
	position += (mouse_pos - position)/40
	mouse_pos = get_global_mouse_position()
	
	

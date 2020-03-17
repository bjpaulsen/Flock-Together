extends Node2D
var mouse_pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_local_mouse_position()
	rotation += (mouse_pos.angle())*delta

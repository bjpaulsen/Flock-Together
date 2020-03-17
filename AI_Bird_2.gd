extends Area2D


# Declare member variables here. Examples:
var following = false
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (following):
		var mouse_pos = get_global_mouse_position()
		look_at(mouse_pos)
		position += (mouse_pos - position)/100
	else:
		pass
		#position.y += 5
		#position.x = sin(.01*position.y) + position.x


func _on_AI_Bird_2_area_entered(area):
	if (area.get_name() == "Bird"):
		following = true

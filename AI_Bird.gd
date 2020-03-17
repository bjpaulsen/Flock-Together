extends Area2D


# Declare member variables here. Examples:
var following = false
var time = 0
var rng = RandomNumberGenerator.new()
var random_speed
var random_offset
var _angle = 0;
var Radius
var circle_center
var angle_speed = 1
var destination


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	random_speed = rng.randfn(1.5, .5)
	random_offset = Vector2(rng.randfn(0, 1), rng.randfn(0, 1))
	Radius = rng.randfn(350, 75)
	circle_center = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (following):
		destination = get_node("../Bird").position
	else:
		var offset = Vector2(sin(_angle), cos(_angle)) * Radius
#		if (time > 120):
#			time = 0
#			angle_speed *= -1
		_angle += angle_speed * delta
		destination = circle_center + offset
		time += 1
	
	# go to the destination
	look_at(destination + random_offset)
	position += ((destination - position)/45)*random_speed + random_offset


func _on_AI_Bird_area_entered(area):
	if (not following):
		if (area.is_in_group("player_flock")):
			following = true
			random_speed = rng.randfn(1, .3)
			add_to_group("player_flock")

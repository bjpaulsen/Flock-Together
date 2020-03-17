extends Area2D


# Declare member variables here. Examples:
var time = 0
var rng = RandomNumberGenerator.new()
var random_speed
var random_offset
var destination
var following = true


# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	random_speed = rng.randfn(1.5, .5)
	random_offset = Vector2(rng.randfn(0, 1), rng.randfn(0, 1))
	add_to_group("flock_1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	destination = get_node("../AI_Bird").position
	
	# go to the destination
	look_at(destination + random_offset)
	position += ((destination - position)/45)*random_speed + random_offset

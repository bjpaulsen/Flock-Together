extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(delta):
	pass


func _on_Goal_area_entered(area):
	if (area == get_node("Bird")):
		get_tree().change_scene("res://EndScreen.tscn")

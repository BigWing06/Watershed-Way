extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func onload(info):
	$bttn.text = info["name"]
	$TextureRect.texture = load("res://displaySprites/background" + str(info["number"]) + "/background.png")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node2D

#var backgroundInfo = [{"name":"Rural Landscape", "number":0}, {"name":"House", "number":1}]
var backgroundInfo= []

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var listItem = load("res://selectionMenu/selectionBttn.tscn")
	var listItems = []
	for background in backgroundInfo:
		var newListItem = listItem.instantiate()
		listItems.append(newListItem)
		newListItem.onload(background)
		$VBoxContainer.add_child(newListItem)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var KEYLIST = {"a":65, "b":66, "c":67, "d":68, "e":69, "f":70, "g":71, "h":72, "y":89, "z":90}
var scenePath = "/root/rootScene"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEYLIST["a"]:
				get_node(scenePath).triggerZone(1)
			elif event.keycode == KEYLIST["b"]:
				get_node(scenePath).triggerZone(2)
			elif event.keycode == KEYLIST["c"]:
				get_node(scenePath).triggerZone(3)
			elif event.keycode == KEYLIST["y"]:
				get_node(scenePath + "/gameOverMenu").showItem()
			elif event.keycode == KEYLIST["z"]:
				get_node(scenePath + "/gameOverMenu").hideItem()
			elif event.keycode == KEYLIST["d"]:
				get_node(scenePath).triggerZone(4)
			elif event.keycode == KEYLIST["e"]:
				get_node(scenePath).triggerZone(5)
			elif event.keycode == KEYLIST["f"]:
				get_node(scenePath).triggerZone(6)
			elif event.keycode == KEYLIST["g"]:
				get_node(scenePath).triggerZone(7)
	if event.is_action_pressed("scene1"):
		Global.background = 0
		get_node(scenePath).loadBackground(0)
	elif event.is_action_pressed("scene2"):
		Global.background = 1
		get_node(scenePath).loadBackground(1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

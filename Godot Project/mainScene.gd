extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func triggerZone(num):
	print(num)
	if not num in Global.zonesTriggered:
		Global.zonesTriggered.append(num)
		get_node("zone" + str(num)).frame = 0
		get_node("zone" + str(num)).play()
		if Global.pollutantList[Global.background][num-1] !=null:
			Global.acquiredPollutants.append(Global.pollutantList[Global.background][num-1])
	
	
func loadBackground(num):
	var basePath = "res://displaySprites/background" + str(num) + "/"
	$TextureRect.texture = load(basePath + "background.png")
	reset()
		
		
func reset():
	for i in range(7):
		var node = get_node("zone" + str(i+1))
		node.animation = "background" + str(Global.background)
		node.stop()
		node.frame = 0
	Global.acquiredPollutants = []
	Global.zonesTriggered = []

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func showItem():
	$AnimationPlayer/ColorRect/pollutantCollectedListLbl.text = ""
	for i in range(len(Global.acquiredPollutants)):
		$AnimationPlayer/ColorRect/pollutantCollectedListLbl.text += Global.acquiredPollutants[i] + "\n"
		$AnimationPlayer/ColorRect/pollutantNumLbl.text = str(len(Global.acquiredPollutants)) + " Pollutants..."
	#$AnimationPlayer/ColorRect/pollutantCollectedListLbl.get("custom_fonts/font").extra_spacing_bottom = (565 - (len(Global.acquiredPollutants)*113))/len(Global.acquiredPollutants)
	$AnimationPlayer.play("showMenu")
func hideItem():
	get_node("/root/rootScene").reset()
	$AnimationPlayer.stop()
	$AnimationPlayer/ColorRect.modulate = Color($AnimationPlayer/ColorRect.modulate.r, $AnimationPlayer/ColorRect.modulate.b, $AnimationPlayer/ColorRect.modulate.g, 0)
	$AnimationPlayer/ColorRect2.modulate = Color($AnimationPlayer/ColorRect2.modulate.r, $AnimationPlayer/ColorRect2.modulate.b, $AnimationPlayer/ColorRect2.modulate.g, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

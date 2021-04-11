extends StaticBody2D

var turnedOn = false
signal fapped

func _computer():
	if turnedOn:
		$DiaNode._sendToDialogue(Globals._openJSON("res://JSON Files/computer_interact_lewd.JSON"))
		emit_signal("fapped", "LUST")
	turnedOn = true
	$Sprite.frame = 1
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_computer_on.JSON")

func _ready():
	$DiaNode.connect("interact", self, "_computer")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_computer.JSON")

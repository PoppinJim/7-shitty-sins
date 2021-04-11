extends StaticBody2D

var turnedOn = false

func _computer():
	turnedOn = true
	$Sprite.frame = 1
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_computer_on.JSON")

func _ready():
	$DiaNode.connect("interact", self, "_computer")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_computer.JSON")

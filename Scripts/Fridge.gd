extends StaticBody2D

var open = false

func _fridge():
	match open:
		false:
			open = true
			$Sprite.frame = 1
			$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_fridge_open.JSON")
		true:
			open = false
			$Sprite.frame = 0

func _ready():
	$DiaNode.connect("interact", self, "_fridge")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_fridge.JSON")

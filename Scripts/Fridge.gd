extends StaticBody2D

var open = false

export(String) var observeScript
export(String) var observeScript2


func _fridge():
	match open:
		false:
			open = true
			$Sprite.frame = 1
			$DiaNode.script1 = Globals._openJSON(observeScript2)
		true:
			open = false
			$Sprite.frame = 0

func _ready():
	$DiaNode.connect("interact", self, "_fridge")
	$DiaNode.script1 = Globals._openJSON(observeScript)

extends StaticBody2D

var on = false

func _stove():
	if on == false:
		on = true
		$Sprite.frame = 1
		$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_stove_on.JSON")
	else:
		on = false
		$Sprite.frame = 0
		$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_stove.JSON")
		
func _ready():
	$DiaNode.connect("interact", self, "_stove")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_stove.JSON")

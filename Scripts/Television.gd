extends StaticBody2D

var on = false

signal commitSin

func _television():
	on = true
	$Sprite.frame = 1
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_television_on.JSON")
	emit_signal("commitSin", "ENVY")
	
func _ready():
	$DiaNode.connect("interact", self, "_television")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_television.JSON")

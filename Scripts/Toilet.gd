extends StaticBody2D

var open = false

func _toilet():
	match open:
		false:
			open = true
			$Sprite.frame = 1
		true:
			open = false
			$Sprite.frame = 0
func _ready():
	$DiaNode.connect("interact", self, "_toilet")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_toilet.JSON")

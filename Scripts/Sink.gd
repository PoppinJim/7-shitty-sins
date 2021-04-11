extends StaticBody2D

var running = false

func _sink():
	match running:
		false:
			running = true
			$Sprite.frame = 1
			$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_sink_running.JSON")
		true:
			running = false
			$Sprite.frame = 0
			$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_sink.JSON")

func _ready():
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_sink.JSON")
	$DiaNode.connect("interact", self, "_sink")
	pass

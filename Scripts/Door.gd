extends StaticBody2D

var open = false


func _door():
	print("signal received")
	if open == true:
		open = false
	else:
		open = true

func _ready():
	$DiaNode.connect("interact", self, "_door")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_door.JSON")

func _physics_process(delta):
	match open:
		false:
			$Sprite.frame = 0
			$CollisionShape2D.disabled = false
		true:
			$Sprite.frame = 1
			$CollisionShape2D.disabled = true

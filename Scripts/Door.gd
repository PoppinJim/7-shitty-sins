extends StaticBody2D

var open = false

func _evaluateChoice(choice):
	print("door signal received: ", choice)
	if choice == "PICKUP":
		_door()

func _door():
	if open == true:
		open = false
	else:
		open = true

func _ready():
	$DiaNode.connect("choiceMade", self, "_evaluateChoice")

func _physics_process(delta):
	match open:
		false:
			$Sprite.frame = 0
			$CollisionShape2D.disabled = false
		true:
			$Sprite.frame = 1
			$CollisionShape2D.disabled = true

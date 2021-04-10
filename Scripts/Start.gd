extends Label

var goUP = true
export var speed = 5

func _physics_process(delta):
	if goUP:
		modulate.a8 += speed
		if modulate.a8 >= 100:
			goUP = false
	else:
		modulate.a8 -= speed
		if modulate.a8 <= 0:
			goUP = true
	
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/ROOT.tscn")

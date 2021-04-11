extends Node2D

signal finishedReading

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("left_click"):
		$Sprite.frame += 1
		if $Sprite.frame >= 2:
			queue_free()
			emit_signal("finishedReading")

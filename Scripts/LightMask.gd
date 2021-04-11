extends Light2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_focus_next"):
		global_position = get_global_mouse_position()
	else:
		position = Vector2.ZERO

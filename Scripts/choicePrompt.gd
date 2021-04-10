extends AnimatedSprite

export(String) var choice
signal hovered

func _on_Area2D_mouse_entered():
	scale = Vector2(1.25, 1.25)
	emit_signal("hovered", choice)

func _on_Area2D_mouse_exited():
	scale = Vector2(1, 1)
	emit_signal("hovered", "CANCEL")

extends Sprite



func _on_Area2D_mouse_entered():
	self_modulate.a8 -= 5
	print("mouse entered wall")


func _on_Area2D_mouse_exited():
	self_modulate.a8 += 5
	print("mouse exited wall")

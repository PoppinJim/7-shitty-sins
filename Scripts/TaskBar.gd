extends Node2D

func _updateList(bullet):
	match bullet:
		"LUST":
			$checkList/lust.visible = true
		"GLUTTONY":
			$checkList/gluttony.visible = true
		"GREED":
			$checkList/greed.visible = true
		"SLOTH":
			$checkList/sloth.visible = true
		"WRATH":
			$checkList/wrath.visible = true
		"ENVY":
			$checkList/envy.visible = true
		"PRIDE":
			$checkList/pride.visible = true


func _on_TextureButton_button_down():
	$checkList.visible = true
func _on_TextureButton_button_up():
	$checkList.visible = false
	$TextureButton.release_focus()

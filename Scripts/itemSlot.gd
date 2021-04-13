extends Node2D

export(Resource) var currentItem
var equipped = false
signal itemExpelled

signal toggled

func _ready():
	$CenterContainer/Sprite.scale = Vector2(1.75,1.75)
	$TextureButton.disabled = true

func _insertItem(itemResource):
	currentItem = itemResource
	if currentItem == null:
		$CenterContainer/Sprite.texture = null
		$TextureButton.disabled = true
	else:
		$CenterContainer/Sprite.texture = currentItem.texture
		$TextureButton.disabled = false


func _itemUsed():
	print("item has been used: ", currentItem.name)
	if currentItem.name != "Gun":
		print(currentItem.name)
		_insertItem(null)
		print("item cleared?")

func _expelItem():
	emit_signal("itemExpelled")


func _on_TextureButton_toggled(button_pressed):
	match equipped:
		true:
			equipped = false
		false:
			equipped = true
	emit_signal("toggled", equipped)
	

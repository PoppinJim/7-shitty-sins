extends StaticBody2D

var open = false
onready var itemInstance = preload("res://Scenes/Item.tscn")
signal itemDropped

export(String) var observeScript
export(String) var observeScript2
export(Resource) var stockItem = null

func _fridge():
	match open:
		false:
			open = true
			$Sprite.frame = 1
			$DiaNode.script1 = Globals._openJSON(observeScript2)
			if stockItem != null:
				var item = itemInstance.instance()
				item.resourceItem = stockItem
				emit_signal("itemDropped", item)
				add_child(item)
		true:
			open = false
			$Sprite.frame = 0

func _ready():
	$DiaNode.connect("interact", self, "_fridge")
	$DiaNode.script1 = Globals._openJSON(observeScript)

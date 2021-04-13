extends KinematicBody2D

export(Resource) var resourceItem
signal pickupItem
var velocity = Vector2.ZERO
func _pickUp():
	print("picked up item")
	emit_signal("pickupItem", resourceItem)
	queue_free()

func _ready():
	$DiaNode.connect("interact", self, "_pickUp")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_item_on_ground.JSON")
	$Texture.texture = resourceItem.texture
	if resourceItem.customTooltip:
		$DiaNode.script1 = Globals._openJSON(resourceItem.customTooltip)
	add_to_group("Item")
func _physics_process(delta):
	velocity = move_and_slide(velocity)

extends Node2D

signal pickup

func _interacted():
	emit_signal("pickup")
	queue_free()

func _ready():
	$DiaNode.connect("interact", self, "_interacted")
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_note_on_ground.JSON")

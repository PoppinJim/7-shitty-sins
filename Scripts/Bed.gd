extends StaticBody2D

func _ready():
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_bed.JSON")

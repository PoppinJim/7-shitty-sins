extends Node2D

onready var diaNodes = get_tree().get_nodes_in_group("diaNode")

func _ready():
	for i in diaNodes:
		i.connect("choiceMade", $CanvasLayer/DialogueSystem, "_initDialogue")

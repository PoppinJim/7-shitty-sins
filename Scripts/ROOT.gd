extends Node2D

onready var diaNodes = get_tree().get_nodes_in_group("diaNode")
onready var letterA = preload("res://Scenes/Note.tscn")

var lust = false
var gluttony = false
var greed = false
var sloth = false
var wrath = false
var ency = false
var pride = false

func _trackSins(SIN):
	print("signal received: ", SIN)
	$CanvasLayer/TaskBar._updateList(SIN)
	
func _pickUpNote():
	var letter = letterA.instance()
	letter.position = Vector2(540, 360)
	$CanvasLayer.add_child(letter)
	pass

func _ready():
	for i in diaNodes:
		i.connect("choiceMade", $CanvasLayer/DialogueSystem, "_initDialogue")
	$YSort/Computer.connect("fapped", self, "_trackSins")
	$YSort/Paper. connect("pickup", self, "_pickUpNote")

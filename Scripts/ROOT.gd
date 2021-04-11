extends Node2D

onready var diaNodes = get_tree().get_nodes_in_group("diaNode")

var lust = false
var gluttony = false
var greed = false
var sloth = false
var wrath = false
var ency = false
var pride = false

func _trackSins(SIN):
	print("signal received: ", SIN)

func _ready():
	for i in diaNodes:
		i.connect("choiceMade", $CanvasLayer/DialogueSystem, "_initDialogue")
	$YSort/Computer.connect("fapped", self, "_trackSins")

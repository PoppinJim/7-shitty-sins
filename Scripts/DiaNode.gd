extends Node2D

onready var collisionShape = $Area2D/CollisionShape2D
onready var NPCPrompt = preload("res://Scenes/NPC_InitPrompt.tscn")
onready var ITEMPrompt = preload("res://Scenes/ITEM_InitPrompt.tscn")

export(Shape2D) var shape
export(String) var mode = "NPC"

var script1 
var script2

signal choiceMade
signal interact

var canMousePress

func _ready():
	collisionShape.shape = shape

func _on_Area2D_mouse_entered():
	canMousePress = true

func _on_Area2D_mouse_exited():
	canMousePress = false
	
func _choiceMade(choice):
	match choice:
		"OBSERVE":
			_sendToDialogue(script1)
		"TALK":
			_sendToDialogue(script2)
		"PICKUP":
			emit_signal("interact")

func _sendToDialogue(script):
	emit_signal("choiceMade", script)

	
func _physics_process(delta):
	if Input.is_action_just_pressed("right_click") && canMousePress:
		match mode:
			"NPC":
				var npcPrompt = NPCPrompt.instance()
				npcPrompt.position.y = position.y - 50
				npcPrompt.connect("decided", self, "_choiceMade")
				add_child(npcPrompt)
			"ITEM":
				var itemPrompt = ITEMPrompt.instance()
				itemPrompt.position.y = position.y - 50
				itemPrompt.connect("decided", self, "_choiceMade")
				add_child(itemPrompt)

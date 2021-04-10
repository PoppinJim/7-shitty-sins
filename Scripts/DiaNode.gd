extends Node2D

onready var collisionShape = $Area2D/CollisionShape2D
onready var NPCPrompt = preload("res://Scenes/NPC_InitPrompt.tscn")

export(Shape2D) var shape
export(String) var mode = "NPC"

var canMousePress

func _ready():
	collisionShape.shape = shape

func _on_Area2D_mouse_entered():
	canMousePress = true
	print("mouse detected: entered")

func _on_Area2D_mouse_exited():
	canMousePress = false
	print("mouse detected: exited")
	
func _choiceMade(choice):
	print("dianode received: ", choice)

func _physics_process(delta):
	if Input.is_action_just_pressed("right_click") && canMousePress:
		match mode:
			"NPC":
				var npcPrompt = NPCPrompt.instance()
				npcPrompt.position.y = position.y - 50
				npcPrompt.connect("decided", self, "_choiceMade")
				add_child(npcPrompt)
		

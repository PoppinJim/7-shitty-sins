extends Node2D

var choice

onready var choiceBubbles = get_tree().get_nodes_in_group("choicePrompt")

signal decided

func _evaluateChoice(decision):
	choice = decision

func _ready():
	for i in choiceBubbles:
		i.connect("hovered", self, "_evaluateChoice")
	$AnimationPlayer.play("On_Ready")

func _physics_process(delta):
	if Input.is_action_just_released("right_click"):
		emit_signal("decided", choice)
		queue_free()

extends KinematicBody2D

var direction = Vector2.ZERO
var velocity = Vector2.ZERO
export var SPEED = 275
export var acceleration = 0.06
export var friction = 0.3

onready var animationTree = $AnimationTree
onready var animationState = $AnimationTree.get("parameters/playback")

func move():
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#velocity = direction * Vector2(SPEED, SPEED)
	direction = direction.normalized()
	if direction != Vector2.ZERO:
		velocity.x = lerp(velocity.x, direction.x * SPEED, acceleration)
		velocity.y = lerp(velocity.y, direction.y * SPEED, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		velocity.y = lerp(velocity.y, 0, friction)
	velocity = move_and_slide(velocity)

func animate():
	if direction != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", direction)
		animationTree.set("parameters/Walk/blend_position", direction)
		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
		
func _ready():
	$DiaNode.script1 = Globals._openJSON("res://JSON Files/observe_self.JSON")
	$DiaNode.script2 = Globals._openJSON("res://JSON Files/talk_self.JSON")

func _physics_process(delta):
	move()
	animate()
	
	

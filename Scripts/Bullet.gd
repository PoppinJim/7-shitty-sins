extends KinematicBody2D

export var SPEED = 1000
var velocity = Vector2.ZERO
var direction = Vector2.ZERO

onready var trail = preload("res://Scenes/BulletTrail.tscn")

func _physics_process(delta):
	velocity = direction * Vector2(SPEED, SPEED)
	look_at(direction + position)
	
	var collision = move_and_collide(velocity * delta)
	
	if collision: queue_free()
	
	var bTrail = trail.instance()
	get_parent().add_child(bTrail)
	pass


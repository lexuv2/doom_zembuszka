class_name bullet
extends RigidBody2D

# Called when the node enters the scene tree for the first time.
@export var speed = 100
var where:Vector2
func _ready():
	apply_central_impulse(where.normalized()*speed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

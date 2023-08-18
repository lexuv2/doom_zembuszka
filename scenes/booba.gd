
extends RigidBody2D

@export var off = Vector2.ZERO
var vertical_off = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var car = get_node("/root/root/character")

	apply_central_force(position.direction_to(car.position+off+Vector2(0,vertical_off))*position.distance_squared_to(car.position+off+Vector2(0,vertical_off))*randf_range(3,6))
	pass

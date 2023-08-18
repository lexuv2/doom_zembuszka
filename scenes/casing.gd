extends RigidBody2D


var where:Vector2
func _ready():
	apply_central_impulse(where.normalized()*300)
	
	pass # Replace with function body.
var flag=0
func _physics_process(delta):
	if not flag:
		apply_torque_impulse(randf_range(-40,-20))
		flag=1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

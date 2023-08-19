class_name bullet
extends RigidBody2D

# Called when the node enters the scene tree for the first time.
@export var speed = 100
var damage=10
var life = 0
var timeout=0
var where:Vector2
func _ready():
	apply_central_impulse(where.normalized()*speed)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if (linear_velocity.length()<1000):
		$"Pngimg_com-MayonnaisePng81".visible=false
		freeze=true
		$GPUParticles2D.emitting=true
		timeout+=1
		if timeout>20:
			queue_free()
	pass

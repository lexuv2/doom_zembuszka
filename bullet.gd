class_name bullet
extends RigidBody2D

# Called when the node enters the scene tree for the first time.
@export var speed = 100
var life = 0
var timeout=0
var where:Vector2
func _ready():
	apply_central_impulse(where.normalized()*speed)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	life+=1
	if life<5:
		return
	if (linear_velocity.length()<30):
		if timeout<=0:
			$GPUParticles2D.emitting=1
			$ball_smoke.emitting=0
		timeout+=1
		print("papaj")
		
		if timeout>120:
			queue_free()
	pass

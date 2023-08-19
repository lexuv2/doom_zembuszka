extends RigidBody2D
@export var bullet = preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
@export var speed = 100
var life = 0
var timeout=0
var where:Vector2
var damage
func _ready():
	apply_central_impulse(where.normalized()*speed)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	life+=1
	if life<5:
		return
	if (linear_velocity.length()<500):
		
		if timeout<=0:
			$GPUParticles2D.emitting=1
			$ball_smoke.emitting=0
			for x in range(0,50):
				var b = bullet.instantiate()
				b.speed=100
				b.damage=damage
				b.visible=false
				var global_pos=position
				var spread=0.2
				b.where = Vector2.from_angle(randf_range(-5,5))
				b.rotation = global_pos.angle_to(b.where)
		
				b.position = global_pos
				get_node("/root").add_child(b)
		timeout+=1
		print("papaj")
		
		if timeout>120:
			queue_free()
	pass

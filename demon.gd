extends RigidBody2D

@export var hp = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_body_entered(body):
	if body is bullet:
		print("papakj")
		$bullet_blood.rotation = body.rotation
		for x in range(0,50):
			$bullet_blood.emit_particle(Transform2D(),Vector2.ZERO,Color(),Color(),0)
		print(body)
		hp-=10;
		body.queue_free()
	pass # Replace with function body.

extends RigidBody2D
@export var score =5 
var character_in_child = false
var tooth = preload("res://scenes/tooth.tscn")

var obtained = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if character_in_child and not obtained:
		$tooltop.visible=true
	else:
		$tooltop.visible=false
	if Input.is_action_pressed("interact") and not obtained and character_in_child and not get_node("/root/root").dimension:
		obtained=true
		for x in score:
			var tot = tooth.instantiate()
			add_child(tot)
			var rng = 100
			tot.position+=Vector2(randi_range(-rng,rng),randi_range(-rng,rng))
			tot.reparent(get_node("/root/root"))
		var can = load("res://scenes/candy.tscn").instantiate()
		add_child(can)
		var rng = 100
		can.position+=Vector2(randi_range(-rng,rng),randi_range(-rng,rng))
		can.reparent(get_node("/root/root"))
		var c = 0.4;
		$Child.modulate-=Color(c,c,c,c)
	pass


func _on_move_timer_timeout():
	var rng=5000
	apply_central_impulse(Vector2(randf_range(-rng,rng),randf_range(-rng,rng)))
	$move_timer.start()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body is character:
		character_in_child=true
		
		
			
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body is character:
		character_in_child=false
	pass # Replace with function body.

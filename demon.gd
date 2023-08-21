extends CharacterBody2D
class_name enemy
@export var hp = 100
@export var target: Node2D
@export var speed: float = 10000
@onready var agent := $NavigationAgent2D as NavigationAgent2D
@export var target_refresh_time:int = 60
var tooth = preload("res://scenes/tooth.tscn")
var glob_direction
@export var score =5 
var  timer =0
var spawnpos=Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnpos=position
	get_tree().root.get_child(0).enemies_num+=1
	target=get_tree().root.get_child(0).get_node("character")
	retarget()

func retarget() -> void:
	if get_tree().root.get_child(0).dimension:
		agent.target_position = target.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position.distance_to(spawnpos)>2000:
		queue_free()
	if collision_mask==0:
		return
	timer+=1
	if timer>target_refresh_time+randi_range(0,10):
		retarget()
		timer=0
	var direction = to_local(agent.get_next_path_position()).normalized()
	glob_direction=direction
	velocity += direction * speed

	
	move_and_slide()
	velocity=Vector2.ZERO
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is bullet:
			var body = collision.get_collider() as bullet
			$bullet_blood.rotation = body.rotation
			for x in range(0,50):
				$bullet_blood.emit_particle(Transform2D(),Vector2.ZERO,Color(),Color(),0)
			for x in range(0,5):
				var blood_range = 30
				$blood.emit_particle(Transform2D(),Vector2(randf_range(-blood_range,blood_range),randf_range(-blood_range,blood_range)),Color(),Color(),4)
			print(body)
			hp-=body.damage
			
			body.queue_free()
			if (hp<=0):
				var can = load("res://scenes/RUM.tscn").instantiate()
				add_child(can)
				var rng = 100
				can.position+=Vector2(randi_range(-rng,rng),randi_range(-rng,rng))
				can.reparent(get_tree().root.get_child(0))
		
		
				for x in 0:
					var tot = tooth.instantiate()
					add_child(tot)
					rng = 50
					tot.position+=Vector2(randi_range(-rng,rng),randi_range(-rng,rng))
					tot.reparent(get_tree().root.get_child(0))
				
				
				
				for x in range(0,50):
					var blood_range = 120
					$bullet_blood.emit_particle(Transform2D(),Vector2(randf_range(-blood_range,blood_range),randf_range(-blood_range,blood_range)),Color(),Color(),4)
				$bullet_blood.reparent(get_tree().root.get_child(0))
				$blood.reparent(get_tree().root.get_child(0))
				get_tree().root.get_child(0).enemies_num-=1
				queue_free()
				return


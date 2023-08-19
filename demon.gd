extends CharacterBody2D
class_name enemy
@export var hp = 100
@export var target: Node2D
@export var speed: float = 10000
@onready var agent := $NavigationAgent2D as NavigationAgent2D
@export var target_refresh_time:int = 30
var glob_direction

var  timer =0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target=get_node("/root/root/character")
	retarget()

func retarget() -> void:
	agent.target_position = target.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	timer+=1
	if timer>target_refresh_time:
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
				for x in range(0,50):
					var blood_range = 120
					$bullet_blood.emit_particle(Transform2D(),Vector2(randf_range(-blood_range,blood_range),randf_range(-blood_range,blood_range)),Color(),Color(),4)
				$bullet_blood.reparent(get_node("/root/root"))
				$blood.reparent(get_node("/root/root"))
				queue_free()
				return


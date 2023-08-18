extends Node2D

@onready var bullet = preload("res://bullet.tscn")
@onready var casing = preload("res://scenes/casing.tscn")
@export var recoil = 100
@export var shoot_delay_frames = 60
@export var shoot_number = 10
@export var spread= 0.5
var delay = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

var global_pos=Vector2.ZERO

func shoot():
	_shoot()
	
func eject_casing():
	var case = casing.instantiate()
	case.where = global_pos.direction_to(get_global_mouse_position()).rotated(-PI/2)
		
	case.where.x *= randf_range(1-spread,1+spread)
	case.where.y *= randf_range(1-spread,1+spread)
		
	case.rotation = global_pos.angle_to_point(get_global_mouse_position())
	case.position = global_pos#+global_pos.direction_to(get_global_mouse_position())*50+Vector2(randi_range(-20,20),randi_range(-20,20))
	case.lock_rotation=false
	get_node("/root").add_child(case)

func _shoot():
	if delay<shoot_delay_frames:
		return
	
	delay=0
	get_parent().recoil()
	for x in range(0,shoot_number):
		var b = bullet.instantiate()
		b.where = global_pos.direction_to(get_global_mouse_position())
		
		b.where.x *= randf_range(1-spread,1+spread)
		b.where.y *= randf_range(1-spread,1+spread)
		
		b.rotation = global_pos.angle_to_point(get_global_mouse_position())
		b.position = global_pos+global_pos.direction_to(get_global_mouse_position())*50+Vector2(randi_range(-20,20),randi_range(-20,20))
		get_node("/root").add_child(b)
		$shoot_sound.play()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delay+=1
	pass

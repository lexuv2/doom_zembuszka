extends Node2D


# Called when the node enters the scene tree for the first time.
var global_pos = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func shoot():
	var gun = get_child(0)
	
	gun.shoot()
func recoil():
	var gun = get_child(0)
	get_parent().velocity-=Vector2.from_angle(gun.rotation)*gun.recoil
	$"../Camera2D".vel-=Vector2.from_angle(gun.rotation)*gun.recoil

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_pos = get_parent().position
	var gun = get_child(0)
	gun.global_pos=global_pos
	gun.rotation = global_pos.angle_to_point(get_global_mouse_position())
	pass

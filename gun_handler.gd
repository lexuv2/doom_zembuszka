extends Node2D


# Called when the node enters the scene tree for the first time.
var global_pos = Vector2.ZERO
var active_weapon


func _ready():
	pass # Replace with function body.

func set_weapon(weapon):
	active_weapon=weapon
	get_child(0).queue_free()
	
	var new_gun = load(weapon).instantiate()
	add_child(new_gun)

func hide_weapon():
	if get_child(0)!=null:
		get_child(0).queue_free()

func show_weapon():
	get_child(0).queue_free()
	var new_gun = load(active_weapon).instantiate()
	add_child(new_gun)

func shoot():
	if get_child(0)==null:
		return
	var gun = get_child(0)
	
	gun.shoot()
func recoil():
	var gun = get_child(0)
	get_parent().velocity-=Vector2.from_angle(gun.rotation)*gun.move_recoil
	$"../Camera2D".vel-=Vector2.from_angle(gun.rotation)*gun.camera_recoil

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if get_child(0)==null:
		return
	global_pos = get_parent().position
	var gun = get_child(0)
	gun.global_pos=global_pos
	gun.rotation = global_pos.angle_to_point(get_global_mouse_position())
	pass

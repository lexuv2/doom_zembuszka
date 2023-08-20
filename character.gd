extends CharacterBody2D
class_name character
@export var enable_camera:bool = true
@export var SPEED = 300.0
var hp = 5
var psycha = 5
var score = 0
@export var lock_controlls:bool =0
@export var dimension:bool=1
@export var booba_v_offset:int
@export var sprite_doom: Texture2D
@export var sprite_fairy: Texture2D
var weapons  = ["res://scenes/shotgun.tscn","res://scenes/kar96k.tscn","res://cannon.tscn","res://bofors.tscn"]
var unlocks = [1,1,1,1,1]
@export var damage_timeout=120
var damage_timer=0;
var dash_timer = 0;
@export var dash_delay=60
@export var sprite_left_boob_doom: Texture2D
@export var sprite_left_boob_fairy: Texture2D

@export var sprite_right_boob_doom: Texture2D
@export var sprite_right_boob_fairy: Texture2D
var can_change_dim = true


var flashbang=false

var sprite_rotation_target=0.0
func set_booba_offset(inp:int ):
	booba_v_offset=inp
	get_tree().root.get_child(0).booba(inp)
var papapj2137=false
func change_dimension(dim: bool):
	if papapj2137:
		$AnimationPlayer2.play("coin")
	papapj2137=true
	get_tree().root.get_child(0).change_diemnsion(dim)
	
	if dim:
		$fairy.texture=sprite_doom
		$fairy/FaerieBoobaLeft.texture=sprite_left_boob_doom
		$fairy/FaerieBoobaRight.texture=sprite_right_boob_doom
	else:
		$gun_handler.hide_weapon()
		$fairy.texture=sprite_fairy
		$fairy/FaerieBoobaLeft.texture=sprite_left_boob_fairy
		$fairy/FaerieBoobaRight.texture=sprite_right_boob_fairy
	
func _physics_process(delta):
	if lock_controlls:
		return
	
	
	if flashbang:
		$Camera2D/CanvasLayer/Flashbang.modulate.a=clamp($Camera2D/CanvasLayer/Flashbang.modulate.a,0.4,100)
		$Camera2D/CanvasLayer/Flashbang.modulate.a*=1.4
		if $Camera2D/CanvasLayer/Flashbang.modulate.a>0.9:
			flashbang=false
	else:
		$Camera2D/CanvasLayer/Flashbang.modulate.a/=1.1
	$Camera2D/CanvasLayer/DamageIndicator.modulate.a/=1.1
	damage_timer+=1
	dash_timer+=1
	#get_node("/root/root").vertical_off=booba_v_offset

	# Add the gravity.

	# Handle Jump.
	

	sprite_rotation_target=0.0
	if  Input.is_action_pressed("move_up"):
		velocity.y -= SPEED
	if  Input.is_action_pressed("move_down"):
		velocity.y += SPEED
	if  Input.is_action_pressed("move_right"):
		velocity.x += SPEED
	if  Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
	if  Input.is_action_just_pressed("dash"):
		
		if dash_timer > dash_delay:
			dash_timer=0
			velocity+=position.direction_to(get_global_mouse_position())*2000
			$GPUParticles2D.emitting=true
	sprite_rotation_target=velocity.x/800
	velocity/=1.1
	
	$fairy.rotation=lerp($fairy.rotation,sprite_rotation_target,0.1)
	
	
	var left_marker = get_tree().root.get_child(0).booba_marker_left
	var right_marker = get_tree().root.get_child(0).booba_marker_right
	
	$fairy/FaerieBoobaLeft.position.x = position.direction_to(left_marker).x
	$fairy/FaerieBoobaLeft.position.y = position.direction_to(left_marker).y
	$fairy/FaerieBoobaLeft.position.x = position.direction_to(right_marker).x
	$fairy/FaerieBoobaLeft.position.y = position.direction_to(right_marker).y
	
	
	
	if Input.is_action_just_pressed("change_dimmension") and can_change_dim:
		if get_tree().root.get_child(0).lock_dim:
			return
		flashbang=true
		dimension=!dimension
		change_dimension(dimension)
	if Input.is_action_just_pressed("lmb"):
		$gun_handler.shoot()
	
	if Input.is_action_just_pressed("scroll_up"):
		$Camera2D.wanna_zoom+=0.1
	if Input.is_action_just_pressed("scroll_down"):
		$Camera2D.wanna_zoom-=0.1
	if Input.is_action_just_pressed("weapon1") and unlocks[0]:
		$gun_handler.set_weapon(weapons[0])
	if Input.is_action_just_pressed("weapon2")and unlocks[1]:
		$gun_handler.set_weapon(weapons[1])
	if Input.is_action_just_pressed("weapon3")and unlocks[2]:
		$gun_handler.set_weapon(weapons[2])
	if Input.is_action_just_pressed("weapon4")and unlocks[3]:
		$gun_handler.set_weapon(weapons[3])
	if Input.is_action_just_pressed("weapon5")and unlocks[4]:
		$gun_handler.set_weapon(weapons[4])

		
		
	var collisions = move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() is enemy:
			if (damage_timer>damage_timeout):
				hp-=1;
				$Camera2D/CanvasLayer/DamageIndicator.modulate.a=1
				damage_timer=0
	
		
func _ready():
	$Camera2D.enabled=enable_camera
	change_dimension(dimension)
	$AnimationPlayer.play("RESET")


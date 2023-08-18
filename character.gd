extends CharacterBody2D


@export var SPEED = 300.0
var hp = 100
var psycha = 100
var score = 0
@export var booba_v_offset:int

var sprite_rotation_target=0.0
func set_booba_offset(inp:int ):
	booba_v_offset=inp
	get_node("/root/root").booba(inp)
func _physics_process(delta):
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
	sprite_rotation_target=velocity.x/800
	velocity/=1.1
	
	$fairy.rotation=lerp($fairy.rotation,sprite_rotation_target,0.1)
	
	
	var left_marker = get_node("/root/root").booba_marker_left
	var right_marker = get_node("/root/root").booba_marker_right
	
	$fairy/FaerieBoobaLeft.position.x = position.direction_to(left_marker).x
	$fairy/FaerieBoobaLeft.position.y = position.direction_to(left_marker).y
	$fairy/FaerieBoobaLeft.position.x = position.direction_to(right_marker).x
	$fairy/FaerieBoobaLeft.position.y = position.direction_to(right_marker).y
	
	
	
	
	if Input.is_action_just_pressed("lmb"):
		$gun_handler.shoot()
	
	if Input.is_action_just_pressed("scroll_up"):
		$Camera2D.wanna_zoom+=0.1
	if Input.is_action_just_pressed("scroll_down"):
		$Camera2D.wanna_zoom-=0.1
		
		
	move_and_slide()
		
func _ready():
	$AnimationPlayer.play("RESET")
	

extends Node2D

var booba_marker_left = Vector2.ZERO
var booba_marker_right = Vector2.ZERO
var vertical_off=0
var player_hp
var player_sanity
var player_tooths
var heart=preload("res://textures/sercegit.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func booba(inp: int):
	$booba_l.apply_central_force(Vector2(0,inp*200))
	$booba_r.apply_central_force(Vector2(0,inp*200))
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	print_debug($character.hp)
	if $character.hp >= 5:
		$CanvasLayer/GridContainer/health/TextureRect5.texture=heart
	else:
		$CanvasLayer/GridContainer/health/TextureRect5.texture=Texture2D
	
	
	if $character.hp >= 4:
		$CanvasLayer/GridContainer/health/TextureRect4.texture=heart
	else:
		$CanvasLayer/GridContainer/health/TextureRect4.texture=Texture2D
		
		
	if $character.hp >= 3:
		$CanvasLayer/GridContainer/health/TextureRect3.texture=heart
	else:
		$CanvasLayer/GridContainer/health/TextureRect3.texture=Texture2D
		
	if $character.hp >= 2:
		$CanvasLayer/GridContainer/health/TextureRect2.texture=heart
	else:
		$CanvasLayer/GridContainer/health/TextureRect2.texture=Texture2D
		
	if $character.hp >= 1:
		$CanvasLayer/GridContainer/health/TextureRect.texture=heart
	else:
		$CanvasLayer/GridContainer/health/TextureRect.texture=Texture2D
	
	$booba_l.vertical_off=vertical_off
	$booba_r.vertical_off=vertical_off

	booba_marker_left=$booba_l.position
	booba_marker_right=$booba_r.position
	pass

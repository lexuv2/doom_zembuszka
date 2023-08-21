extends Node2D

var booba_marker_left = Vector2.ZERO
var booba_marker_right = Vector2.ZERO
var vertical_off=0
var player_hp
@export var dimension = true
var player_sanity
var player_tooths=0
var heart=preload("res://textures/sercegit.png")
@export var cutscene_mode:bool=false
@export var lock_dim:bool = false
var teeth_cap=10
var open_door_pos: Vector2=Vector2.ZERO



func change_diemnsion(dim: bool):
	if lock_dim:
		return
	#1- hell
	#0-faeddd
	dimension=dim
	if dim==true:
		if $Control!=null:
			$Control.theme=load("res://doom_theme.tres")
		$dzieckowoz.disable_children()
		$demoniarnia.enable_children()
		$demoniarnia.visible=true
		$dzieckowoz.visible=false
		$TileMap_fae.visible=false
		$TileMap_doom.visible=true
	else:
		if $Control!=null:
			$Control.theme=load("res://fairy_theme.tres")
		$dzieckowoz.enable_children()
		$demoniarnia.disable_children()
		$demoniarnia.visible=false
		$dzieckowoz.visible=true
		$TileMap_doom.visible=false
		$TileMap_fae.visible=true
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func booba(inp: int):
	$booba_l.apply_central_force(Vector2(0,inp*200))
	$booba_r.apply_central_force(Vector2(0,inp*200))
	pass
	
var p1 =preload("res://textures/psycha/Psycha1.png")
var p2 =preload("res://textures/psycha/Psycha2V2.png")
var p3 =preload("res://textures/psycha/Psycha3.png")
var p4 =preload("res://textures/psycha/Psycha4.png")
var p5 =preload("res://textures/psycha/Psycha5.png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	$CanvasLayer/GridContainer/tooth_icon/Label.text = str($character.score)
	if $character.psycha >= 5:
		$CanvasLayer/GridContainer/sanity/TextureRect5.texture=p5
	else:
		$CanvasLayer/GridContainer/sanity/TextureRect5.texture=Texture2D
	
	if $character.psycha >= 4:
		$CanvasLayer/GridContainer/sanity/TextureRect4.texture=p4
	else:
		$CanvasLayer/GridContainer/sanity/TextureRect4.texture=Texture2D
		
	if $character.psycha >= 3:
		$CanvasLayer/GridContainer/sanity/TextureRect3.texture=p3
	else:
		$CanvasLayer/GridContainer/sanity/TextureRect3.texture=Texture2D
		
	if $character.psycha >= 2:
		$CanvasLayer/GridContainer/sanity/TextureRect2.texture=p2
	else:
		$CanvasLayer/GridContainer/sanity/TextureRect2.texture=Texture2D
		
	if $character.psycha >= 1:
		$CanvasLayer/GridContainer/sanity/TextureRect.texture=p1
	else:
		$CanvasLayer/GridContainer/sanity/TextureRect.texture=Texture2D
		
		
		
		
		
		
		
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
	player_tooths=$character.score
	pass
	
	



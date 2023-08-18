extends Node2D

var booba_marker_left = Vector2.ZERO
var booba_marker_right = Vector2.ZERO
var vertical_off=0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func booba(inp: int):
	$booba_l.apply_central_force(Vector2(0,inp*200))
	$booba_r.apply_central_force(Vector2(0,inp*200))
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$booba_l.vertical_off=vertical_off
	$booba_r.vertical_off=vertical_off

	booba_marker_left=$booba_l.position
	booba_marker_right=$booba_r.position
	pass

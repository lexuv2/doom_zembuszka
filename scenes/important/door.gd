class_name door

extends Node2D
@export var tooth_cap = 100
@export var next_door: door
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var opened = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_tree().root.get_child(0).player_tooths >tooth_cap ) and not opened:
		get_tree().root.get_child(0).get_node("demoniarnia").kill()
		$Sprite2D.frame=0
		$StaticBody2D.queue_free()
		pass
	pass

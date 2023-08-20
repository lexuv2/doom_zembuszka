class_name door

extends Node2D
@export var tooth_cap = 100
@export var enabled=false
@export var next_door: door
@export var spawners: Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var opened = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in spawners:
		x.turned_on=enabled
	if next_door!=null and next_door.enabled:
		enabled=false
	if (get_tree().root.get_child(0).player_tooths >tooth_cap ) and not opened:
		get_tree().root.get_child(0).get_node("demoniarnia").kill()
		$Sprite2D.frame=0
		$StaticBody2D.queue_free()
		pass
	pass

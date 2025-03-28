class_name door

extends Area2D
@export var tooth_cap = 100
@export var min_tooth_cap=0
@export var enabled=false
@export var next_door: Node2D
@export var spawners: Array[Node2D]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var opened = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for x in spawners:
		if x==null:
			continue
		x.turned_on=enabled
	if enabled:
		get_tree().root.get_child(0).teeth_cap=tooth_cap
		
	if (get_tree().root.get_child(0).player_tooths >=tooth_cap ) and not opened:
		
		get_tree().root.get_child(0).open_door_pos=position
		$Sprite2D.frame=0
		$StaticBody2D.collision_layer=0
		$StaticBody2D.collision_mask=0
		opened=true
		enabled=false
		pass
	pass


func _on_body_entered(body):
	if body is character:
		get_tree().root.get_child(0).get_node("demoniarnia").kill()
		next_door.enabled=true
		$Sprite2D.frame=3
		$StaticBody2D.collision_layer=1
		$StaticBody2D.collision_mask=1
	pass # Replace with function body.

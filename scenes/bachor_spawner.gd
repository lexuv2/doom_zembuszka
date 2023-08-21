extends Node2D
class_name spawner
@export var le_creatura: PackedScene
@export var target_node: String
@export var turned_on: bool = false
@export var is_dzieciak: bool =false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var bod=0

func _on_timer_timeout() -> void:
	if bod>0:
		return
		
	if not turned_on:
		return
	var bahor = le_creatura.instantiate()
	var spawn_loc = position
	
	bahor.position = spawn_loc
	
	if is_dzieciak and get_tree().root.get_child(0).dimension:
		bahor.collision_layer=0
		bahor.collision_layer=0
	if !is_dzieciak and !get_tree().root.get_child(0).dimension:
		bahor.collision_layer=0
		bahor.collision_layer=0
	get_tree().root.get_child(0).get_node(target_node).add_child(bahor)
	


func _on_area_2d_body_entered(body):
	bod +=1
	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	bod-=1
	pass # Replace with function body.

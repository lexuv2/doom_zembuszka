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
	if get_tree().root.get_child(0).enemies_num>=60 and not is_dzieciak:
		return
	if get_tree().root.get_child(0).dimension and is_dzieciak:
		return
	if bod>0:
		return
		
	if not turned_on:
		return
	var bahor = le_creatura.instantiate()
	var spawn_loc = position
	
	bahor.position = spawn_loc
	
	if is_dzieciak and get_tree().root.get_child(0).dimension:
		bahor.collision_layer=2
		bahor.collision_layer=2
	if !is_dzieciak and !get_tree().root.get_child(0).dimension:
		bahor.collision_layer=2
		bahor.collision_layer=2
	get_tree().root.get_child(0).get_node(target_node).add_child(bahor)
	


func _on_area_2d_body_entered(body):
	if body is enemy:
		bod +=1
	pass # Replace with function body.




func _on_area_2d_body_exited(body):
	if body is enemy:
		bod -=1
	pass # Replace with function body.

extends Node2D
class_name spawner
@export var le_creatura: PackedScene
@export var target_node: String
@export var turned_on: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	if not turned_on:
		return
	var bahor = le_creatura.instantiate()
	var spawn_loc = position
	
	bahor.position = spawn_loc
	
	
	get_tree().root.get_child(0).get_node(target_node).add_child(bahor)
	

extends Node2D

@export var le_creatura: PackedScene
@export var target_node: String
@export var turned_on: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	var bahor = le_creatura.instantiate()
	var spawn_loc = position
	
	bahor.position = spawn_loc
	
	var is_hell = get_tree().root.get_child(0).dimension
	
	if  bahor.name == 'demon' and is_hell:
		print('demon spawned')
		get_tree().root.get_child(0).get_node(target_node).add_child(bahor)

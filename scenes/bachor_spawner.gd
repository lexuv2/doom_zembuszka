extends Node2D

@export var le_creatura: PackedScene
@export var target_node: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	print('bachor spawned')
	
	var bahor = le_creatura.instantiate()
	var spawn_loc = position
	
	bahor.position = spawn_loc
	
	get_tree().root.get_child(0).get_node(target_node).add_child(bahor)

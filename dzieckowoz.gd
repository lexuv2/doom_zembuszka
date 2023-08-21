extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func enable_children():
	for x in get_children():
		var rig = x
		rig.collision_mask=1
		rig.collision_layer=1
	pass
	
func disable_children():
	for x in get_children():
		var rig = x
		rig.collision_mask=2
		rig.collision_layer=2
	pass
func kill():
	for x in get_children():
		x.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

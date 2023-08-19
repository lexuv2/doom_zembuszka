extends "res://scenes/shotgun.gd"


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("lmb"):
		get_parent().shoot()
	pass

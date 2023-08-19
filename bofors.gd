extends "res://scenes/shotgun.gd"


func _physics_process(delta):
	if Input.is_action_pressed("lmb"):
		get_parent().shoot()

extends Node2D
@onready var dialog_box=preload("res://scenes/important/dialog_box.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../character".can_change_dim=false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var dialog_ind=0
func _process(delta):
	if Input.is_action_just_pressed("change_dimmension") and $"../../character".can_change_dim==true:
		if dialog_ind==1:
			dialog_ind+=1
			$"../../character".can_change_dim==false
			var box = dialog_box.instantiate()
			box.text="Shiiiit, i got used to hell already\n"
			box.texture=load("res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png")
			add_child(box)
			if $"../../StaticBody2D"!=null:
				$"../../StaticBody2D".queue_free()
	pass


func _on_area_2d_body_entered(body):
	if body is character and dialog_ind==0:
		dialog_ind+=1
		$"../../character".can_change_dim=true
		var box = dialog_box.instantiate()
		box.text="Alright, lets see how this coin works"
		box.texture=load("res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png")
		add_child(box)
		$"../../Control/coin".visible=true
		
		pass
	pass # Replace with function body.


func _on_children_area_body_entered(body):
	if body is character and dialog_ind==2:
		dialog_ind+=1
		$"../../character".can_change_dim=true
		var box = dialog_box.instantiate()
		box.text="Aaaaagh, my head I cant stand those children"
		box.texture=load("res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png")
		add_child(box)
		$"../../Control/children_damage".visible=true
	pass # Replace with function body.

extends Node2D

var dialog_box

var dialogs = ["Fucking hangover....","I hate working with children...","I feel like my head is going to explode!","I still need to collect 10 more teeth.","Fucking finally. Time to go home."]
var auto_next =[1,1,1,0,1,1,1,1,1]
# Called when the node enters the scene tree for the first time.
var dialog_ind =0
var move_fairy=0
var textures = ["res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",]
func _ready():
	dialog_box=preload("res://scenes/important/dialog_box.tscn")
	var box = dialog_box.instantiate()
	box.text=dialogs[0]
	box.texture=load(textures[dialog_ind])
	box.skip_dialogue_notif_shown = true
	add_child(box)
	dialog_ind+=1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_child_count()==1) and auto_next[dialog_ind-1] and dialogs.size()>dialog_ind:
		if dialog_ind==3:
			$"../Label".visible=true
		var box = dialog_box.instantiate()
		box.text=dialogs[dialog_ind]
		box.texture=load(textures[dialog_ind])
		box.skip_dialogue_notif_shown = true
		add_child(box)
		dialog_ind+=1
		
	if get_tree().root.get_child(0).player_tooths>=10 and dialog_ind==4:
		var box = dialog_box.instantiate()
		box.text=dialogs[dialog_ind]
		box.texture=load(textures[dialog_ind])
		add_child(box)
		dialog_ind+=1
		$"../../character".lock_controlls=true
		$"../Timer_outro".start()
		$Timer.start()

	
	pass

func _physics_process(delta):
	if move_fairy:
		$"../../character/NavigationAgent2D".target_position=$"../../Marker2D".position
		$"../../character".velocity=$"../../character".position.direction_to($"../../character/NavigationAgent2D".get_next_path_position())*100
		$"../../character".move_and_slide()
var started =false
func _on_timer_timeout():
	$"../../character/NavigationAgent2D".target_position=$"../../Marker2D".position
	move_fairy=true
	if not started:
		$"../Timer_outro".start()
		started=true
	pass # Replace with function body.


func _on_timer_outro_timeout():
	get_tree().change_scene_to_file("res://scenes/important/scene2.tscn")
	pass # Replace with function body.

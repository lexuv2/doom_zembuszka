extends Node2D

var dialog_box

var dialogs = ["You all did a great job today, we have collected\n 318 teeth today",
"unfortunately there is one problem...",
"Our top Hell employee needs a vacation\n to recharge from his hard work.\n We need a volunteer to take over his duties.",
"Ugh........",
"I dont know how to operate a gun!",
"That's so brutal!",
"It's to dangerous",
"This sounds like something for me, I'm In.\n Anything for a break from those bloody children. ",]
var auto_next =[1,1,1,1,1,1,1,1,1,1,1,1]
var textures = ["res://scenes/important/portraits/hr.png",
"res://scenes/important/portraits/hr.png",
"res://scenes/important/portraits/hr.png",
"res://scenes/important/portraits/doomguy-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_green-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_blue-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_yellow-sheet.png",
"res://scenes/important/portraits/faerie_fae_idle_normalEyes_spritesheet-sheet-sheet.png",
]
# Called when the node enters the scene tree for the first time.
var dialog_ind =0
var move_fairy=0

func _ready():
	dialog_box=preload("res://scenes/important/dialog_box.tscn")
	var box = dialog_box.instantiate()
	box.text=dialogs[0]
	box.texture=load(textures[dialog_ind])
	add_child(box)
	dialog_ind+=1
	pass # Replace with function body.

func fuck_yeah():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (get_child_count()==0) and auto_next[dialog_ind-1] and dialogs.size()>dialog_ind:
		var box = dialog_box.instantiate()
		box.text=dialogs[dialog_ind]
		box.texture=load(textures[dialog_ind])
		add_child(box)
		dialog_ind+=1
		

	
	pass

func _physics_process(delta):
	pass

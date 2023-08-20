extends Control

@export var text: String = "Fucking hangover...."

var text_timer=0
var displayed_text_size=0
@export var text_speed = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer/HBoxContainer/Label.text=""
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		queue_free()
	if displayed_text_size>=text.length():
		return
	if text_timer>text_speed:
		$PanelContainer/HBoxContainer/Label.text+=text[displayed_text_size]
		displayed_text_size+=1
		text_timer=0
	text_timer+=1
	pass

extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text= "Collect teeth by getting 
close to children and pressing F
%s more left" % clamp(10-get_tree().root.get_child(0).player_tooths,0,10 )
	pass

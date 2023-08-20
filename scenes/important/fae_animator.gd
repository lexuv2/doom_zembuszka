extends Sprite2D


var timer=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer+=1
	if (timer>2):
		timer=0
		frame+=1
		if frame==12:
			frame=0
	pass

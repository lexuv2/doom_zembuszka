extends Camera2D


# Called when the node enters the scene tree for the first time.
var wanna_zoom =1.0
var vel =Vector2.ZERO
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func _physics_process(delta):
	position+=vel
	vel/=2
	zoom.x = lerp(zoom.x,wanna_zoom,0.1)
	zoom.y = lerp(zoom.y,wanna_zoom,0.1)
	zoom = zoom.clamp(Vector2(1,1),Vector2(3,3))
	wanna_zoom = clamp(wanna_zoom,1.0,3.0)
	position = position.move_toward(Vector2.ZERO,10)

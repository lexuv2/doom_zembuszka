extends Sprite2D
@export var unlock_ind=0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_area_2d_body_entered(body):
	if body is character and $ZombV2.visible:
		var bd = body as character
		bd.unlocks[unlock_ind]=1
		queue_free()
	pass # Replace with function body.

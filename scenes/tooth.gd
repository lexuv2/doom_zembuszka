extends Node2D
@export_color_no_alpha  var blink_color:Color

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var papaj:bool =false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if papaj:
		$ZombV2.modulate = $ZombV2.modulate.lerp(blink_color,0.05)

	else:
		$ZombV2.modulate = $ZombV2.modulate.lerp(Color(1,1,1),0.05)

	pass


func _on_timer_timeout():
	papaj=!papaj
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body is character:
		var bd = body as character
		bd.score+=1
		$GPUParticles2D.emitting=true
		$GPUParticles2D.reparent(get_node("/root/root/"))
		queue_free()
	pass # Replace with function body.

extends RigidBody2D
@export_color_no_alpha  var blink_color:Color

func _ready():
	var rnd = 100
	apply_central_impulse(Vector2(randf_range(-rnd,rnd),randf_range(-rnd,rnd)))

@export var papaj:bool =false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ZombV2.visible=!get_node("/root/root").dimension	
	collision_layer=$ZombV2.visible
	collision_mask=$ZombV2.visible
	
	if papaj:
		$ZombV2.modulate = $ZombV2.modulate.lerp(blink_color,0.05)

	else:
		$ZombV2.modulate = $ZombV2.modulate.lerp(Color(1,1,1),0.05)

	pass



func _on_timer_timeout():
	papaj=!papaj
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if body is character and $ZombV2.visible:
		var bd = body as character
		bd.score+=1
		$GPUParticles2D.emitting=true
		$GPUParticles2D.reparent(get_node("/root/root/"))
		queue_free()
	pass # Replace with function body.

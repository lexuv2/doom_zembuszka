extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text="Collect %d more teeth to advance to next area" % (clamp($"../..".teeth_cap-$"../..".player_tooths,0,1000000))
	if clamp($"../..".teeth_cap-$"../..".player_tooths,0,1000000)==0:
		$Label2.visible=true
	else:
		$Label2.visible=false
	pass

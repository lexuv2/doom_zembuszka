extends enemy


var papaj_timer=0

func _physics_process(delta):
	papaj_timer+=1
	if papaj_timer>3:
		papaj_timer=0
		$"82530246".frame+=1
		if $"82530246".frame>=10:
			$"82530246".frame=0
	super(delta)

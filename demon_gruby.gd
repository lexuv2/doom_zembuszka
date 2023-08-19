extends "res://demon.gd"

@export var charging_time = 60*3
@export var charge_delay= 60*6
@export var charging_speed=1000

var chargig_time_timer=0
var charging_delay_timer=0;
var charge_mult:Vector2 = Vector2.ONE

func _physics_process(delta):
	
	
	chargig_time_timer+=1
	charging_delay_timer+=1
	var rng = (charging_delay_timer/(charge_delay/3))
	$"82530246".position+=Vector2(randf_range(-rng,rng),randf_range(-rng,rng))
	
	
	if (charging_delay_timer>charge_delay):
		$"82530246".position=Vector2.ZERO
		charge_mult=glob_direction*charging_speed
		charging_delay_timer=0
	velocity+=charge_mult
	charge_mult/=1.05
	super(delta)
		
	
	

extends HSlider

var _bus := AudioServer.get_bus_index('Master')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = (AudioServer.get_bus_volume_db(_bus))
	
	print(value)


func _on_value_changed(value: float) -> void:
	print(value)
	
	AudioServer.set_bus_volume_db(_bus, value)
	

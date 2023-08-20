extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/important/scene1.tscn")
	get_tree().paused = false
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed('pause'):
		print('esc')
		
		var is_pauesd = get_tree().paused
		get_tree().paused = !is_pauesd
		
		hide()


func _on_resume_pressed() -> void:
	get_tree().paused = false
	hide()

func _on_aiom_menu_pressed() -> void:
	get_tree().change_scene_to_file('res://start.tscn')
	get_tree().paused = false
	hide()

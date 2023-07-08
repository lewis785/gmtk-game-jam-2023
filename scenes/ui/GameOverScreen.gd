extends CanvasLayer



func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_quit_pressed():
	get_tree().quit()

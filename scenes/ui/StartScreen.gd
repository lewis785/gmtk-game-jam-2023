extends CanvasLayer

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/HowToPlay.tscn")

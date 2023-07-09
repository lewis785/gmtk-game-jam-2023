extends CanvasLayer



func _on_restart_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	
func set_score(score):
	var score_label = $PanelContainer/MarginContainer/Rows/VBoxContainer/ScoreValue
	score_label.text = str(score)

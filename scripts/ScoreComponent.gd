class_name ScoreComponent extends Node

var signal_bus

func _on_ready():
	signal_bus = get_node("/root/SignalBus")

func add_score(score: int):
	#signal_bus.emit_signal("score_update", score)
	pass

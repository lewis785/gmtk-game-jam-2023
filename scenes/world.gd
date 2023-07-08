extends Node2D

const GameOverScreen = preload("res://scenes/ui/GameOverScreen.tscn")

var signal_bus

func _ready():
	signal_bus = get_node("/root/SignalBus")
	signal_bus.connect("game_over", game_over)
	
func game_over():
	get_tree().paused = true
	var game_over = GameOverScreen.instantiate()
	add_child(game_over)

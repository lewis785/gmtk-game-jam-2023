extends Node

var signal_bus
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	signal_bus = get_node("/root/SignalBus")
	signal_bus.connect('score_update', update_score)

func update_score(value: int):
	score += value


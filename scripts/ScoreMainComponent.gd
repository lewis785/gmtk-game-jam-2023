class_name ScoreMainComponent
extends Node

var signal_bus
var score
var score_audio_increase: AudioStreamPlayer
var score_audio_decrease: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	score_audio_increase = $IncreaseAudioStreamPlayer
	score_audio_decrease = $DecreaseAudioStreamPlayer
	score = 0
	signal_bus = get_node("/root/SignalBus")
	signal_bus.connect('score_update', update_score)

func update_score(value: int):
	if value > 0:
		score_audio_increase.play()
	elif value < 0:
		score_audio_decrease.play()
	score += value

func get_score():
	return score

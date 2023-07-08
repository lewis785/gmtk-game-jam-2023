extends CanvasLayer

@export var camera: Camera2D
@export var tc: TimerComponent
#@export var score: ScoreComponent
var score = 0

var signal_bus
var score_label: Label
var time_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	signal_bus = get_node("/root/SignalBus")
	signal_bus.connect('score_update', update_score)
	score_label = $ScoreLabel
	time_label  = $TimeLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_time_label(int(ceil(tc.get_time_left())))

func update_score(points):
	score += points
	update_score_label(score)

func update_score_label(score):
	score_label.text = str(score)

func update_time_label(time):
	time_label.text = time_to_text(time)

# Converts number of seconds to M:SS format
func time_to_text(time):
	var minutes = "%02d" % floor(time/60)
	var seconds = "%02d" % (time%60)
	return minutes + ":" + seconds


func _on_timer_component_timeout():
	time_label.text = "00:00"

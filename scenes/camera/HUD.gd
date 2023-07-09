extends CanvasLayer

@export var camera: Camera2D
@export var tc: TimerComponent
@export var config: ConfigComponent
#@export var score: ScoreComponent
var score = 0

var signal_bus
var score_label: Label
var time_label: Label
var music_muted: bool
var fx_muted: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	signal_bus = get_node("/root/SignalBus")
	signal_bus.connect('score_update', update_score)
	score_label = $ScoreLabel
	time_label  = $TimeLabel
	
	music_muted = config.load_value("sound", "music_muted", false)
	fx_muted = config.load_value("sound", "fx_muted", false)
	set_music_muted(music_muted)
	set_fx_muted(fx_muted)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_time_label(int(ceil(tc.get_time_left())))

func update_score(points):
	score += points
	update_score_label(score)

func update_score_label(score):
	score_label.text = str(score)

func update_time_label(time):
	time_label.text = str(time)


func _on_timer_component_timeout():
	time_label.text = "00:00"

func is_left_click(event):
	if (!event is InputEventMouseButton || !event.pressed):
		return false
	return event.button_index == MOUSE_BUTTON_LEFT

func set_music_muted(is_muted):
	var asset_name = "Sound_Off" if is_muted else "Sound_On"
	$MusicToggle.texture = load("res://assets/ui/"+ asset_name + ".png")
	config.save_value("sound", "music_muted", is_muted)
	AudioServer.set_bus_mute(2, is_muted)

func set_fx_muted(is_muted):
	var asset_name = "FX_Off" if is_muted else "FX_On"
	$FxToggle.texture = load("res://assets/ui/"+ asset_name + ".png")
	config.save_value("sound", "fx_muted", is_muted)
	AudioServer.set_bus_mute(1, is_muted)

func _on_music_toggle_gui_input(event):
	if is_left_click(event):
		music_muted = !music_muted
		set_music_muted(music_muted)

func _on_fx_toggle_gui_input(event):
	if is_left_click(event):
		fx_muted = !fx_muted
		set_fx_muted(fx_muted)

class_name TimerComponent
extends Timer

@export var time_limit: int = 120

var signal_bus

func _ready():
	signal_bus = get_node("/root/SignalBus")
	start_game()

func start_game():
	self.start(time_limit)

func _on_timeout():
	signal_bus.emit_signal("game_over")

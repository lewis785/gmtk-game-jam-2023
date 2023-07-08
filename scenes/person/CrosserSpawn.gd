class_name CrosserSpawn
extends Area2D

@export var crossers: Array[PackedScene]
@export_range(0.0, 1.0, 0.1) var spawn_change
@export_range(0.0, 1.0, 0.1) var frog_spawn_rate = 0.2

var min_spacing = 5
var time_since_last = 5
var rng = RandomNumberGenerator.new()

func type_of_crosser_to_spawn():
	var random_number = rng.randf_range(0.0, 1.0)
	if random_number < frog_spawn_rate:
		return crossers[1].instantiate()
	return crossers[0].instantiate()

func spawn_crosser():
	var crosser = type_of_crosser_to_spawn()
	crosser.position = crosser.position - Vector2(5, -4)
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(crosser, "scale", Vector2(1.5, 1.5), 1)
	tween.parallel().tween_property(crosser, "position:y" , -4, 1).as_relative()
	self.add_child(crosser)

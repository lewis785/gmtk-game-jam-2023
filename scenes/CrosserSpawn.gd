extends Area2D

@export var crossers: Array[PackedScene]
@export_range(0.0, 1.0, 0.1) var spawn_change

var min_spacing = 5
var time_since_last = 5
var rng = RandomNumberGenerator.new()

func spawn_crosser():
	var crosser = crossers[0].instantiate()
	crosser.position = crosser.position - Vector2(5, -4)
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(crosser, "scale", Vector2(2.5, 2.5), 1)
	tween.parallel().tween_property(crosser, "position:y" , -4, 1).as_relative()
	self.add_child(crosser)

func _on_timer_timeout():
	time_since_last += 1
	if time_since_last < min_spacing:
		return
		
	var random_number = rng.randf_range(0.0, 1.0)
	
	if random_number <= spawn_change:
		time_since_last = 0
		spawn_crosser()

	
	

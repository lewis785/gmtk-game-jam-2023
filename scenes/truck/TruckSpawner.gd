extends Area2D

@export var truck_scene : PackedScene

func _input_event( viewport, event, shape_idx):
	if (!event is InputEventMouseButton || !event.pressed):
		return	
	
	var truck = truck_scene.instantiate()
	add_child(truck)

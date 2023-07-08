extends Area2D

@export var truck_scene : PackedScene
@export var collision: CollisionPolygon2D

func _ready():
	if collision:
		$Highlight.polygon = collision.polygon
		$Highlight.position = collision.position
	

func _input_event( viewport, event, shape_idx):
	if (!event is InputEventMouseButton || !event.pressed):
		return	
	
	var truck = truck_scene.instantiate()
	add_child(truck)


func _on_mouse_entered():
	$Highlight.show()

func _on_mouse_exited():
	$Highlight.hide()


func _on_body_exited(body):
	if body.is_in_group("Truck"):
		print("Removed")
		body.queue_free()
		

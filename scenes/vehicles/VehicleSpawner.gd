extends Area2D

@export var truck_scene : PackedScene
@export var collision: CollisionPolygon2D
@export var hover_color: Color
@export var blocked_spawn_color: Color

var can_spawn = true

func _ready():
	allow_spawning()
	if collision:
		$Highlight.polygon = collision.polygon
		$Highlight.position = collision.position
	
func allow_spawning():
	can_spawn = true
	$Highlight.color = hover_color
	
func disable_spawning():
	can_spawn = false
	$Highlight.color = blocked_spawn_color

func is_left_click(event):
	if (!event is InputEventMouseButton || !event.pressed):
		return false
	
	return event.button_index == MOUSE_BUTTON_LEFT

func _input_event( viewport, event, shape_idx):
	if (is_left_click(event) && can_spawn):		
		disable_spawning()
		var truck = truck_scene.instantiate()
		add_child(truck)
	
func _on_mouse_entered():
	$Highlight.show()

func _on_mouse_exited():
	$Highlight.hide()

func _on_body_exited(body):
	if body.is_in_group("Vehicle"):
		body.queue_free()

func _on_vehicle_spawn_area_body_exited(body):
	if body.is_in_group("Vehicle"):
		allow_spawning()

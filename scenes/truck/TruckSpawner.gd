extends Area2D

@export var truck_scene : PackedScene
@export var collision: CollisionPolygon2D
@export var score: ScoreComponent

func _ready():
	if collision:
		$Highlight.polygon = collision.polygon
		$Highlight.position = collision.position
	

func _input_event( viewport, event, shape_idx):
	if !event is InputEventMouseButton:
		pass
	
	if !event.pressed || event.button_index != MOUSE_BUTTON_LEFT:
		return	
	
	var truck = truck_scene.instantiate()
	add_child(truck)

func increase_score(value):
	if score is ScoreComponent:
		score.add_score(value)
	
func _on_mouse_entered():
	$Highlight.show()

func _on_mouse_exited():
	$Highlight.hide()

func _on_body_exited(body):
	if body.is_in_group("Vehicle"):
		increase_score(body.score_value)
		body.queue_free()
		

extends CollisionShape2D

@export var score_comp: ScoreComponent
@export var move_comp: MovementComponent
@export var collision_audio: AudioStreamPlayer2D

@export var collision_score = 0 # Score gained for getting hit by vehicle
@export var end_score = 0 # Score gained for reaching end

var is_done: bool = false

func _on_collision_component_body_entered(body):
	print(body)
	if is_done:
		return
	if body.is_in_group("Vehicle"):
		vehicle_collision()

func vehicle_collision():
	is_done = true
	score_comp.add_score(collision_score)
	move_comp.stop()
	collision_audio.play()
	await collision_audio.finished
	self.get_parent().queue_free()

func end_collision():
	is_done = true
	score_comp.add_score(end_score)
	#move_comp.stop()


func _on_collision_component_area_entered(area):
	print(area)
	if is_done:
		return
	if area.is_in_group("End"):
		end_collision()


func _on_collision_component_area_exited(area):
	if area.is_in_group("End"):
		self.get_parent().queue_free()

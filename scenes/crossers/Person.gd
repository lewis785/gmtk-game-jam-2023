extends CollisionShape2D

@export var score_comp: ScoreComponent
@export var move_comp: MovementComponent
@export var collision_audio: AudioStreamPlayer2D
@export var multiplier_label: Label
@export var text_emitter: Node2D

@export var collision_score = 0 # Score gained for getting hit by vehicle
@export var end_score = 0 # Score gained for reaching end

var multiplier: int = 1
var is_done: bool = false

func _on_collision_component_body_entered(body):
	if is_done:
		return
	if body is Vehicle:
		vehicle_collision(body)

func vehicle_collision(vehicle: Vehicle):
	vehicle.sprite.make_bloody()
	is_done = true
	score_comp.add_score(collision_score)
	var score_text = "%d" % collision_score
	if text_emitter != null: text_emitter.emit_text(score_text, 1.0)
	stop()
	collision_audio.play()
	await collision_audio.finished
	self.queue_free()

func near_miss():
	multiplier = multiplier * 2
	multiplier_label.text = str(multiplier)+"x"
	if text_emitter != null: text_emitter.emit_text("NEAR MISS!", 0.5)

func end_collision():
	is_done = true
	var final_score = end_score * multiplier
	score_comp.add_score(final_score)
	var score_text = "+%d" % final_score
	if text_emitter != null: text_emitter.emit_text(score_text, 1.0)


func _on_collision_component_area_entered(area):
	if is_done:
		return
	if area.is_in_group("End"):
		end_collision()


func _on_collision_component_area_exited(area):
	if area.is_in_group("End"):
		self.queue_free()


func _on_near_miss_area_body_exited(body):
	if !is_done:
		if body.is_in_group("Vehicle"):
			near_miss()

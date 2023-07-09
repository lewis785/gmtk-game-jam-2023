extends MovementComponent

@export var score_comp: ScoreComponent
@export var collision_audio: AudioStreamPlayer2D
@export var text_emitter: Node2D

@export var collision_score = 0 # Score gained for getting hit by vehicle
@export var end_score = 0 # Score gained for reaching end

var is_done: bool = false
var tween: Tween
	
func _ready():
	tween = get_tree().create_tween()
	tween.bind_node(self)
	growShrinkSprite()	
	
func growShrinkSprite():
	tween.set_loops()
	tween.tween_property(self, "scale", Vector2(0.2, 0.2), 0.4).as_relative()
	tween.tween_property(self, "scale", Vector2(-0.2, -0.2), 0.4).as_relative()

func _on_collision_component_body_entered(body):
	if is_done:
		return
	if body.is_in_group("Vehicle"):
		vehicle_collision()

func vehicle_collision():
	tween.stop()
	is_done = true
	score_comp.add_score(collision_score)
	var score_text = "+%d" % collision_score
	if text_emitter != null: text_emitter.emit_text(score_text, 1.0)
	stop()
	collision_audio.play()
	await collision_audio.finished
	self.queue_free()

func end_collision():
	is_done = true
	score_comp.add_score(end_score)
	var score_text = "%d" % end_score
	if text_emitter != null: text_emitter.emit_text(score_text, 1.0)

func _on_collision_component_area_entered(area):
	if is_done:
		return
	if area.is_in_group("End"):
		end_collision()

func _on_collision_component_area_exited(area):
	if area.is_in_group("End"):
		self.queue_free()


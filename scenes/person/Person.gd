extends CollisionShape2D

@export var score_comp: ScoreComponent
@export var collision_audio: AudioStreamPlayer2D
@export var collision_score = 0

func _on_collision_component_body_entered(body):
	if body.is_in_group("Vehicle"):
		score_comp.add_score(collision_score)
		collision_audio.play()
		var parent = self.get_parent()
		parent.hide()
		await collision_audio.finished
		parent.queue_free()

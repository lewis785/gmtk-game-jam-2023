extends CollisionShape2D

@export var score_comp: ScoreComponent
@export var move_comp: MovementComponent
@export var collision_audio: AudioStreamPlayer2D
@export var collision_score = 0

var is_alive: bool = true


func _on_collision_component_body_entered(body):
	if !is_alive:
		return
	if body.is_in_group("Vehicle"):
		is_alive = false
		score_comp.add_score(collision_score)
		move_comp.stop()
		collision_audio.play()
		await collision_audio.finished
		self.get_parent().queue_free()

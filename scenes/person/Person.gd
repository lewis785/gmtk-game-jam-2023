extends CollisionShape2D

@export var score_comp: ScoreComponent
@export var collision_score = 0

func _on_collision_component_body_entered(body):
	if body.is_in_group("Vehicle"):
		score_comp.add_score(collision_score)
		self.get_parent().queue_free()

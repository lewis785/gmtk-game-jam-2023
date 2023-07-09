extends MovementComponent

var tween: Tween
	
func _ready():
	tween = get_tree().create_tween()
	tween.bind_node(self)
	growShrinkSprite()	
	
func growShrinkSprite():

	tween.set_loops()
	tween.tween_property(self, "scale", Vector2(0.2, 0.2), 0.4).as_relative()
	tween.tween_property(self, "scale", Vector2(-0.2, -0.2), 0.4).as_relative()

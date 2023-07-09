extends Sprite2D

var frames = texture.get_width() / region_rect.size.x

func _ready():
	var random_index = randi_range(0, frames - 1)
	region_rect.position.x = random_index * region_rect.size.x

func make_bloody():
	region_rect.position.y = region_rect.size.y

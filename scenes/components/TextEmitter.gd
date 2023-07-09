extends Node2D

@export var fontFile: FontFile

func create_label(text: String):
	var label = Label.new()
	label.text = text
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.scale = Vector2(0.1, 0.1)
	label.size = label.get_parent_area_size() # Is this line necessary?
	label.add_theme_font_override("font", fontFile)
	label.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	add_child(label)
	
	label.position.x -= (label.size.x / 2)
	return label

func emit_text(text: String, duration: float):
	var label = create_label(text)
	var tween = label.get_tree().create_tween()
	tween.parallel().tween_property(label, "scale", Vector2(1, 1), 0.2)
	tween.parallel().tween_property(label, "position:y" , -50, 0.2).as_relative()
	if duration > 0:
		await get_tree().create_timer(duration).timeout
		label.queue_free()
		

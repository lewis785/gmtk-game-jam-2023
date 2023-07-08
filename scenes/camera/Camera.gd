extends Camera2D

@export var map: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var x = map.get_window().size.x
	var y = map.get_window().size.y
	print(x)
	print(y)
	self.limit_right = x
	self.limit_bottom = y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

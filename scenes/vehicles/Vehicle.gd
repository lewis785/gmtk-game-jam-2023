class_name Vehicle
extends MovementComponent

@export var score_value: int = 10

var sprite: Sprite2D

func _ready():
	sprite = $VehicleSprite


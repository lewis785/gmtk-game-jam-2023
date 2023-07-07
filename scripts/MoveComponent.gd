extends CharacterBody2D

@export var speed = 1000.0
@export_enum("UP", "RIGHT") var direction = "UP"

var movementDirection = {
	"UP": Vector2.UP,
	"RIGHT": Vector2.RIGHT
}

func move(delta: float):
	velocity = movementDirection[direction] * speed * delta
	move_and_slide()

func _physics_process(delta):
	move(delta)

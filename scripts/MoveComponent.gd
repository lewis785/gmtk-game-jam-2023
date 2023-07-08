extends CharacterBody2D

@export var speed = 1000.0
@export_enum("UP", "RIGHT") var direction = "UP"
@export var animation: AnimationPlayer
@export var cb: CharacterBody2D

var movementDirection = {
	"UP": Vector2.UP,
	"RIGHT": Vector2.RIGHT
}

func move(delta: float):
	velocity = movementDirection[direction] * speed * delta
	if animation != null:
		animation.play("default")
	cbmove_and_slide()

func _physics_process(delta):
	move(delta)

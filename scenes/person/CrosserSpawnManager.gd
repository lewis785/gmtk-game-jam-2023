extends Node2D

@export_range(0, 1, 0.1) var base_spawn_rate = 0.5
@export_range(0, 1, 0.05) var base_increase_amount = 0.05
@export_range(0, 60, 10) var base_increase_period = 20

var spawners: Array[CrosserSpawn] = []
var rng = RandomNumberGenerator.new()
var spawn_rate: float
var previous_spawn = 0
var time_since_base_increase = 0

func _ready():
	spawn_rate = base_spawn_rate 
	get_spawners()

func get_spawners():
	for child in get_children():
		if is_instance_of(child, CrosserSpawn):
			spawners.append(child)
	assert(spawners.size() > 0, "ERROR: spawn manager requires spawners")	

func spawn():
	spawn_rate = base_spawn_rate
	var rand_index = randi() % spawners.size()
	
	if (rand_index == previous_spawn):
		rand_index = (rand_index + 1) % spawners.size()
		
	previous_spawn = rand_index
	spawners[rand_index].spawn_crosser()

func increase_base_spawn_rate():
	time_since_base_increase += 1
	if time_since_base_increase >= base_increase_period:
		time_since_base_increase = 0
		base_spawn_rate += base_increase_amount

func _on_timer_timeout():
	var random_number = rng.randf_range(0.0, 1.0)
	increase_base_spawn_rate()
	if random_number <= spawn_rate:
		spawn()
	else:
		spawn_rate += 0.05

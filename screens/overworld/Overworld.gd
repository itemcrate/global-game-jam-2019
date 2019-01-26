extends Node

onready var obstacle_path = "res://entities/obstacle/obstacle.tscn"
onready var tilemap = $TileMap

onready var wave = $wave

func _ready():
	spawn_obstacles(10)

func spawn_obstacles(number):
	for n in range(number):
		var new_obstacle = load(obstacle_path).instance()

		# Randomly assign a tile cell to the new obstacle
		randomize()
		var tile_position = tilemap.world_to_map(Vector2(randi() % 512, randi() % 448))
		new_obstacle.position = tilemap.map_to_world(tile_position)

		self.add_child(new_obstacle)

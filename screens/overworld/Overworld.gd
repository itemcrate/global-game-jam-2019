extends Node

onready var collectible_path = "res://entities/collectible/collectible.tscn"
onready var obstacle_path = "res://entities/obstacle/obstacle.tscn"
onready var tilemap = $TileMap
onready var wave = $wave

func _ready():
	GameData.reset()
	spawn_collectibles(10)
	spawn_obstacles(10)
	$BackgroundAudioPlayer.play()
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		wave.flow()

func spawn(scene_path):
	var new_obstacle = load(scene_path).instance()

	# Randomly assign a tile cell to the new obstacle
	randomize()
	var tile_position = tilemap.world_to_map(Vector2(rand_range(1, 511), rand_range(1, 447)))
	new_obstacle.position = tilemap.map_to_world(tile_position)

	self.add_child(new_obstacle)

func spawn_collectibles(number):
	for n in range(number):
		spawn(collectible_path)

func spawn_obstacles(number):
	for n in range(number):
		spawn(obstacle_path)

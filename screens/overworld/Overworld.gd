extends Node

onready var collectible_path = "res://entities/collectible/collectible.tscn"
onready var obstacle_path = "res://entities/obstacle/obstacle.tscn"
onready var tilemap = $TileMap
onready var wave = $wave
onready var bg_audio_pos = 0.0
onready var hazardTimer_min = 12
onready var hazardTimer_max = 35

func _ready():
	GameData.reset()
	spawn_collectibles(10)
	spawn_obstacles(10)
	$BackgroundAudioPlayer.play()
	$HazardTimer.wait_time = randi()%hazardTimer_max + hazardTimer_min
	print($HazardTimer.wait_time)
	$HazardTimer.start()
	
func _input(event):
	if event.is_action_pressed("ui_select") && GameState.get_state() == GameState.READY:
		#start_danger_event("wave")
		pass
	elif event.is_action_pressed("ui_select"):
		GameState.set_scene("res://screens/title/title.tscn")

func start_danger_event(hazard):
		$HUDLayer/HUD.show_alert()
		bg_audio_pos = $BackgroundAudioPlayer.get_playback_position()
		$WarningAudioPlayer.play()
		yield($WarningAudioPlayer, "finished")
		$BackgroundAudioPlayer.stop()
		$DangerAudioPlayer.play()
		yield($HUDLayer/HUD/AlertTimer, "timeout")
		if(hazard == "wave"):
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


func _on_DangerAudioPlayer_finished():
	# start playing bg audio again
	$BackgroundAudioPlayer.play(bg_audio_pos)


func _on_HazardTimer_timeout():
	start_danger_event("wave")
	$HazardTimer.wait_time = randi()%hazardTimer_max + hazardTimer_min
	print($HazardTimer.wait_time)
	$HazardTimer.start()

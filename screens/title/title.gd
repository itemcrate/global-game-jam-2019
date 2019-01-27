extends Node

export (PackedScene) var next_scene

func _ready():
	GameState.set_state(GameState.READY)
	GameData.reset()
	$TitleAudioPlayer.play()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		$TitleAudioPlayer.stop()
		GameState.set_scene(next_scene, true)

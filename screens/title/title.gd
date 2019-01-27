extends Node

export (PackedScene) var next_scene

func _ready():
    $TitleAudioPlayer.play()
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		$TitleAudioPlayer.stop()
		GameState.set_scene(next_scene, true)

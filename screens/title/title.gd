extends Node

export (PackedScene) var next_scene

func _ready():
    pass
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		GameState.set_scene(next_scene, true)

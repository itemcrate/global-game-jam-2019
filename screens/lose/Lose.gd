extends CanvasLayer

export (PackedScene) var next_scene

onready var instructions = $Control/Container/Instructions
onready var tween = $Control/LoseTween

var music_done = false

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_select") && music_done:
		GameState.set_scene(next_scene, true)

# SIGNALS

func _on_LoseAudio_finished():
	music_done = true
	tween.interpolate_property(instructions, "modulate", Color(1,1,1,0), Color(1,1,1,1), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

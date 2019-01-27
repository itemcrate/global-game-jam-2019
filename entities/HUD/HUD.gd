extends CanvasLayer

onready var color_sprite = $StatsContainer/HBox/Color
onready var progress_label = $StatsContainer/HBox/ProgressLabel

func _ready():
	update_progress()

func update_progress():
	progress_label.text = str(GameData.get("totalRequired") - GameData.get("totalCollected"))
	color_sprite.set_texture(load("res://assets/sprites/" + GameData.get("colorRequired") + "_hud_icon.png"))
	if GameData.get("totalCollected") == GameData.get("totalRequired"):
		GameState.set_state(GameState.WIN)

func show_alert():
	$AnimationPlayer/AlertContainer/AlertSprite.show()
	$AnimationPlayer.play("AlertAnimation")
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	$AnimationPlayer/AlertContainer/AlertSprite.hide()

func check_end_state():
	# Placeholder text/show hide
	if GameState.get_state() == GameState.LOSE:
		GameState.set_scene("res://screens/lose/Lose.tscn")
	elif GameState.get_state() == GameState.WIN:
		GameState.set_scene("res://screens/victory/Victory.tscn")

func _physics_process(delta):
	update_progress()
	check_end_state()
	
extends CanvasLayer

onready var alert_label = $AnimationPlayer/AlertContainer/AlertLabel
onready var color_sprite = $StatsContainer/HBox/Color
onready var progress_label = $StatsContainer/HBox/ProgressLabel

func _ready():
	update_progress()
	color_sprite.set_texture(load("res://assets/sprites/" + GameData.get("colorRequired") + "_pickup1.png"))
	alert_label.hide()

func update_progress():
	progress_label.text = str(GameData.get("totalRequired") - GameData.get("totalCollected"))

	if GameData.get("totalCollected") == GameData.get("totalRequired"):
		GameState.set_state(GameState.WIN)

func show_alert():
	alert_label.text = "DANGER!"
	alert_label.show()
	$AnimationPlayer.play("AlertAnimation")
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	alert_label.hide()

func check_end_state():
	# Placeholder text/show hide
	if GameState.get_state() == GameState.LOSE:
		$LoseText.show()
	elif GameState.get_state() == GameState.WIN:
		$WinText.show()

func _physics_process(delta):
	update_progress()
	check_end_state()
	
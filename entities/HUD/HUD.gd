extends CanvasLayer

func _ready():
	update_progress()
	set_goal_label(GameData.get("colorRequired").capitalize() + " Shell")
	$AnimationPlayer/AlertContainer/AlertLabel.hide()

func update_progress():
	$StatsContainer/Panel/ProgressLabel.text = str(GameData.get("totalCollected")) +"/"+ str(GameData.get("totalRequired"))
	
	if GameData.get("totalCollected") == GameData.get("totalRequired"):
		GameState.set_state(GameState.WIN)
	
func set_goal_label(text):
	$StatsContainer/Panel/GoalLabel.text = "Goal: " + str(text)

func show_alert():
	$AnimationPlayer/AlertContainer/AlertLabel.text = "DANGER!"
	$AnimationPlayer/AlertContainer/AlertLabel.show()
	$AnimationPlayer.play("AlertAnimation")
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	$AnimationPlayer/AlertContainer/AlertLabel.hide()

func check_end_state():
	# Placeholder text/show hide
	if GameState.get_state() == GameState.LOSE:
		$LoseText.show()
	elif GameState.get_state() == GameState.WIN:
		$WinText.show()

func _physics_process(delta):
	update_progress()
	check_end_state()
	
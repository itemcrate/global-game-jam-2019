extends CanvasLayer

func _ready():
	update_progress()
	$AnimationPlayer/AlertContainer/AlertLabel.hide()

func update_progress():
	if $StatsContainer/Panel/GoalLabel.text != GameData.get("colorRequired"):
		set_goal_label(GameData.get("colorRequired").capitalize())
		
	$StatsContainer/Panel/ProgressLabel.text = str(GameData.get("totalCollected")) +"/"+ str(GameData.get("totalRequired"))
	
	if GameData.get("totalCollected") == GameData.get("totalRequired"):
		GameState.set_state(GameState.WIN)
	
func set_goal_label(text):
	$StatsContainer/Panel/GoalLabel.text = "Goal: " + str(text)

func show_alert():
	$AnimationPlayer/AlertContainer/AlertSprite.show()
	$AnimationPlayer.play("AlertAnimation")
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	$AnimationPlayer/AlertContainer/AlertSprite.hide()

func check_end_state():
	# Placeholder text/show hide
	if GameState.get_state() == GameState.LOSE:
		$LoseText.show()
	elif GameState.get_state() == GameState.WIN:
		$WinText.show()

func _physics_process(delta):
	update_progress()
	check_end_state()
	
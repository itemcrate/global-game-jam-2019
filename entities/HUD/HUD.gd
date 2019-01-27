extends CanvasLayer

func _ready():
	update_progress()
	set_goal_label("Purple Shell")
	$AnimationPlayer/AlertContainer/AlertLabel.hide()

func update_progress():
	$StatsContainer/Panel/ProgressLabel.text = str(GameData.get("totalCollected")) +"/"+ str(GameData.get("totalRequired"))

func set_goal_label(text):
	$StatsContainer/Panel/GoalLabel.text = "Goal: " + str(text)

func show_alert():
	$AnimationPlayer/AlertContainer/AlertLabel.text = "DANGER!"
	$AnimationPlayer/AlertContainer/AlertLabel.show()
	$AnimationPlayer.play("AlertAnimation")
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	$AnimationPlayer/AlertContainer/AlertLabel.hide()

func _physics_process(delta):
	update_progress()
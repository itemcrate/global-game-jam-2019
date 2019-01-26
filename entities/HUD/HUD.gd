extends CanvasLayer

func _ready():
	update_progress("0/50")
	set_goal_label("Purple Shell")
	show_alert()

func update_progress(score):
	$StatsContainer/Panel/ProgressLabel.text = str(score)

func set_goal_label(text):
	$StatsContainer/Panel/GoalLabel.text = "Goal: " + str(text)

func show_alert():
	$AnimationPlayer/AlertContainer/AlertLabel.text = "DANGER!"
	$AnimationPlayer/AlertContainer/AlertLabel.show()
	$AnimationPlayer.play("AlertAnimation")
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	$AnimationPlayer/AlertContainer/AlertLabel.hide()
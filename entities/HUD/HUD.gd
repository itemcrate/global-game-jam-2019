extends CanvasLayer

func _ready():
	update_progress("0/50")
	set_goal_label("Purple!")
	show_alert()

func update_progress(score):
	$StatsContainer/ProgressLabel.text = str(score)

func set_goal_label(text):
	$StatsContainer/GoalLabel.text = str(text)

func show_alert():
	$AlertContainer/AlertLabel.text = "DANGER!"
	$AlertContainer/AlertLabel.show()
	$AlertTimer.start()

func _on_AlertTimer_timeout():
	$AlertContainer/AlertLabel.hide()
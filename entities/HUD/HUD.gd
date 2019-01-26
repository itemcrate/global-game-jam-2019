extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	update_progress("0/50")
	set_goal_label("Purple!")

func update_progress(score):
	$Container/ProgressLabel.text = str(score)

func set_goal_label(text):
	$Container/GoalLabel.text = str(text)
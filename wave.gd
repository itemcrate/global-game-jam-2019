extends Area2D

enum STATE {READY, FLOW, EBB}

onready var current_state = STATE.READY
onready var tween = $waveTween

func _ready():
	wave_flow()

func wave_ebb():
	current_state = STATE.EBB
	print("Wave position is", self.position)
	tween.interpolate_property(self, "position", self.position, Vector2(0, 0), 3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func wave_flow():
	current_state = STATE.FLOW
	print("Wave position is", self.position)
	tween.interpolate_property(self, "position", Vector2(0,0), Vector2(0, -224), 3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()

# SIGNALS

func _on_wave_body_entered(body):
	# When character is created, update this functionality to:
	# - Check if character is hiding in shell or not
	# - If not hiding, sweep them away
	# - Otherwise, leave them alone
	print(body)

func _on_waveTween_tween_completed(object, key):
	if current_state == STATE.FLOW:
		current_state == STATE.EBB
		wave_ebb()

	elif current_state == STATE.EBB:
		current_state = STATE.READY

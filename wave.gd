extends Area2D

enum STATE {READY, FLOW, EBB}

onready var current_state = STATE.READY
onready var tween = $waveTween

# Temporary draw override for visual representation of wave
# Remove this when wave assets are added
func _draw():
	draw_rect(Rect2(Vector2(0,-224), Vector2(512, 448)), Color("ffffff"))

func _ready():
	pass

func ebb():
	current_state = STATE.EBB
	tween.interpolate_property(self, "position", self.position, Vector2(0, 627), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func flow():
	current_state = STATE.FLOW
	tween.interpolate_property(self, "position", self.position, Vector2(0, 224), 4, Tween.TRANS_LINEAR, Tween.EASE_OUT)
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
		ebb()

	elif current_state == STATE.EBB:
		current_state = STATE.READY

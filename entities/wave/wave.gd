extends Area2D

enum STATE {READY, FLOW, EBB}

onready var current_state = STATE.READY
onready var tween = $waveTween

func _ready():
	pass

func ebb():
	current_state = STATE.EBB
	tween.interpolate_property(self, "position", self.position, Vector2(256, 672), 4, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

func flow():
	current_state = STATE.FLOW
	tween.interpolate_property(self, "position", self.position, Vector2(256, 224), 4, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	$WaveAudioPlayer.play()

# SIGNALS

func _on_wave_body_entered(body):
	if body.is_in_group("player"):
		if body.current_state != body.STATE.HIDE:
			GameState.set_state(GameState.LOSE)

func _on_waveTween_tween_completed(object, key):
	if current_state == STATE.FLOW:
		current_state == STATE.EBB
		ebb()
		# The below assumes the wave is child of overworld
		get_parent().clear_objects()
		get_parent().spawn_obstacles(15)
		get_parent().spawn_collectibles(15)

	elif current_state == STATE.EBB:
		current_state = STATE.READY

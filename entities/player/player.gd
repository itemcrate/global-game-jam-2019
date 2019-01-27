extends KinematicBody2D

enum STATE {MOVE, HIDING, HIDE}

const SPEED = 70

var move_direction = Vector2(0,0)

onready var anim = $playerSprite/AnimationPlayer
onready var sprite = $playerSprite
onready var current_state = STATE.MOVE

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if GameState.get_state() == GameState.LOSE:
		sprite.hide()
	elif GameState.get_state() == GameState.READY:	
		controls_loop()
		movement_loop()
		
		if current_state == MOVE:
			if move_direction != Vector2(0,0):
				anim_switch("walk")
			else:
				anim_switch("idle")

func movement_loop():
	var motion 
	
	if current_state == STATE.MOVE:
		motion = move_direction.normalized() * SPEED
	else:
		motion = move_direction.normalized() * 0
	
	move_and_slide(motion, Vector2(0,0))

func _input(event):
	if GameState.get_state() == GameState.READY:
		if event.is_action_pressed("ui_left"):
			sprite.set_flip_h(false)
		
		if event.is_action_pressed("ui_right"):
			sprite.set_flip_h(true)
				
		if event.is_action_pressed("ui_select"):
			if (current_state == STATE.MOVE):
				current_state = STATE.HIDING
				anim_switch("hide")
				$HideAudioPlayer.play()
			else:
				anim_switch("hide", true)

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	move_direction.x = -int(LEFT) + int(RIGHT)
	move_direction.y = -int(UP) + int(DOWN)
	
func anim_switch(animation, reverse = false):
	var new_anim = animation
	
	if (anim.current_animation != new_anim):
		if !reverse:
			anim.play(new_anim)
		else:
			anim.play_backwards(new_anim)

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "hide":
		anim.stop()
		if current_state == STATE.HIDING:
			current_state = STATE.HIDE
		else:
			current_state = STATE.MOVE

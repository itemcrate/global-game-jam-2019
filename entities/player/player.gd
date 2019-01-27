extends KinematicBody2D

enum STATE {MOVE, HIDE}

const SPEED = 70

var move_direction = Vector2(0,0)

onready var current_state = STATE.MOVE

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	controls_loop()
	movement_loop()

func movement_loop():
	var motion 
	
	if current_state == STATE.MOVE:
		motion = move_direction.normalized() * SPEED
	else:
		motion = 0
	
	move_and_slide(motion, Vector2(0,0))

func _input(event):
	# HIDING
	if event.is_action_pressed("ui_select"):
		if (current_state == STATE.MOVE):
			current_state = STATE.HIDE
		else:
			current_state = STATE.MOVE

func controls_loop():
	var LEFT = Input.is_action_pressed("ui_left")
	var RIGHT = Input.is_action_pressed("ui_right")
	var UP = Input.is_action_pressed("ui_up")
	var DOWN = Input.is_action_pressed("ui_down")
	
	move_direction.x = -int(LEFT) + int(RIGHT)
	move_direction.y = -int(UP) + int(DOWN)

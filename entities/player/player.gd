extends KinematicBody2D

enum STATE {MOVE, HIDE}

onready var current_state = STATE.MOVE

func _ready():
	set_physics_process(true)

func _input(event):
	# HIDING
	if event.is_action_pressed("ui_select"):
		if (current_state == STATE.MOVE):
			current_state = STATE.HIDE
		else:
			current_state = STATE.MOVE

func _physics_process(delta):
	# MOVEMENT
	if Input.is_action_pressed("ui_down"):
		if current_state == STATE.HIDE:
			return
		self.position.y += 1

	elif Input.is_action_pressed("ui_left"):
		if current_state == STATE.HIDE:
			return
		self.position.x -= 1

	elif Input.is_action_pressed("ui_right"):
		if current_state == STATE.HIDE:
			return
		self.position.x += 1

	elif Input.is_action_pressed("ui_up"):
		if current_state == STATE.HIDE:
			return
		self.position.y -= 1

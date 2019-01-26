extends KinematicBody2D

enum STATE {MOVE, HIDE}

onready var current_state = STATE.MOVE

# Temporary draw override for visual representation of player
# Remove this when wave assets are added
func _draw():
	draw_rect(Rect2(Vector2(0,0), Vector2(16, 16)), Color("f79259"))

func _ready():
	set_physics_process(true)

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

	# HIDING
	if Input.is_action_pressed("ui_select"):
		current_state = STATE.HIDE

	elif Input.is_action_just_released("ui_select"):
		current_state = STATE.MOVE

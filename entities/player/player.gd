extends KinematicBody2D

# Temporary draw override for visual representation of player
# Remove this when wave assets are added
func _draw():
	draw_rect(Rect2(Vector2(0,0), Vector2(16, 16)), Color("f79259"))

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		self.position.y += 1

	elif Input.is_action_pressed("ui_left"):
		self.position.x -= 1

	elif Input.is_action_pressed("ui_right"):
		self.position.x += 1

	elif Input.is_action_pressed("ui_up"):
		self.position.y -= 1

extends RigidBody2D

# Temporary draw override for visual representation of player
# Remove this when wave assets are added
func _draw():
	draw_circle(Vector2(0,0), 8, Color("693970"))

func _ready():
	pass

func _integrate_forces(state):

	if linear_velocity.x < 0:
		linear_velocity.x += 1
	elif linear_velocity.x > 0:
		linear_velocity.x -= 1

	if linear_velocity.y < 0:
		linear_velocity.y += 1
	elif linear_velocity.y > 0:
		linear_velocity.y -= 1

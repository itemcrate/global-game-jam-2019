extends RigidBody2D

onready var collider = $obstacleCollider

func _ready():
	pass

#func _integrate_forces(state):
#	print(self.get_colliding_bodies())
#	if linear_velocity.x < 0:
#		linear_velocity.x += 1
#	elif linear_velocity.x > 0:
#		linear_velocity.x -= 1
#
#	if linear_velocity.y < 0:
#		linear_velocity.y += 1
#	elif linear_velocity.y > 0:
#		linear_velocity.y -= 1

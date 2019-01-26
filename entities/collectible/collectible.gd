extends Area2D

# Temporary draw override for visual representation of collectible
# Remove this when wave assets are added
func _draw():
	draw_circle(Vector2(0,0), 8, Color("A8E365"))

func _ready():
	pass

# SIGNALS

func _on_collectible_body_entered(body):
	if body.is_in_group("player"):
		GameData.increment("totalCollected")
		self.queue_free()

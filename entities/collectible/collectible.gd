extends Area2D

onready var sprite = $collectibleSprite
onready var texture_base = "res://assets/sprites/"

var color
var color_options = ["blue", "green", "red"]
var texture

func _ready():
	# Randomly assign a collectible value
	randomize()
	var random_int = randi() % color_options.size()
	color = color_options[random_int]
	texture = load(texture_base + color + "_pickup" + String(random_int + 1) + ".png")
	sprite.texture = texture

# SIGNALS

func _on_collectible_body_entered(body):
	if body.is_in_group("player"):
		if self.color == GameData.get("colorRequired"):
			GameData.increment("totalCollected")
		self.queue_free()
